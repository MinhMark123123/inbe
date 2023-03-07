import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';

final splashViewModelProvider = Provider.autoDispose<SplashViewModel>((ref) {
  return SplashViewModel(
    // uiState: ref.watch(_registerPageUiStateProvider.notifier),
    userRepository: ref.read(userRepositoryProvider),
  );
});

class SplashViewModel extends ViewModel {
  SplashViewModel({required this.userRepository});

  final UserRepository userRepository;

  Future<bool> isLoggedIn() async {
    return userRepository.isLoggedIn();
  }
}
