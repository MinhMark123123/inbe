import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/dto/request/update_user_info_request.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/update_account/update_user_ui_state.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';

final _updateUserUiStateProvider =
    StateProvider.autoDispose<UpdateUserUIState>((ref) {
  return UpdateUserUIState();
});
final updateAccountPageControllerProvider =
    Provider.autoDispose<UpdateAccountViewModel>((ref) {
  return UpdateAccountViewModel(
    uiState: ref.watch(_updateUserUiStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
  );
});

class UpdateAccountViewModel extends ViewModel {
  final UserRepository userRepository;

  AutoDisposeStateProvider<UpdateUserUIState> get ui =>
      _updateUserUiStateProvider;

  ProviderListenable<String> get errorPassword =>
      ui.select((value) => value.errorPassword);

  ProviderListenable<String> get errorConfirmPassword =>
      ui.select((value) => value.errorConfirmPassword);

  ProviderListenable<String> get errorEmail =>
      ui.select((value) => value.errorMail);

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMessage);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  final StateController<UpdateUserUIState> uiState;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  String otp = '';

  UpdateAccountViewModel({
    required this.userRepository,
    // required this.restClient,
    required this.uiState,
  }) {
    print("ttt UpdateAccountViewModel constructor");
  }

  @override
  bool enableBindAppLifeCycle() => true;

  void onChangeEmail() {
    uiState.update((state) => state.copyWith(errorMail: ''));
  }

  void onChangePassword() {
    uiState.update((state) => state.copyWith(errorPassword: ''));
  }

  void onChangeConfirmPassword() {
    uiState.update((state) => state.copyWith(errorConfirmPassword: ''));
  }

  Future<void> doUpdateAccount() async {
    bool isError = false;
    String? formattedPhone = emailController.validateEmail();
    String? passwordValid = passwordController.validatePassword();
    String? confirmValid =
        rePasswordController.validateConfirmPassword(passwordController.text);
    if (formattedPhone.isNotEmpty) {
      isError = true;
    }
    uiState.update((state) => state.copyWith(errorMail: formattedPhone));
    if (passwordValid.isNotEmpty) {
      isError = true;
    }
    uiState.update((state) => state.copyWith(errorPassword: passwordValid));

    if (confirmValid.isNotEmpty) {
      isError = true;
    }
    uiState
        .update((state) => state.copyWith(errorConfirmPassword: confirmValid));

    if (isError) {
      return;
    } else {
      final request = UpdateUserInfoRequest(
        email: emailController.text,
        password: passwordController.text,
        otp: otp,
      );

      print("ttt resquest = $request\n"
          "json = ${request.toJson()}");
      // return;

      userRepository.updateAccount(request).then(
        (value) {
          uiState.update((state) => state.copyWith(isSuccess: true));
        },
      ).catchError((obj) {
        ApiError(obj, errorData: (code, msg) => {});
      });
    }
  }

  void setDataOTP(String otp) {
    this.otp = otp;
  }
}
