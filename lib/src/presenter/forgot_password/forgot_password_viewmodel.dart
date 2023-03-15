import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/forgot_password/forgot_password_ui_state.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';

final _forgotPasswordUiStateProvider =
    StateProvider.autoDispose<ForgotPasswordUIState>((ref) {
  return ForgotPasswordUIState();
});
final forgotPasswordPageControllerProvider =
    Provider.autoDispose<ForgotPasswordViewModel>((ref) {
  return ForgotPasswordViewModel(
    uiState: ref.watch(_forgotPasswordUiStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
  );
});

class ForgotPasswordViewModel extends ViewModel {
  final UserRepository userRepository;

  AutoDisposeStateProvider<ForgotPasswordUIState> get ui =>
      _forgotPasswordUiStateProvider;

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMsg);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  final StateController<ForgotPasswordUIState> uiState;

  TextEditingController emailController = TextEditingController();

  ForgotPasswordViewModel({
    required this.userRepository,
    required this.uiState,
  }) {
    print("ForgotPasswordViewModel constructor");
  }

  @override
  bool enableBindAppLifeCycle() => true;

  Future<void> requestForgotPasswordOTP() async {
    var response = await userRepository.requestAccountOTP();

    if (response.data.message == 'OK') {
      uiState.update((state) => state.copyWith(isSuccess: true));
    }

    print("ttt requestAccountOTP ${response.data.message}");
  }

  Future<void> doRecoverPassword() async {
    if (emailController.validateEmail().isNotEmpty) {
      return;
    }

    userRepository.requestForgotPasswordOTP(emailController.text.trim()).then(
      (value) {
        uiState.update((state) => state.copyWith(isSuccess: true));
      },
    ).catchError((obj) {
      ApiError(obj,
          errorData: (code, msg) => uiState
              .update((state) => state.copyWith(errorMsg: "$code\n$msg")));
    });
  }

  void resetErrorMsg() {
    uiState.update((state) => state.copyWith(errorMsg: ''));
  }
}
