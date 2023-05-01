import 'package:aac_core/aac_core.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/presenter/toppage/menu/menu_ui_state.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';

final _menuUiStateProvider = StateProvider.autoDispose<MenuUIState>((ref) {
  return MenuUIState();
});
final menuPageControllerProvider = Provider.autoDispose<MenuViewModel>((ref) {
  return MenuViewModel(
    uiState: ref.watch(_menuUiStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
  );
});

class MenuViewModel extends ViewModel {
  final UserRepository userRepository;
  final StateController<MenuUIState> uiState;

  AutoDisposeStateProvider<MenuUIState> get ui => _menuUiStateProvider;

  ProviderListenable<bool> get isSignOutProvider =>
      ui.select((value) => value.isSignOut);

  ProviderListenable<String> get errorMsg =>
      ui.select((value) => value.errorMsg);

  ProviderListenable<String> get tokenFCM =>
      ui.select((value) => value.tokenFCM);

  ProviderListenable<bool> get isSuccess =>
      ui.select((value) => value.isSuccess);

  MenuViewModel({
    required this.userRepository,
    required this.uiState,
  }) {
    print("MenuViewModel constructor");
  }

  @override
  void onResumed() {
    checkLoggedIn();
    super.onResumed();
  }

  late final StreamDataViewModel<bool> _isLoginLive =
      StreamDataViewModel(defaultValue: false, viewModel: this);

  StreamData<bool> get isLoginLive => _isLoginLive;

  @override
  void onInitState() {
    print("ttt onInitState");
    super.onInitState();
    checkLoggedIn();
    showToken();
  }

  Future<String> showToken() async {
    final keyDataSource = KeyDataSource();
    final tokenFCM = await keyDataSource.getSecure(SecureKeys.keyFCMToken);
    print("ttt: FCM --> $tokenFCM");
    uiState.update((state) => state.copyWith(tokenFCM: tokenFCM));
    return tokenFCM;
  }

  @override
  bool enableBindAppLifeCycle() => true;

  Future<bool> checkLoggedIn() async {
    final isLogin = await userRepository.isLoggedIn();
    _isLoginLive.postValue(isLogin);
    return isLogin;
    //return userRepository.isLoggedIn();
  }

  void doLogout() {
    userRepository
        .doLogout()
        .then((value) => clearDataStorage())
        .catchError((error) => {
              ApiError(error,
                  errorData: (code, msg) => {
                        //no-op
                      })
            });
  }

  void clearDataStorage() {
    userRepository.clearDataUser().then((value) {
      uiState.update((state) => state.copyWith(isSuccess: true));
      uiState.update((state) => state.copyWith(isSignOut: true));
    });
  }
}
