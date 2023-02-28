import 'package:aac_core/aac_core.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
    // restClient: ref.read(apiClientProvider),
    userRepository: ref.read(userRepositoryProvider),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class RegisterViewModel extends ViewModel {
  // final RestClient restClient;

  final UserRepository userRepository;
  final TopRepository topRepository;

  AutoDisposeStateProvider<RegisterUIState> get ui =>
      _registerPageUiStateProvider;

  ProviderListenable<String> get errorPassword =>
      ui.select((value) => value.errorPassword);

  ProviderListenable<String> get errorConfirmPassword =>
      ui.select((value) => value.errorConfirmPassword);

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

  void selectedCategory(InterestModel interestModel, bool isChecked) {
    uiState.update((state) => state.selectedCategory(interestModel, isChecked));
  }

  void checkTurnOnNotification(bool isTurnOn) {
    uiState.update((state) => state.copyWith(isTurnOn: isTurnOn));
  }

  void onChangeEmail() {
    uiState.update((state) => state.copyWith(errorMail: ''));
  }

  void onChangePassword() {
    uiState.update((state) => state.copyWith(errorPassword: ''));
  }

  void onChangeConfirmPassword() {
    uiState.update((state) => state.copyWith(errorConfirmPassword: ''));
  }

  Future<void> doRegister() async {
    bool isError = false;
    String? formattedPhone = emailController.validateEmail();
    String? passwordValid = passwordController.validatePassword();
    String? confirmValid =
        rePasswordController.validateConfirmPassword(passwordController.text);
    if (formattedPhone.isNotEmpty) {
      isError = true;
    }
    uiState.update((state) => state.copyWith(errorMail: formattedPhone));
    if (passwordValid.isNotEmpty) {
      isError = true;
    }
    uiState.update((state) => state.copyWith(errorPassword: passwordValid));

    if (confirmValid.isNotEmpty) {
      isError = true;
    }
    uiState
        .update((state) => state.copyWith(errorConfirmPassword: confirmValid));

    if (isError) {
      return;
    } else {
      final categories = convertCategories();

      final request = UserRequest(
          email: emailController.text,
          nickname: nicknameController.text,
          password: passwordController.text,
          pushNotifications: uiState.state.isTurnOn.toString(),
          interestCategories: categories);

      print("ttt resquest = $request\n"
          "json = ${request.toJson()}");
      // return;

      userRepository.register(request).then(
        (value) {
          if (value.data != null) {
            uiState.update((state) => state.copyWith(isSuccess: true));
          }
        },
      ).catchError((obj) {
        switch (obj.runtimeType) {
          case DioError:
            final res = (obj as DioError).response;
            Map<String, dynamic> baseRes = res?.data;
            print(
                "Got error : ${res?.statusCode} : ${baseRes["error"]['message']}");
            uiState.update((state) => state.copyWith(
                errorMessage: res?.statusMessage ?? "Request api error"));
            break;
          default:
            uiState.update(
                (state) => state.copyWith(errorMessage: "Default error"));
            break;
        }
      });
    }
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
}
