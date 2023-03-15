import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_ui_state.freezed.dart';

@freezed
class LoginUIState with _$LoginUIState {
  factory LoginUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default(false) bool isLoading,
  }) = _LoginUIState;

// factory RegisterUIState.loading() = Loading;
}
