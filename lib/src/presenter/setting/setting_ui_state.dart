import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:inabe/src/data/dto/response/user_response.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:inabe/src/data/model/user.dart';
import 'package:riverpod/riverpod.dart';

part 'setting_ui_state.freezed.dart';

@freezed
class SettingUIState with _$SettingUIState {
  factory SettingUIState({
    @Default(true) bool isTurnOn,
    @Default(false) bool isSuccess,
    @Default(false) bool isSuccessRequestOTP,
    @Default('') String errorMsg,
    @Default(AsyncValue.loading())
        AsyncValue<Map<InterestModel, bool>> mapInterestModel,
    @Default(null) UserModel? userModel,
    @Default('') String nickname,
  }) = _SettingUIState;
}

extension SettingUIStateX on SettingUIState {
  SettingUIState selectedCategory(
      InterestModel interestModel, bool isChecked) {
    Map<InterestModel, bool> map = Map.from(mapInterestModel.value ?? {});
    if (!map.containsKey(interestModel)) {
      map.putIfAbsent(interestModel, () => isChecked);
    } else {
      map.update(interestModel, (value) => isChecked);
    }

    return copyWith(mapInterestModel: AsyncValue.data(map));
  }

  Map<InterestModel, bool> get listCheckBox =>
      Map.from(mapInterestModel.value ?? {});
}
