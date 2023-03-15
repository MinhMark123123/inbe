import 'package:aac_core/aac_core.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/dto/request/login_request.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/login/login_ui_state.dart';
import 'package:inabe/src/utils/extensions/input_controller_extension.dart';
import 'package:riverpod/riverpod.dart';

final _loginPageUiStateProvider =
    StateProvider.autoDispose<LoginUIState>((ref) {
  return LoginUIState();
});
final loginPageControllerProvider = Provider.autoDispose<LoginViewModel>((ref) {
  return LoginViewModel(
    uiState: ref.watch(_loginPageUiStateProvider.notifier),
    repository: ref.read(userRepositoryProvider),
  );
});

class LoginViewModel extends ViewModel {
  final UserRepository repository;
  final StateController<LoginUIState> uiState;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  ProviderListenable<bool> get isLoadingProvider =>
      ui.select((value) => value.isLoading);

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMessage);

  ProviderListenable<bool> get isLoginSuccess =>
      ui.select((value) => value.isSuccess);

  AutoDisposeStateProvider<LoginUIState> get ui => _loginPageUiStateProvider;

  LoginViewModel({
    required this.uiState,
    required this.repository,
  });

  Future<void> doLogin() async {
    bool isError = validateDataLogin();

    if (isError) {
      return;
    } else {
      final request = LoginRequest(
          email: emailController.text, password: passwordController.text);

      print("ttt resquest = $request\n"
          "json = ${request.toJson()}");

      repository.login(request).then((value) {
        final headers = value.response.headers;
        print("ttt $value ::: ${headers.value("access-token")}");
        print("ttt $value ::: ${headers.value("uid")}");
        print("ttt $value ::: ${headers.value("client")}");

        if (value.data.data != null) {
          uiState.update((state) => state.copyWith(isSuccess: true));
        }
      }).catchError((obj) {
        ApiError(obj, errorData: (code, msg) {
          uiState
              .update((state) => state.copyWith(errorMessage: "$code\n$msg"));
        });
      });
    }
  }

  bool validateDataLogin() {
    return emailController.validateEmail().isNotEmpty ||
        passwordController.validatePassword().isNotEmpty;
  }

  Future<void> doLoginAndUpdate() async {
    bool isError = validateDataLogin();

    if (isError) {
      return;
    } else {
      _isShowLoading(true);
      final request = LoginRequest(
          email: emailController.text, password: passwordController.text);

      repository.loginApi(request, (userResponse) {
        uiState.update((state) => state.copyWith(isSuccess: true));
        _isShowLoading(false);
      }, (obj) {
        _isShowLoading(false);
        ApiError(obj, errorData: (code, msg) {
          uiState
              .update((state) => state.copyWith(errorMessage: "$code\n$msg"));
        });
      });
    }
  }

  void _isShowLoading(bool isLoading) {
    uiState.update((state) => state.copyWith(isLoading: isLoading));
  }

  void resetState() {
    uiState.update((state) => state.copyWith(errorMessage: ''));
  }

  void resetFormLogin() {
    emailController.clear();
    passwordController.clear();
  }

  @override
  void onDispose() {
    emailController.dispose();
    passwordController.dispose();
    super.onDispose();
  }
}
