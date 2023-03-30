import 'dart:async';

import 'package:aac_core/aac_core.dart';
// import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
// import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/domain/firebase/firebase_management.dart';
import 'package:inabe/src/domain/notification_task/notification_task.dart';
import 'package:inabe/src/domain/notification_task/push_notification.dart';
import 'package:inabe/src/navigation/app_routers.dart';

// import 'firebase_options.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:inabe/src/domain/notification_task/fcm_push.dart';

void main() async {
  runZonedGuarded<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    // Initialize Firebase.
    FirebaseManagement.initializeApp();
    await ScreenUtil.ensureScreenSize();
    initNotification();
    await WorkerUpdateInformation().init();
    runApp(const ProviderScope(child: MyApp()));
  }, (error, stack) => FirebaseCrashlytics.instance.recordError(error, stack));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp.router(
          routerConfig: AppGoRouter().router,
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
}
