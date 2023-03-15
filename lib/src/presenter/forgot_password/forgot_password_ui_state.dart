import 'package:freezed_annotation/freezed_annotation.dart';

part 'forgot_password_ui_state.freezed.dart';

@freezed
class ForgotPasswordUIState with _$ForgotPasswordUIState {
  factory ForgotPasswordUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMsg,
  }) = _ForgotPasswordUIState;
}
