import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/faq_model.dart';

part 'faq_ui_state.freezed.dart';

@freezed
class FAQUIState with _$FAQUIState {
  factory FAQUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default(AsyncValue.loading()) AsyncValue<List<FAQModel>> otherApps,
  }) = _FAQUIState;
}
