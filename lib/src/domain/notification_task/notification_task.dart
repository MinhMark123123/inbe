import 'dart:async';

import 'package:alarm/alarm.dart';
import 'package:dio/dio.dart';
import 'package:inabe/src/data/api/append_intercepter.dart';
import 'package:inabe/src/data/api/append_user_intercepter.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/di/di_config.dart';
import 'package:inabe/src/domain/notification_task/push_notification.dart';
import 'package:inabe/src/utils/parse_util.dart';
import 'package:workmanager/workmanager.dart';

const simpleTaskKey = "simpleTask";
const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";

class NotificationTask {
  static final NotificationTask _instance = NotificationTask._();

  NotificationTask._();

  factory NotificationTask() {
    return _instance;
  }

  Future<void> init() async {
    Workmanager().initialize(callbackDispatcher);
  }

  static Future<void> callRegisterTask() async {
    Workmanager().cancelAll();
    _startNotify(
      hourStart: 9,
      minuteStart: 38,
    );
  }

  static bool checkLoggedIn() {
    return true;
  }

  static Future<void> _startNotify(
      {int hourStart = 8, int minuteStart = 0}) async {
    var sharePref = KeyDataSource();
    var isTurnOn = sharePref.getBool(PrefKeys.keyTurnOnNotify);
    print("ttt: notificatin_task --> break ::: turnOnNotify $isTurnOn");
    var isTurnOn1 = await sharePref.getSecure(SecureKeys.keyTest);
    print(
        "ttt: notificatin_task --> break :::getSecure turnOnNotify $isTurnOn1");

    int hour = DateTime
        .now()
        .hour;
    DateTime today = DateTime.now();
    DateTime triggerD;
    int d = DateTime
        .now()
        .toUtc()
        .millisecondsSinceEpoch;
    int trigger;
    print("ttt: notificatin_task --> time::: $hour::$d");

    if (hour < hourStart + 1) {
      triggerD =
          today.copyWith(hour: hourStart, minute: minuteStart, second: 0);
      trigger = triggerD
          .toUtc()
          .millisecondsSinceEpoch;
    } else {
      triggerD = today
          .copyWith(hour: hourStart, minute: minuteStart, second: 0)
          .add(const Duration(days: 1));
      trigger = triggerD
          .toUtc()
          .millisecondsSinceEpoch;
    }
    print("ttt: notificatin_task --> time::: $hour::::${trigger - d}");

    Workmanager().registerOneOffTask(
      simpleTaskKey,
      simpleTaskKey,
      initialDelay: Duration(milliseconds: trigger - d),
      constraints: Constraints(networkType: NetworkType.connected),
      inputData: {"Key": "1"},
    );
  }

  static Future<void> showAlarm(
      {int hourStart = 8, int minuteStart = 0}) async {
    Alarm.stop(11);
    DateTime triggerDate;
    DateTime today = DateTime.now();
    int hour = today.hour;
    int minute = today.minute;

    if (hour < hourStart || (hour == hourStart && minute < minuteStart)) {
      triggerDate =
          today.copyWith(hour: hourStart, minute: minuteStart, second: 0);
    } else {
      triggerDate = today
          .copyWith(hour: hourStart, minute: minuteStart, second: 0)
          .add(const Duration(days: 1));
    }
    print("ttt time_notify : $triggerDate");

    final alarmSettings = AlarmSettings(
      id: 11,
      dateTime: triggerDate,
      assetAudioPath: 'assets/mozart.mp3',
      loopAudio: true,
      notificationTitle: 'Inabe',
      notificationBody: '------',
      enableNotificationOnKill: true,
    );
    await Alarm.set(alarmSettings: alarmSettings);
    // await Alarm.setNotificationOnAppKillContent("lll", "ddd");

    Alarm.ringStream.stream.listen((_) async {
      flutterLocalNotificationsPlugin.cancelAll();
      print("ttt ---> listen Alarm trigger");
      await _checkShowNotify();
      // Workmanager().registerOneOffTask(
      //   simpleTaskKey,
      //   simpleTaskKey,
      //   initialDelay: const Duration(seconds: 1),
      //   constraints: Constraints(networkType: NetworkType.connected),
      //   inputData: {"Key": "1"},
      // );
    });
  }

  static Future<void> _checkShowNotify() async {
    KeyDataSource sharePref = KeyDataSource();
    var isLogin = await sharePref.getToken();
    if (isLogin.isEmpty) {
      print("ttt: notificatin_task --> break ::: Login $isLogin");
      return;
    }

    var isTurnOn = await sharePref.getSecure(SecureKeys.keyTest);
    if (isTurnOn == "false") {
      print("ttt: notificatin_task --> break ::: turnOnNotify $isTurnOn");
      return;
    }

    var categories = await sharePref.getListCategoryJson();

    print("ttt: notificatin_task --> ::: empty categories $categories");
    if (categories.isEmpty) {
      return;
    }

    var lastNews = await sharePref.getSecure(SecureKeys.keyLastNews);
    var lastEmail = await sharePref.getSecure(SecureKeys.keyLastEmail);
    var lastEvent = await sharePref.getSecure(SecureKeys.keyLastEvent);

    print("ttt: notificatin_task --> save :::"
        " N. $lastNews: Em. $lastEmail: Ev. $lastEvent");

    var dio = Dio()
      ..interceptors
          .add(AppendInterceptor(applicationJson, applicationJson, ''));
    dio.interceptors.add(AuthUserInterceptor(sharePref));
    var rest = RestClient(dio);

    String bodyNotify = "";
    //Email
    var email = await rest.getMyEmails(0, 5);
    var list = email.data;
    //Event list
    var events = await rest.getEvents();
    var eventList = ParseUtils.getListEvent(events);
    //News
    var news = await rest.getNews();
    var listNewsModel = ParseUtils.getData(news);

    print(
        "ttt: notificatin_task --> News ::: 1. ${listNewsModel!.first
            .title}: ${listNewsModel.first.date}");

    print(
        "ttt: notificatin_task --> Events ::: 1. ${eventList.first
            .title} :::  ${eventList.first.date}");

    print(
        "ttt: notificatin_task --> Email ::: 1. ${list.first
            .title} :::  ${list.first.publishedAt}");

    categories.forEach((element) {
      if (element == "1") {
        if (lastEmail == list.first.publishedAt) {
          bodyNotify += "--Email not change";
        } else {
          bodyNotify += "--Email nnnn";
        }
      } else if (element == "2") {
        if (lastEvent == eventList.first.date) {
          bodyNotify += "--Event not change";
        } else {
          bodyNotify += "--Event nnnn";
        }
      } else {
        if (lastNews == listNewsModel.first.date) {
          bodyNotify += "--News not change";
        } else {
          bodyNotify += "--News nnnn";
        }
      }
    });

    print("ttt body $bodyNotify");

    showNotification(bodyNotify);
  }
}

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    switch (taskName) {
      case simpleTaskKey:
        KeyDataSource sharePref = KeyDataSource();
        var isLogin = await sharePref.getToken();
        if (isLogin.isEmpty) {
          print("ttt: notificatin_task --> break ::: Login $isLogin");
          return Future.value(true);
        }

        var isTurnOn = await sharePref.getSecure(SecureKeys.keyTest);
        if (isTurnOn == "false") {
          print("ttt: notificatin_task --> break ::: turnOnNotify $isTurnOn");
          return Future.value(true);
        }

        var categories = await sharePref.getListCategoryJson();

        print("ttt: notificatin_task --> ::: empty categories $categories");
        if (categories.isEmpty) {
          return Future.value(true);
        }

        var lastNews = await sharePref.getSecure(SecureKeys.keyLastNews);
        var lastEmail = await sharePref.getSecure(SecureKeys.keyLastEmail);
        var lastEvent = await sharePref.getSecure(SecureKeys.keyLastEvent);

        print("ttt: notificatin_task --> save :::"
            " N. $lastNews: Em. $lastEmail: Ev. $lastEvent");

        var dio = Dio()
          ..interceptors
              .add(AppendInterceptor(applicationJson, applicationJson, ''));
        dio.interceptors.add(AuthUserInterceptor(sharePref));
        var rest = RestClient(dio);

        String bodyNotify = "";
        //Email
        var email = await rest.getMyEmails(0, 5);
        var list = email.data;
        //Event list
        var events = await rest.getEvents();
        var eventList = ParseUtils.getListEvent(events);
        //News
        var news = await rest.getNews();
        var listNewsModel = ParseUtils.getData(news);

        print(
            "ttt: notificatin_task --> News ::: 1. ${listNewsModel!.first
                .title}: ${listNewsModel.first.date}");

        print(
            "ttt: notificatin_task --> Events ::: 1. ${eventList.first
                .title} :::  ${eventList.first.date}");

        print(
            "ttt: notificatin_task --> Email ::: 1. ${list.first
                .title} :::  ${list.first.publishedAt}");

        categories.forEach((element) {
          if (element == "1") {
            if (lastEmail == list.first.publishedAt) {
              bodyNotify += "--Email not change";
            } else {
              bodyNotify += "--Email nnnn";
            }
          } else if (element == "2") {
            if (lastEvent == eventList.first.date) {
              bodyNotify += "--Event not change";
            } else {
              bodyNotify += "--Event nnnn";
            }
          } else {
            if (lastNews == listNewsModel.first.date) {
              bodyNotify += "--News not change";
            } else {
              bodyNotify += "--News nnnn";
            }
          }
        });

        print("ttt body $bodyNotify");

        showNotification(bodyNotify);
        break;

      case Workmanager.iOSBackgroundTask:
        print(
            "ttt: notificatin_task --> $taskName run run run::: iOSBackgroundTask = $inputData");
        break;
      default:
        print(
            "ttt: notificatin_task --> default $taskName run:: inputData = $inputData");
        break;
    }
    return Future.value(true);
  });
}
