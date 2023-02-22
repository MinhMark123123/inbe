import 'package:aac_core/aac_core.dart';
import 'package:dio/dio.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/model/electronic_app_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/ui_state.dart';

final _secondScreenUiStateProvider =
    StateProvider.autoDispose<SecondScreenUIState>((ref) {
  return SecondScreenUIState();
});

final secondScreenControllerProvider =
    Provider.autoDispose<HomePageViewModel>((ref) {
  return HomePageViewModel(
    uiState: ref.watch(_secondScreenUiStateProvider.notifier),
    topRepository: ref.read(topRepositoryProvider),
  );
});

class HomePageViewModel extends ViewModel {
  AutoDisposeStateProvider<SecondScreenUIState> get ui =>
      _secondScreenUiStateProvider;

  ProviderListenable<int> get counterChange =>
      ui.select((value) => value.counter);

  ProviderListenable<List<ElectronicAppModel>> get electronicApps =>
      ui.select((value) => value.electronicApps);

  final StateController<SecondScreenUIState> uiState;

  final TopRepository topRepository;

  HomePageViewModel({
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
    getElectronicApps();
    print("on init state");
  }

  @override
  void onDispose() {
    super.onDispose();
    print("on onDispose");
  }

  @override
  void onResumed() {
    super.onResumed();
    print("on onResumed");
  }

  @override
  void onReady() {
    print("on ready");
    super.onReady();
  }

  @override
  void onInactive() {
    super.onInactive();
    print("on onInactive");
  }

  @override
  void onPaused() {
    super.onPaused();
    print("on onPaused");
  }

  @override
  void onDetached() {
    print("on onDetached");
    super.onDetached();
  }

  void increaseCounter() {
    final counter = uiState.state.counter;
    uiState.update((state) => state.copyWith(counter: counter + 1));
  }

  void getElectronicApps() {
    topRepository
        .getElectronicApps()
        .then((value) => {
              uiState
                  .update((state) => state.copyWith(electronicApps: value.data))
            })
        .catchError((obj) {
      switch (obj.runtimeType) {
        case DioError:
          final res = (obj as DioError).response;
          print("Got error : ${res?.statusCode} : ${res?.statusMessage}");
          uiState.update((state) => state.copyWith(
              errorMessage: res?.statusMessage ?? "Request api error"));
          break;
        default:
          uiState
              .update((state) => state.copyWith(errorMessage: "Default error"));
          break;
      }
    });
  }
}
