import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/model/living_guide_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/presenter/convenience_book/living_book_ui_state.dart';

final _livingBookPageUiStateProvider =
    StateProvider.autoDispose<LivingBookUIState>((ref) {
  return LivingBookUIState();
});

final livingBookViewModelProvider =
    Provider.autoDispose<LivingBookViewModel>((ref) {
  return LivingBookViewModel(
    uiState: ref.watch(_livingBookPageUiStateProvider.notifier),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class LivingBookViewModel extends ViewModel {
  final TopRepository topRepository;
  final StateController<LivingBookUIState> uiState;

  ProviderListenable<AsyncValue<List<LivingGuideModel>>> get livingGuidesProvider =>
      ui.select((value) => value.livingGuides);

  AutoDisposeStateProvider<LivingBookUIState> get ui =>
      _livingBookPageUiStateProvider;

  LivingBookViewModel({required this.uiState, required this.topRepository});

  @override
  void onInitState() {
    super.onInitState();
    getLivingBooks();
  }

  Future<void> getLivingBooks() async {
    topRepository
        .getLivingGuideApi()
        .then((value) => {
              uiState.update((state) =>
                  state.copyWith(livingGuides: AsyncValue.data(value.data)))
            })
        .catchError((error) {
      ApiError(error, errorData: (code, msg) {});
    });
  }
}
