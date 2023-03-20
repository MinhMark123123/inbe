import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/presenter/notification/news_ui_state.dart';

final _newsUiStateProvider = StateProvider.autoDispose<NewsUIState>((ref) {
  return NewsUIState();
});

final newsPageControllerProvider = Provider.autoDispose<NewsViewModel>((ref) {
  return NewsViewModel(
    uiState: ref.watch(_newsUiStateProvider.notifier),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class NewsViewModel extends ViewModel {
  AutoDisposeStateProvider<NewsUIState> get ui => _newsUiStateProvider;

  final StateController<NewsUIState> uiState;

  ProviderListenable<AsyncValue<List<NotificationModel>>> get notifications =>
      ui.select((value) => value.notifications);

  final TopRepository topRepository;

  NewsViewModel({
    required this.uiState,
    required this.topRepository,
  }) {
    print("HomePageViewModel constructor");
  }

  @override
  bool enableBindAppLifeCycle() => true;

  @override
  void onInitState() {
    super.onInitState();
    print("on init state");
    _getNews();
  }

  Future<void> _getNews() async {
    topRepository.getNews().then((value) {
      if (value == null) {
        uiState.update((state) => state.copyWith(errorMessage: "No data"));
      } else {
        uiState.update(
            (state) => state.copyWith(notifications: AsyncValue.data(value)));
      }
    }).catchError((error) {
      ApiError(error,
          errorData: (code, msg) => uiState
              .update((state) => state.copyWith(errorMessage: "$msg")));
    });
  }
}
