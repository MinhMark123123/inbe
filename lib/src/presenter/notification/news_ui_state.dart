import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/notification_model.dart';

part 'news_ui_state.freezed.dart';

@freezed
class NewsUIState with _$NewsUIState {
  factory NewsUIState({
    @Default(AsyncLoading()) AsyncValue<List<NotificationModel>> notifications,
    @Default('') String errorMessage,
  }) = _NewsUIState;
}
