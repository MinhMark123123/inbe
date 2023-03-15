import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/forgot_password/reset/reset_password_ui_state.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';

final _resetPasswordUIStateProvider =
    StateProvider.autoDispose<ResetPasswordUIState>((ref) {
  return ResetPasswordUIState();
});
final resetPasswordControllerProvider =
    Provider.autoDispose<ResetPasswordViewModel>((ref) {
  return ResetPasswordViewModel(
    uiState: ref.watch(_resetPasswordUIStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
  );
});

class ResetPasswordViewModel extends ViewModel {
  final UserRepository userRepository;

  AutoDisposeStateProvider<ResetPasswordUIState> get ui =>
      _resetPasswordUIStateProvider;

  ProviderListenable<String> get errorPassword =>
      ui.select((value) => value.errorPassword);

  ProviderListenable<String> get errorConfirmPassword =>
      ui.select((value) => value.errorConfirmPassword);

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMessage);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  final StateController<ResetPasswordUIState> uiState;

  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  late ForgotPasswordRequest forgotPasswordRequest;
  bool isSubmit = false;

  ResetPasswordViewModel({
    required this.userRepository,
    // required this.restClient,
    required this.uiState,
  }) {
    print("ttt UpdateAccountViewModel constructor");
  }

  @override
  bool enableBindAppLifeCycle() => true;

  void onChangeConfirmPassword() {
    uiState.update((state) => state.copyWith(errorConfirmPassword: ''));
  }

  Future<void> resetPassword() async {
    // bool isError = false;
    // String? passwordValid = passwordController.validatePassword();
    // String? confirmValid =
    //     rePasswordController.validateConfirmPassword(passwordController.text);
    // if (passwordValid.isNotEmpty) {
    //   isError = true;
    // }
    // uiState.update((state) => state.copyWith(errorPassword: passwordValid));
    //
    // if (confirmValid.isNotEmpty) {
    //   isError = true;
    // }
    // uiState
    //     .update((state) => state.copyWith(errorConfirmPassword: confirmValid));

    if (!isSubmit) {
      return;
    } else {
      final request = ForgotPasswordRequest(
        email: forgotPasswordRequest.email,
        password: passwordController.text,
        otp: forgotPasswordRequest.otp,
      );
      print("ttt resquest = $request\n"
          "json = ${request.toJson()}");

      userRepository.resetPassword(request).then(
        (value) {
          uiState.update((state) => state.copyWith(isSuccess: true));
        },
      ).catchError((obj) {
        ApiError(obj,
            errorData: (code, msg) => {
                  uiState.update(
                      (state) => state.copyWith(errorMessage: "$code\n$msg"))
                });
      });
    }
  }

  void setSubmit(bool isSubmit) {
    this.isSubmit = isSubmit;
  }

  void setDataRequest(ForgotPasswordRequest request) {
    forgotPasswordRequest = request;
  }
}
