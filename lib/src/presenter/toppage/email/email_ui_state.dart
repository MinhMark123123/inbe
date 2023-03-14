import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/email_model.dart';

part 'email_ui_state.freezed.dart';

@freezed
class EmailUIState with _$EmailUIState {
  factory EmailUIState({
    @Default(true) bool isLoadedPage,
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default([]) List<EmailModel> dataList,
  }) = _EmailUIState;
}
