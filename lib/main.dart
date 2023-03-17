import 'package:aac_core/aac_core.dart';
import 'package:alarm/alarm.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:inabe/gen_l10n/app_localizations.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/navigation/app_routers.dart';
import 'package:workmanager/workmanager.dart';

const simpleTaskKey = "be.tramckrijte.workmanagerExample.simpleTask";
const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  await Alarm.init();
  await Workmanager().initialize(callbackDispatcher);
  callRegisterTask();
  runApp(const ProviderScope(child: MyApp()));
}

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case simpleTaskKey:
        print("ttt $taskName run run run::: inputData = $inputData");

        // showAlarm();
        break;
      default:
        print("ttt default $taskName run:: inputData = $inputData");
        break;
    }
    return Future.value(true);
  });
}

void callRegisterTask() {
  Workmanager().cancelAll();
  int hour = DateTime.now().hour;
  DateTime today = DateTime.now();
  DateTime triggerD;
  int d = DateTime.now().toUtc().millisecondsSinceEpoch;
  int trigger;
  print("ttt time::: $hour::$d");

  if (hour < 15) {
    triggerD = today.copyWith(hour: 14, minute: 22, second: 0);
    trigger = triggerD.toUtc().millisecondsSinceEpoch;
  } else {
    triggerD = today
        .copyWith(hour: 8, minute: 0, second: 0)
        .add(const Duration(days: 1));
    trigger = triggerD.toUtc().millisecondsSinceEpoch;
  }
  print("ttt time::: $hour::::${trigger - d}");

  Workmanager().registerOneOffTask(
    simpleTaskKey,
    simpleTaskKey,
    initialDelay: Duration(milliseconds: trigger - d),
  );
}

Future<void> showAlarm() async {
  final alarmSettings = AlarmSettings(
    dateTime: DateTime.now().add(const Duration(minutes: 1)),
    assetAudioPath: 'assets/sample.mp3',
    loopAudio: true,
    notificationTitle: 'This is the title',
    notificationBody: 'This is the body',
    enableNotificationOnKill: true,
  );
  await Alarm.set(settings: alarmSettings);
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
        );
      },
    );
  }
}
