import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/other_app_model.dart';

part 'related_ui_state.freezed.dart';

@freezed
class RelatedUIState with _$RelatedUIState {
  factory RelatedUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default(AsyncValue.loading())
    AsyncValue<List<OtherAppModel>> otherApps,
  }) = _RelatedUIState;

}
