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

  ProviderListenable<bool> get disableButtonProvider =>
      ui.select((value) => value.disableButton);

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

  bool validateDataLogin({bool updateUI = false}) {
    bool isError = emailController.validateEmail().isNotEmpty ||
        passwordController.validatePassword().isNotEmpty;
    if (updateUI) {
      print("ttt $isError");
      uiState.update((state) => state.copyWith(disableButton: isError));
    }
    return isError;
  }

  Future<void> doLoginAndUpdate() async {
    final fcmToken = await repository.getFCMToken();
    bool isError = validateDataLogin();

    if (isError) {
      return;
    } else {
      _isShowLoading(true);
      final request = LoginRequest(
        email: emailController.text,
        password: passwordController.text,
        fcmDeviseToken: fcmToken,
      );
      print("ttt fcm : $fcmToken");

      repository.loginApi(request, (userResponse) {
        uiState.update((state) => state.copyWith(isSuccess: true));
        _isShowLoading(false);
      }, (obj) {
        _isShowLoading(false);
        ApiError(obj, errorData: (code, msg) {
          uiState.update((state) => state.copyWith(errorMessage: "$msg"));
        });
      });
    }
  }

  void onChangeEmail() {
    validateDataLogin(updateUI: true);
  }

  void onChangePassword() {
    validateDataLogin(updateUI: true);
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
