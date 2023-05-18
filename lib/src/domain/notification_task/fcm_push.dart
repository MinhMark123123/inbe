import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:inabe/firebase_options.dart';
import 'package:inabe/src/data/model/data_push_model.dart';
import 'package:inabe/src/domain/notification_task/notification_task.dart';
import 'package:inabe/src/navigation/routers.dart';

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  if (Firebase.apps.isEmpty) {
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
  }

  await WorkerUpdateInformation().init();
  await setupFlutterNotifications();
  print('FCM background call work manager ${message.messageId}');


  print("ttt ---> FCM background showFlutterNotification data  ::: ${message.data}");


  // await WorkerUpdateInformation.foregroundFCM(message);

  // if (Platform.isAndroid) {
  //   await WorkerUpdateInformation.callRegisterTask();
  // } else if (Platform.isIOS) {
  //   await WorkerUpdateInformation.foregroundFCM(message);
  // }

  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print('Handling a FCM background message ${message.messageId}');
}

// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.
  await flutterLocalNotificationsPlugin
      .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin>()
      ?.createNotificationChannel(channel);

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  print("ttt ---> showFlutterNotification ::: $message : $kIsWeb");
  DataPushModel dataPushModel = DataPushModel.fromJson(message.data);
  var path = "${RouterConstants.home}/${RouterConstants.newsList}";
  if (dataPushModel.id != null) {
    path = RouterConstants.email;
  } else if (dataPushModel.href != null) {
    path = "${RouterConstants.home}/${RouterConstants.event}";
  } else {
    path = "${RouterConstants.home}/${RouterConstants.newsList}";
  }
  if (notification != null && android != null && !kIsWeb) {
    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          channelDescription: channel.description,
          // TODO add a proper drawable resource to android, for now using
          //      one that already exists in example app.
          icon: 'launch_background',
        ),
      ),
      payload: path
    );
  }
}

/// Initialize the [FlutterLocalNotificationsPlugin] package.
late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
