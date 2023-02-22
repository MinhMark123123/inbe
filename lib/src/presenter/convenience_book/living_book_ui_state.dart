import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/living_guide_model.dart';

part 'living_book_ui_state.freezed.dart';

@freezed
class LivingBookUIState with _$LivingBookUIState {
  factory LivingBookUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default(AsyncValue.loading())
        AsyncValue<List<LivingGuideModel>> livingGuides,
  }) = _LivingBookUIState;
}
