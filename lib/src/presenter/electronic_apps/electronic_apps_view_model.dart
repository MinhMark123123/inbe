import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/model/electronic_app_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/presenter/electronic_apps/electronic_ui_state.dart';

final _electronicAppPageUiStateProvider =
    StateProvider.autoDispose<ElectronicAppUIState>((ref) {
  return ElectronicAppUIState();
});

final electronicAppViewModelProvider =
    Provider.autoDispose<ElectronicAppViewModel>((ref) {
  return ElectronicAppViewModel(
    uiState: ref.watch(_electronicAppPageUiStateProvider.notifier),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class ElectronicAppViewModel extends ViewModel {
  final TopRepository topRepository;
  final StateController<ElectronicAppUIState> uiState;

  ProviderListenable<String> get selectCategory =>
      ui.select((value) => value.selectCategory);

  ProviderListenable<String> get selectMidCategory =>
      ui.select((value) => value.selectMidCategory);

  ProviderListenable<AsyncValue<List<ElectronicAppModel>>>
      get electronicAppProvider => ui.select((value) => value.otherApps);

  AutoDisposeStateProvider<ElectronicAppUIState> get ui =>
      _electronicAppPageUiStateProvider;

  ElectronicAppViewModel({required this.uiState, required this.topRepository});

  @override
  void onInitState() {
    super.onInitState();
    getElectronicApps();
  }

  Future<void> getElectronicApps() async {
    topRepository
        .getElectronicApps()
        .then((value) => {
              uiState.update((state) =>
                  state.copyWith(otherApps: AsyncValue.data(value.data)))
            })
        .catchError((error) {
      ApiError(error, errorData: (code, msg) {});
    });
  }

  void setSelectedCategory(String category) {
    uiState.update((state) => state.copyWith(selectCategory: category));
    uiState.update((state) => state.copyWith(selectMidCategory: ''));
  }

  void setSelectedMidCategory(String category) {
    uiState.update((state) => state.copyWith(selectMidCategory: category));
  }
}
