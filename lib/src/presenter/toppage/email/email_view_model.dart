import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/data/repository/user/email_repository.dart';
import 'package:inabe/src/presenter/toppage/email/email_ui_state.dart';
import 'package:inabe/src/utils/paging_data_source.dart';

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

class EmailViewModel extends ViewModel with PagingDataSource<EmailModel> {
  final EmailRepository emailRepository;
  final StateController<EmailUIState> uiState;

  EmailViewModel({required this.uiState, required this.emailRepository}) {
    print("---------------> EmailViewModel");
  }

  ProviderListenable<bool> get isLoadedPageProvider =>
      ui.select((value) => value.isLoadedPage);

  ProviderListenable<List<EmailModel>> get listProvider =>
      ui.select((value) => value.dataList);

  AutoDisposeStateProvider<EmailUIState> get ui => _emailPageUiStateProvider;

  @override
  void onInitState() {
    super.onInitState();

    setupFetchApi(() => getListEmail(0, pageSizeLimit));

    setupLoadMoreApi(
      () {
        getListEmail(currentPage, pageSizeLimit);
      },
    );
    refresh();
  }

  Future<void> getListEmail(int page, int perPage) async {
    emailRepository.getListEmail(page, perPage).then(
      (value) {
        print("ttt meta : ${value.meta?.totalCount}");
        updateDataRes(value.meta, value.data);

        print("ttt data size : ${dataList.length}");
        uiState
            .update((state) => state.copyWith(dataList: List.from(dataList)));

        uiState
            .update((state) => state.copyWith(isLoadedPage: false));
      },
    ).catchError((error) {
      ApiError(error, errorData: (code, msg) {});
    });
  }
}
