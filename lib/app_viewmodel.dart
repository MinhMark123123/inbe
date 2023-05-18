import 'package:aac_core/aac_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/app_ui_state.dart';
import 'package:inabe/src/domain/notification_task/push_notification.dart';

final _appPageUiStateProvider = StateProvider.autoDispose<AppUIState>((ref) {
  return AppUIState();
});

final appViewModelProvider = Provider.autoDispose<AppViewModel>((ref) {
  return AppViewModel(
    uiState: ref.watch(_appPageUiStateProvider.notifier),
  );
});

class AppViewModel extends ViewModel {
  final StateController<AppUIState> uiState;

  ProviderListenable<String> get pathNotificationProvider =>
      ui.select((value) => value.pathNotification);

  AutoDisposeStateProvider<AppUIState> get ui => _appPageUiStateProvider;

  AppViewModel({required this.uiState});

  @override
  bool enableBindAppLifeCycle() {
    return true;
  }

  @override
  void onInitState() {
    print("ttt --- onInitState --- AppViewmodel ");
    super.onInitState();
  }

  @override
  void onResumed() {
    print("ttt --- onResumed --- AppViewmodel ");
    //_isHasNotification();
  }

  Future<void> _isHasNotification() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
        await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();
    String? payload =
        notificationAppLaunchDetails!.notificationResponse?.payload;
    print("payload=$payload");

    uiState.update((state) => state.copyWith(pathNotification: payload ?? ''));
  }

  void resetState() {
    uiState.update((state) => state.copyWith(pathNotification: ''));
  }
}
