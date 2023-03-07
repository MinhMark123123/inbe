/*
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SecondScreenUIState {
  final counterProvider = StateProvider.autoDispose<int>((ref) {
    return 0;
  });
  StateController<int> get counter => counterProvider.state;
}
*/
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inabe/src/data/model/convenience_model.dart';
import 'package:inabe/src/data/model/electronic_app_model.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/data/model/top_slider_model.dart';

part 'ui_state.freezed.dart';

@freezed
class HomeUIState with _$HomeUIState {
  factory HomeUIState({
    @Default([]) List<TopSliderModel> topSlides,
    @Default([]) List<String> images,
    @Default([]) List<NotificationModel> notifications,
    @Default([]) List<ConvenienceModel> conveniences,
    @Default('') String errorMessage,
  }) = _HomeUIState;
}
