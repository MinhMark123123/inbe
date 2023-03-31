import 'package:aac_core/aac_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/src/data/api/api_error.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/model/convenience_model.dart';
import 'package:inabe/src/data/model/notification_model.dart';
import 'package:inabe/src/data/model/top_slider_model.dart';
import 'package:inabe/src/data/repository/toppage/top_repository.dart';
import 'package:inabe/src/data/repository/user/user_repository.dart';
import 'package:inabe/src/presenter/toppage/home/presenter/ui_state.dart';

final _homeUiStateProvider = StateProvider.autoDispose<HomeUIState>((ref) {
  return HomeUIState();
});

final homePageControllerProvider =
    Provider.autoDispose<HomePageViewModel>((ref) {
  return HomePageViewModel(
    uiState: ref.watch(_homeUiStateProvider.notifier),
    topRepository: ref.read(topRepositoryProvider),
    userRepository: ref.read(userRepositoryProvider),
  );
});

class HomePageViewModel extends ViewModel {
  AutoDisposeStateProvider<HomeUIState> get ui => _homeUiStateProvider;

  final StateController<HomeUIState> uiState;

  ProviderListenable<List<TopSliderModel>> get topSlides =>
      ui.select((value) => value.topSlides);

  ProviderListenable<List<NotificationModel>> get notifications =>
      ui.select((value) => value.notifications);

  ProviderListenable<List<ConvenienceModel>> get conveniences =>
      ui.select((value) => value.conveniences);

  final TopRepository topRepository;

  final UserRepository userRepository;

  HomePageViewModel({
    required this.uiState,
    required this.topRepository,
    required this.userRepository,
  }) {
    print("HomePageViewModel constructor");
  }

  @override
  bool enableBindAppLifeCycle() => true;

  @override
  void onInitState() {
    super.onInitState();
    print("on init state");
    FirebaseMessaging.instance.subscribeToTopic(NotificationConstant.keyTopic);
    viewModelScope(() => _getDataTop());
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

  Future<void> _getBasicInfo() async {
    userRepository.getBasicInfo().then((value) {
      userRepository.saveTurnOn(value.data.pushNotifications ?? false);
      userRepository.saveListCategory(value.data.interestCategories ?? []);
    }).catchError((error) {
      ApiError(error, errorData: (code, msg) => {});
    });
  }

  Future<void> _getTopSlides() async {
    topRepository
        .getTopSlides()
        .then((value) =>
            uiState.update((state) => state.copyWith(topSlides: value)))
        .catchError((error) {
      ApiError(error,
          errorData: (code, msg) =>
              uiState.update((state) => state.copyWith(errorMessage: "$msg")));
    });
  }

  Future<void> _getNews() async {
    topRepository.getNews().then((value) {
      if (value == null) {
        uiState.update((state) => state.copyWith(errorMessage: "No data"));
      } else {
        uiState.update(
            (state) => state.copyWith(notifications: value.take(3).toList()));
      }
    }).catchError((error) {
      ApiError(error, errorData: (_, __) {}).pretty();
    });
  }

  Future<void> _getConvenience() async {
    uiState
        .update((state) => state.copyWith(conveniences: defaultConveniences));
  }

  Future<void> _getDataTop() async {
    await _getBasicInfo();
    await _getTopSlides();
    await _getNews();
    await _getConvenience();
  }
}
