import 'package:aac_core/aac_core.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/ui_state.dart';

final _secondScreenUiStateProvider = StateProvider.autoDispose<SecondScreenUIState>((ref) {
  return SecondScreenUIState();
});
final secondScreenControllerProvider = Provider.autoDispose<HomePageViewModel>((ref) {
  return HomePageViewModel(
    uiState: ref.watch(_secondScreenUiStateProvider.notifier),
  );
});

class HomePageViewModel extends ViewModel {

  AutoDisposeStateProvider<SecondScreenUIState> get ui => _secondScreenUiStateProvider;

  ProviderListenable<int> get counterChange => ui.select((value) => value.counter);

  final StateController<SecondScreenUIState> uiState;

  HomePageViewModel({required this.uiState}) {
    print("HomePageViewModel constructor");
  }

  @override
  bool enableBindAppLifeCycle() => true;

  @override
  void onInitState() {
    super.onInitState();
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

}