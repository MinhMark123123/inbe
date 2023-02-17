import 'package:aac_core/aac_core.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/dto/request/user_request.dart';
import 'package:inabe/src/data/dto/response/interest_response.dart';
import 'package:inabe/src/data/model/interest_model.dart';
import 'package:inabe/src/di/di_config.dart';
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
    restClient: ref.read(apiClientProvider),
  );
});

class RegisterViewModel extends ViewModel {
  final RestClient restClient;

  AutoDisposeStateProvider<RegisterUIState> get ui =>
      _registerPageUiStateProvider;

  ProviderListenable<String> get errorEmail =>
      ui.select((value) => value.errorMail);

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMessage);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  ProviderListenable<AsyncValue<Map<InterestModel, bool>>> get asynCagetory =>
      ui.select((value) => value.checkBoxList);

  ProviderListenable<List<InterestModel>> get interests =>
      ui.select((value) => value.interests);

  ProviderListenable<Map<InterestModel, bool>> get checkBoxList =>
      ui.select((value) => value.listCheckBox);

  ProviderListenable<bool> get isTurnOn => ui.select((value) => value.isTurnOn);

  final StateController<RegisterUIState> uiState;

  TextEditingController nicknameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController rePasswordController = TextEditingController();


  RegisterViewModel({required this.restClient, required this.uiState}) {
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
    restClient.interests().then(
      (value) {
        uiState.update((state) => state.copyWith(interests: value.data));
        uiState.update(
          (state) => state.copyWith(
            checkBoxList: AsyncValue.data(_mapCategories(value)),
          ),
        );
      },
    ).catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} : ${res?.statusMessage}");
          uiState.update((state) => state.copyWith(
              errorMessage: res?.statusMessage ?? "Request api error"));
          break;
        default:
          uiState
              .update((state) => state.copyWith(errorMessage: "Default error"));
          break;
      }
    });
  }

  Map<InterestModel, bool> _mapCategories(InterestResponse value) {
    return Map.fromIterables(
        value.data, List.generate(value.data.length, (index) => false));
  }

  void validateData(String? value) {
    if (value != null) {
      uiState.update((state) => state.copyWith(errorMail: "map"));
    }
  }

  void register(UserRequest userRequest) {
    // uiState.update((state) => )
    restClient
        .register(userRequest)
        .then((value) => {
              //show success
              //     uiState
              //         .update((state) => state.copyWith(electronicApps: value.data))
            })
        .catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} : ${res?.statusMessage}");
          uiState.update((state) => state.copyWith(
              errorMessage: res?.statusMessage ?? "Request api error"));
          break;
        default:
          uiState
              .update((state) => state.copyWith(errorMessage: "Default error"));
          break;
      }
    });
  }

  void selectedCategory(InterestModel interestModel, bool isChecked) {
    uiState.update((state) => state.selectedCategory(interestModel, isChecked));
  }

  void checkTurnOnNotification(bool isTurnOn) {
    uiState.update((state) => state.copyWith(isTurnOn: isTurnOn));
  }

  void onChange() {
    uiState
        .update((state) => state.copyWith(errorMail: ''));
  }

  Future<void> doRegister() async {
    String? formattedPhone = emailController.validateEmail();
    // bool passwordValid = _passwordController.validatePassword();
    if (formattedPhone.isNotEmpty) {
      uiState
          .update((state) => state.copyWith(errorMail: formattedPhone));
      return;
    }


  }
}
