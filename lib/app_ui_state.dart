import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/electronic_app_model.dart';

part 'app_ui_state.freezed.dart';

@freezed
class AppUIState with _$AppUIState {
  factory AppUIState({
    @Default('') String pathNotification,
  }) = _AppUIState;
}
