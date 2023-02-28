import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_otp_ui_state.freezed.dart';

@freezed
class ForgotPasswordOTPUIState with _$ForgotPasswordOTPUIState {
  factory ForgotPasswordOTPUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMsg,
    @Default('') String errorEmail,
  }) = _ForgotPasswordOTPUIState;
}
