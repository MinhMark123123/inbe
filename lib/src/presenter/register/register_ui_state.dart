import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:riverpod/riverpod.dart';

part 'register_ui_state.freezed.dart';

@freezed
class RegisterUIState with _$RegisterUIState {
  factory RegisterUIState({
    @Default(true) bool isTurnOn,
    @Default(false) bool isSuccess,
    @Default(true) bool disableButton,
    @Default([]) List<InterestModel> interests,
    @Default(AsyncValue.loading())
        AsyncValue<Map<InterestModel, bool>> checkBoxList,
    @Default('') String errorMessage,
  }) = _RegisterUIState;

// factory RegisterUIState.loading() = Loading;
}

extension RegisterUIStateX on RegisterUIState {
  RegisterUIState selectedCategory(
      InterestModel interestModel, bool isChecked) {
    Map<InterestModel, bool> map = Map.from(checkBoxList.value ?? {});
    if (!map.containsKey(interestModel)) {
      map.putIfAbsent(interestModel, () => isChecked);
    } else {
      map.update(interestModel, (value) => isChecked);
    }

    return copyWith(checkBoxList: AsyncValue.data(map));
  }

  Map<InterestModel, bool> get listCheckBox =>
      Map.from(checkBoxList.value ?? {});
}
