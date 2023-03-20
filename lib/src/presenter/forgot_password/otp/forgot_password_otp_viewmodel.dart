import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/dto/request/forgot_password_request.dart';
import 'package:inabe/src/data/repository/user/forgot_password_repository.dart';
import 'package:inabe/src/presenter/forgot_password/otp/forgot_password_otp_ui_state.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';

final _forgotPasswordOTPUiStateProvider =
    StateProvider.autoDispose<ForgotPasswordOTPUIState>((ref) {
  return ForgotPasswordOTPUIState();
});
final forgotPasswordOTPPageControllerProvider =
    Provider.autoDispose<ForgotPasswordOTPViewModel>((ref) {
  return ForgotPasswordOTPViewModel(
    uiState: ref.watch(_forgotPasswordOTPUiStateProvider.notifier),
    forgotPasswordRepository: ref.read(forgotPasswordRepositoryProvider),
  );
});

class ForgotPasswordOTPViewModel extends ViewModel {
  final ForgotPasswordRepository forgotPasswordRepository;

  AutoDisposeStateProvider<ForgotPasswordOTPUIState> get ui =>
      _forgotPasswordOTPUiStateProvider;

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMsg);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  final StateController<ForgotPasswordOTPUIState> uiState;

  TextEditingController otpController = TextEditingController();
  String email = '';

  ForgotPasswordOTPViewModel({
    required this.forgotPasswordRepository,
    required this.uiState,
  }) {
    print("SettingViewModel constructor");
  }

  @override
  bool enableBindAppLifeCycle() => true;

  Future<void> validatePasswordOTP() async {
    if (otpController.validateOTP().isNotEmpty) {
      return;
    }

    final request =
        ForgotPasswordRequest(email: email, otp: otpController.text.trim());

    forgotPasswordRepository.validForgotPasswordOTP(request).then(
      (value) {
        uiState.update((state) => state.copyWith(isSuccess: true));
      },
    ).catchError((obj) {
      ApiError(obj,
          errorData: (code, msg) => uiState
              .update((state) => state.copyWith(errorMsg: "$msg")));
    });
  }

  void setDataEmail(String email) {
    this.email = email;
  }

  void resetErrorMsg() {
    uiState.update((state) => state.copyWith(errorMsg: ''));
  }


  @override
  void onDispose() {
    otpController.dispose();
    super.onDispose();
  }
}
