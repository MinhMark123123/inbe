import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/dto/request/user_request.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/register/register_ui_state.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';

final _registerPageUiStateProvider =
    StateProvider.autoDispose<RegisterUIState>((ref) {
  return RegisterUIState();
});
final registerPageControllerProvider =
    Provider.autoDispose<RegisterViewModel>((ref) {
  return RegisterViewModel(
    uiState: ref.watch(_registerPageUiStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class RegisterViewModel extends ViewModel {
  final UserRepository userRepository;
  final TopRepository topRepository;

  AutoDisposeStateProvider<RegisterUIState> get ui =>
      _registerPageUiStateProvider;

  ProviderListenable<bool> get disableButtonProvider =>
      ui.select((value) => value.disableButton);

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMessage);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  ProviderListenable<AsyncValue<Map<InterestModel, bool>>> get asynCagetory =>
      ui.select((value) => value.checkBoxList);

  ProviderListenable<List<InterestModel>> get interests =>
      ui.select((value) => value.interests);

  ProviderListenable<bool> get isTurnOn => ui.select((value) => value.isTurnOn);

  final StateController<RegisterUIState> uiState;

  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();
  bool isValidPassword = false;

  RegisterViewModel({
    required this.userRepository,
    required this.topRepository,
    // required this.restClient,
    required this.uiState,
  }) {
    print("RegisterViewModel constructor");
  }

  @override
  void onInitState() {
    getListInterest();
    super.onInitState();
  }

  @override
  bool enableBindAppLifeCycle() => true;

  void getListInterest() {
    Future.delayed(Duration.zero, () {
      uiState.update(
        (state) => state.copyWith(checkBoxList: const AsyncValue.loading()),
      );
    });
    topRepository.getInterestsApi().then(
      (value) {
        uiState.update((state) => state.copyWith(interests: value.data));
        uiState.update(
          (state) => state.copyWith(
            checkBoxList: AsyncValue.data(_mapCategories(value)),
          ),
        );
      },
    ).catchError((obj) {
      ApiError(
        obj,
        errorData: (int? code, String? message) {
          uiState.update(
              (state) => state.copyWith(errorMessage: "$message"));
        },
      );
    });
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

  void onChangeEmail() {
    isValidateData(updateUI: true);
  }

  void onChangeNickname() {
    isValidateData(updateUI: true);
  }

  bool isValidateData({bool updateUI = false}) {
    bool isError = emailController.validateEmail().isNotEmpty ||
        nicknameController.validateNickname().isNotEmpty ||
        !isValidPassword;
    if (updateUI) {
      print("ttt $isError");
      uiState.update((state) => state.copyWith(disableButton: isError));
    }
    return !isError;
  }

  Future<void> doRegister() async {
    final categories = convertCategories();
    final request = UserRequest(
        email: emailController.text,
        nickname: nicknameController.text,
        password: passwordController.text,
        pushNotifications: uiState.state.isTurnOn.toString(),
        interestCategories: categories);

    print("ttt resquest = $request\n"
        "json = ${request.toJson()}");

    userRepository.register(request).then(
      (value) {
        final headers = value.response.headers;
        userRepository.saveDataLogin(headers);
        uiState.update((state) => state.copyWith(isSuccess: true));
      },
    ).catchError((obj) {
      ApiError(
        obj,
        errorData: (int? code, String? message) {
          uiState.update(
              (state) => state.copyWith(errorMessage: "$message"));
        },
      );
    });
  }

  List<String> convertCategories() {
    final list = uiState.state.listCheckBox.values.toList();
    List<String> result = [];
    for (int i = 0; i < list.length; i++) {
      if (list[i]) {
        result.add("${i + 1}");
      }
    }

    return result;
  }

  void setValidPassword(bool isValid) {
    isValidPassword = isValid;
    isValidateData(updateUI: true);
  }

  @override
  void onDispose() {
    nicknameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.onDispose();
  }

  void resetErrorMsg() {
    uiState.update((state) => state.copyWith(errorMessage: ''));
  }

  void resetUIDefault() {
    uiState.update((state) => state.copyWith(errorMessage: ''));
    uiState.update((state) => state.copyWith(isSuccess: false));
  }
}
