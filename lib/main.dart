import 'dart:async';
import 'dart:convert';

import 'package:aac_core/aac_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/data/model/data_push_model.dart';
import 'package:inabe/src/data/model/email_model.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/data/sources/local/share_pref.dart';
import 'package:inabe/src/domain/firebase/firebase_management.dart';
import 'package:inabe/src/domain/notification_task/notification_task.dart';
import 'package:inabe/src/domain/notification_task/push_notification.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:inabe/src/state/riverpod_ui_support.dart';
import 'package:inabe/src/utils/auth_utils.dart';

import 'app_viewmodel.dart';
import 'src/navigation/routers.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    SharePref sharePref = SharePref();
    KeyDataSource keyDataSource = KeyDataSource();
    await AuthUtils.firstLaunch(sharePref, keyDataSource);

    await ScreenUtil.ensureScreenSize();
    initNotification();
    await WorkerUpdateInformation().init();
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

GoRouter _router = AppGoRouter().router;

class MyApp extends ConsumerViewModelWidget<AppViewModel> {
  const MyApp({super.key});

  @override
  void aWake(WidgetRef ref, AppViewModel viewModel) {
    FirebaseManagement.initializeApp();
    selectNotificationStream.stream.listen((payload) {
      print("ttt ---> selectNotificationStream : $payload");
      if (payload != null) {
        Map<String, dynamic> data = jsonDecode(payload);
        if (!data.containsKey("href")) {
          EmailModel emailModel = EmailModel.fromJson(data);
          var newPath =
              "/${RouterConstants.home}/${RouterConstants.emailDetail}";

          print("ttt ---> selectNotificationStream : $newPath::: $emailModel");
          FirebaseManagement.navigateFromPushData(newPath, emailModel);
        } else {
          DataPushModel pushModel = DataPushModel.fromJson(data);
          launchWebPage(Configs.navigatorKey.currentContext!,
              RouterConstants.home, pushModel.href);
        }
      }
    });
    super.aWake(ref, viewModel);
  }

  @override
  Widget buildWidget(BuildContext context, WidgetRef ref, viewModel) {
    /*ref.listen(viewModel.pathNotificationProvider, (previous, next) {
      if (next.isNotEmpty) {
        Configs.navigatorKey.currentContext?.go("/$next");
        viewModel.resetState();
      }
    });*/

    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: _router,
          title: "Go router",
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          theme: CustomAppTheme.lightTheme,
          supportedLocales: const [
            Locale('ja', 'JP'),
          ],
        );
      },
    );
  }

  @override
  AutoDisposeProvider<AppViewModel> viewModelProvider() {
    return appViewModelProvider;
  }
}
