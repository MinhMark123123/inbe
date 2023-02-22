import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/electronic_app_model.dart';

part 'electronic_ui_state.freezed.dart';

@freezed
class ElectronicAppUIState with _$ElectronicAppUIState {
  factory ElectronicAppUIState({
    @Default(false) bool isSuccess,
    @Default('') String errorMessage,
    @Default('') String selectCategory,
    @Default('') String selectMidCategory,
    @Default(AsyncValue.loading())
        AsyncValue<List<ElectronicAppModel>> otherApps,
  }) = _ElectronicAppUIState;
}
