import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/data/repository/user/email_repository.dart';
import 'package:inabe/src/presenter/toppage/email/email_ui_state.dart';

final _emailPageUiStateProvider =
    StateProvider.autoDispose<EmailUIState>((ref) {
  return EmailUIState();
});

final emailViewModelProvider = Provider.autoDispose<EmailViewModel>((ref) {
  return EmailViewModel(
    uiState: ref.watch(_emailPageUiStateProvider.notifier),
    emailRepository: ref.read(emailRepositoryProvider),
  );
});

class EmailViewModel extends ViewModel {
  final EmailRepository emailRepository;
  final StateController<EmailUIState> uiState;

  EmailViewModel({required this.uiState, required this.emailRepository});

  ProviderListenable<AsyncValue<List<EmailModel>>> get emails =>
      ui.select((value) => value.emails);

  AutoDisposeStateProvider<EmailUIState> get ui => _emailPageUiStateProvider;

  final int _currentPage = 1;
  final int _limitValue = 20;
  final int _totalCount = 0;

  @override
  void onInitState() {
    super.onInitState();
    getListEmail(_currentPage, _limitValue);
  }

  Future<void> getListEmail(int page, int perPage) async {
    emailRepository
        .getListEmail(page, perPage)
        .then((value) => {
              uiState.update((state) =>
                  state.copyWith(emails: AsyncValue.data(value.data)))
            })
        .catchError((error) {
      ApiError(error, errorData: (code, msg) {});
    });
  }
}
