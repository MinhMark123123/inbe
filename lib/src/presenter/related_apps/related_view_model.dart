import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/model/other_app_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/presenter/related_apps/related_ui_state.dart';

final _relatedPageUiStateProvider =
StateProvider.autoDispose<RelatedUIState>((ref) {
  return RelatedUIState();
});

final relatedViewModelProvider = Provider.autoDispose<RelatedViewModel>((ref) {
  return RelatedViewModel(
    uiState: ref.watch(_relatedPageUiStateProvider.notifier),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class RelatedViewModel extends ViewModel {
  final TopRepository topRepository;
  final StateController<RelatedUIState> uiState;

  ProviderListenable<AsyncValue<List<OtherAppModel>>> get otherAppProvider =>
      ui.select((value) => value.otherApps);

  AutoDisposeStateProvider<RelatedUIState> get ui => _relatedPageUiStateProvider;

  RelatedViewModel({required this.uiState, required this.topRepository});

  @override
  void onInitState() {
    super.onInitState();
    getRelatedApps();
  }

  Future<void> getRelatedApps() async {
    topRepository.getOtherApps().then((value) => {

      uiState.update((state) => state.copyWith(otherApps: AsyncValue.data(value.data)))
    }).catchError((error) {
      ApiError(error, errorData: (code, msg) {

      });
    });
  }
}
