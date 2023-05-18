import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:inabe/src/data/api/append_intercepter.dart';
import 'package:inabe/src/data/api/append_user_intercepter.dart';
import 'package:inabe/src/data/api/retrofit_client.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/model/data_push_model.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/di/di_config.dart';
import 'package:inabe/src/domain/notification_task/push_notification.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/utils/date_time_utils.dart';
import 'package:inabe/src/utils/parse_util.dart';
import 'package:workmanager/workmanager.dart';

const simpleTaskKey = "simpleTask";
const simplePeriodicTask =
    "be.tramckrijte.workmanagerExample.simplePeriodicTask";

class WorkerUpdateInformation {
  static final WorkerUpdateInformation _instance = WorkerUpdateInformation._();

  WorkerUpdateInformation._();

  factory WorkerUpdateInformation() {
    return _instance;
  }

  Future<void> init() async {
    Workmanager().initialize(callbackDispatcher, isInDebugMode: true);
  }

  static Future<void> callRegisterTask() async {
    // await Workmanager().cancelAll();

    await Workmanager().registerOneOffTask(
      simpleTaskKey,
      simpleTaskKey,
      initialDelay: const Duration(seconds: 3),
      constraints: Constraints(networkType: NetworkType.connected),
      inputData: {"Key": "1"},
    );
  }

  static Future<void> foregroundFCM(RemoteMessage message) async {
    // await _checkShowNotify();

    print('Got a message whilst in the foreground!');

    print('Message data: ${message.data}');

    DataPushModel dataPushModel = DataPushModel.fromJson(message.data);

    print('Message data: id = ${dataPushModel.id} ; href = ${dataPushModel.href} ');

    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
      var path = "${RouterConstants.home}/${RouterConstants.newsList}";
      if (dataPushModel.id != null) {
        path = RouterConstants.email;
      } else if (dataPushModel.href != null) {
        path = "${RouterConstants.home}/${RouterConstants.event}";
      } else {
        path = "${RouterConstants.home}/${RouterConstants.newsList}";
      }
      showNotification(
        message.notification?.title ?? "AAA",
        message.notification?.body ?? "BBB",
        path,
      );
    }
  }

  static Future<void> _checkShowNotify() async {
    var startTime = DateTime.now();
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
        "ttt: notificatin_task --> News ::: 1. ${listNewsModel!.first.title}: ${listNewsModel.first.date}");

    print(
        "ttt: notificatin_task --> Events ::: 1. ${eventList.first.title} :::  ${eventList.first.date}");

    print(
        "ttt: notificatin_task --> Email ::: 1. ${list.first.title} :::  ${list.first.publishedAt}");

    categories.forEach((element) {
      if (element == "1") {
        if (lastEmail != list.first.publishedAt) {
          final title = DateTimeUtils.convert(
            list.first.publishedAt,
            DateTimeUtils.emailDateFormat,
            DateTimeUtils.formatJP,
          );
          final body = list.first.title ?? "";
          showNotification(
            title,
            body,
            RouterConstants.email,
          );
        }
      } else if (element == "2") {
        if (lastEvent != eventList.first.date) {
          final title = DateTimeUtils.convert(
            eventList.first.date,
            DateTimeUtils.eventDateFormat,
            DateTimeUtils.formatJP,
          );
          final body = eventList.first.title ?? "";
          showNotification(
            title,
            body,
            "${RouterConstants.home}/${RouterConstants.event}",
          );
        }
      } else {
        if (lastNews != listNewsModel.first.date) {
          final title = DateTimeUtils.convert(
            listNewsModel.first.date,
            DateTimeUtils.utcFormat,
            DateTimeUtils.formatJP,
          );
          final body = listNewsModel.first.title ?? "";
          showNotification(
            title,
            body,
            "${RouterConstants.home}/${RouterConstants.newsList}",
          );
        }
      }
    });

    print("ttt int time");
    final timeEnd = DateTime.now();
    // print("ttt time---> ${timeEnd.subtract(timeStart.timeZoneOffset)}");
    print("ttt time---> ${timeEnd.difference(startTime).inMilliseconds}");

  }
}

// @pragma('vm:entry-point')
// void notificationTapBackground(NotificationResponse notificationResponse) {
//   // ignore: avoid_print
//   print('notification(${notificationResponse.id}) action tapped: '
//       '${notificationResponse.actionId} with'
//       ' payload: ${notificationResponse.payload}');
//   if (notificationResponse.input?.isNotEmpty ?? false) {
//     // ignore: avoid_print
//     print(
//         'notification action tapped with input: ${notificationResponse.input}');
//   }
// }

@pragma('vm:entry-point')
void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) async {
    final timeStart = DateTime.now();
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
            "ttt: notificatin_task --> News ::: 1. ${listNewsModel!.first.title}: ${listNewsModel.first.date}");

        print(
            "ttt: notificatin_task --> Events ::: 1. ${eventList.first.title} :::  ${eventList.first.date}");

        print(
            "ttt: notificatin_task --> Email ::: 1. ${list.first.title} :::  ${list.first.publishedAt}");


        print("ttt int time");
        final timeEnd = DateTime.now();
        // print("ttt time---> ${timeEnd.subtract(timeStart.timeZoneOffset)}");
        print("ttt time---> ${timeEnd.difference(timeStart).inMilliseconds}");

        categories.forEach((element) {
          if (element == "1") {
            if (lastEmail != list.first.publishedAt) {
              final title = DateTimeUtils.convert(
                list.first.publishedAt,
                DateTimeUtils.emailDateFormat,
                DateTimeUtils.formatJP,
              );
              final body = list.first.title ?? "";
              showNotification(title, body, RouterConstants.email);
            }
          } else if (element == "2") {
            if (lastEvent != eventList.first.date) {
              final title = DateTimeUtils.convert(
                eventList.first.date,
                DateTimeUtils.eventDateFormat,
                DateTimeUtils.formatJP,
              );
              final body = eventList.first.title ?? "";
              showNotification(
                title,
                body,
                "${RouterConstants.home}/${RouterConstants.event}",
              );
            }
          } else {
            if (lastNews != listNewsModel.first.date) {
              final title = DateTimeUtils.convert(
                listNewsModel.first.date,
                DateTimeUtils.utcFormat,
                DateTimeUtils.formatJP,
              );
              final body = listNewsModel.first.title ?? "";
              showNotification(
                title,
                body,
                "${RouterConstants.home}/${RouterConstants.newsList}",
              );
            }
          }
        });
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
