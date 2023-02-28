import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:riverpod/riverpod.dart';

part 'reset_password_ui_state.freezed.dart';

@freezed
class ResetPasswordUIState with _$ResetPasswordUIState {
  factory ResetPasswordUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default('') String errorPassword,
    @Default('') String errorConfirmPassword,
  }) = _ResetPasswordUIState;

}
