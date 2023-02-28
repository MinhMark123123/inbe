import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_account_otp_ui_state.freezed.dart';

@freezed
class UpdateAccountOTPUIState with _$UpdateAccountOTPUIState {
  factory UpdateAccountOTPUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default('') String otp,
  }) = _UpdateAccountOTPUIState;
}
