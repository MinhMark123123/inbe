import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/data/model/event_model.dart';

part 'event_ui_state.freezed.dart';

@freezed
class EventUIState with _$EventUIState {
  factory EventUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default(AsyncValue.loading()) AsyncValue<List<EventModel>> events,
  }) = _EventUIState;
}
