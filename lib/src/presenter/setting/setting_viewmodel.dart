import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/dto/request/update_user_request.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:inabe/src/data/model/user.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/setting/setting_ui_state.dart';

final _settingPageUiStateProvider =
StateProvider.autoDispose<SettingUIState>((ref) {
  return SettingUIState();
});
final settingPageControllerProvider =
Provider.autoDispose<SettingViewModel>((ref) {
  return SettingViewModel(
    uiState: ref.watch(_settingPageUiStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class SettingViewModel extends ViewModel {
  final UserRepository userRepository;
  final TopRepository topRepository;

  AutoDisposeStateProvider<SettingUIState> get ui =>
      _settingPageUiStateProvider;

  ProviderListenable<AsyncValue<Map<InterestModel, bool>>>
  get mapInterestModel => ui.select((value) => value.mapInterestModel);

  ProviderListenable<UserModel?> get userModelProvider =>
      ui.select((value) => value.userModel);

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMsg);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  ProviderListenable<bool> get isSuccessRequestOTP =>
      ui.select((value) => value.isSuccessRequestOTP);

  ProviderListenable<bool> get isTurnOn => ui.select((value) => value.isTurnOn);

  final StateController<SettingUIState> uiState;

  TextEditingController nicknameController = TextEditingController();

  SettingViewModel({
    required this.userRepository,
    required this.topRepository,
    required this.uiState,
  }) {
    print("SettingViewModel constructor");
  }

  @override
  void onInitState() {
    getDataFromApi();
    super.onInitState();
  }

  Future<void> getDataFromApi() async {
    await getListInterest();
    await getBasicInfo();
  }

  @override
  bool enableBindAppLifeCycle() => true;

  Future<void> getBasicInfo() async {
    var response = await userRepository.getBasicInfo();

    nicknameController.text = response.data.nickname ?? '';
    _setDataCategory(response.data.interestCategories);
    setDataTurnOn(response.data.pushNotifications ?? true);

    print("ttt $response");
  }

  void _setDataCategory(List<String>? categories) {
    userRepository.saveListCategory(categories);
    if (categories == null) return;
    final data = uiState.state.mapInterestModel.value;
    if (data != null) {
      for (var element in categories) {
        final interest = data.keys.toList()[int.parse(element) - 1];
        selectedCategory(interest, true);
      }
    }
  }

  void setDataTurnOn(bool isTurnOn) {
    userRepository.saveTurnOn(isTurnOn);
    uiState.update((state) => state.copyWith(isTurnOn: isTurnOn));
  }

  Future<void> getListInterest() async {
    var response = await topRepository.getInterestsApi();
    uiState.update(
          (state) =>
          state.copyWith(
            mapInterestModel: AsyncValue.data(_mapCategories(response)),
          ),
    );

    // topRepository.getInterestsApi().then(
    //   (value) {
    //     print("ttt ------- add");
    //     uiState.update(
    //       (state) => state.copyWith(
    //         mapInterestModel: AsyncValue.data(_mapCategories(value)),
    //       ),
    //     );
    //   },
    // ).catchError((obj) {
    //   ApiError(obj, errorData: (code, msg) {});
    // });
  }

  Future<void> requestAccountOTP() async {
    var response = await userRepository.requestAccountOTP();

    if (response.data.message == 'OK') {
      uiState.update((state) => state.copyWith(isSuccessRequestOTP: true));
    }

    print("ttt requestAccountOTP ${response.data.message}");
  }

  Map<InterestModel, bool> _mapCategories(InterestResponse value) {
    return Map.fromIterables(
        value.data, List.generate(value.data.length, (index) => false));
  }

  void selectedCategory(InterestModel interestModel, bool isChecked) {
    uiState.update((state) => state.selectedCategory(interestModel, isChecked));
  }

  void checkTurnOnNotification(bool isTurnOn) {
    uiState.update((state) => state.copyWith(isTurnOn: isTurnOn));
  }

  Future<void> doUpdateUser() async {
    final categories = convertCategories();

    final request = UpdateUserRequest(
        nickname: nicknameController.text,
        pushNotifications: uiState.state.isTurnOn.toString(),
        interestCategories: categories);

    print("ttt resquest = $request\n"
        "json = ${request.toJson()}");

    userRepository.updateUser(request).then(
          (value) {
        uiState.update((state) => state.copyWith(isSuccess: true));
      },
    ).catchError((obj) {
      ApiError(obj,
          errorData: (code, msg) =>
              uiState
                  .update((state) => state.copyWith(errorMsg: "$code\n$msg")));
    });
  }

  List<String> convertCategories() {
    final list = uiState.state.mapInterestModel.value?.values.toList();
    if (list == null) return [];
    List<String> result = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i]) {
        result.add("${i + 1}");
      }
    }
    return result;
  }

  void resetState() {
    uiState.update((state) => state.copyWith(errorMsg: ''));
  }
}
