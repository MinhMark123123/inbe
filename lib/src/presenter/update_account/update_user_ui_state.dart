import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:riverpod/riverpod.dart';

part 'update_user_ui_state.freezed.dart';

@freezed
class UpdateUserUIState with _$UpdateUserUIState {
  factory UpdateUserUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default('') String errorMail,
    @Default('') String errorPassword,
    @Default('') String errorConfirmPassword,
  }) = _UpdateUserUIState;

}
