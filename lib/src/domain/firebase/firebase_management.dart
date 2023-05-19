import 'package:aac_core/aac_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:go_router/go_router.dart';
import 'package:inabe/firebase_options.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/model/data_push_model.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/domain/notification_task/fcm_push.dart';
import 'package:inabe/src/domain/notification_task/notification_task.dart';
import 'package:inabe/src/navigation/routers.dart';
import 'package:inabe/src/utils/extensions/asset_extension.dart';

class FirebaseManagement {
  FirebaseManagement._();

  static Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    //FCM
    FirebaseMessaging firebaseMessaging;
    firebaseMessaging = FirebaseMessaging.instance;
    await firebaseMessaging.requestPermission();
    String? token = await firebaseMessaging.getToken();
    if (token.isEmpty) {
      print("ttt --- getAPNSToken FirebaseMessaging");
      token = await firebaseMessaging.getAPNSToken();
    }
    print("ttt --- token FirebaseMessaging: $token");
    KeyDataSource sharePref = KeyDataSource();
    sharePref.setFCMToken(token);
    // Get any messages which caused the application to open from
    // a terminated state.
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    // If the message also contains a data property with a "type" of "chat",
    // navigate to a chat screen
    if (initialMessage != null) {
      print('onMessageOpenedApp at initialMessage: ');
      handleDataMessage(initialMessage);
    }
    //
    FirebaseMessaging.onMessage.listen(WorkerUpdateInformation.foregroundFCM);
    // FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    //background
    FirebaseMessaging.onMessageOpenedApp.listen(handleDataMessage);
  }

  static void handleDataMessage(RemoteMessage message) {

    DataPushModel dataPushModel = DataPushModel.fromJson(message.data);
    print('ttt -----> _handleDataMessage');
    if (message.notification != null) {
      print('onMessageOpenedApp Message a notification: ${message.notification?.toMap().toString()}');
      var path = "/${RouterConstants.home}/${RouterConstants.newsList}";
      print('ttt -----> _handleDataMessage 2');
      /*if (dataPushModel.id != null) {
        path = RouterConstants.email;
      } else if (dataPushModel.href != null) {
        path = "${RouterConstants.home}/${RouterConstants.event}";
      } else {
        path = "${RouterConstants.home}/${RouterConstants.newsList}";
      }*/
      //await Future.delayed(Duration.zero);
      navigateFromPush(path);
    }
  }

  static void navigateFromPushData(String path, Object data) {
    print("go with context ${Configs.navigatorKey.currentContext != null} path : $path");
    Configs.navigatorKey.currentContext?.go(path, extra: data);
  }

  static void navigateFromPush(String path) {
    print("go with context ${Configs.navigatorKey.currentContext != null} path : $path");
    Configs.navigatorKey.currentContext?.go(path);
  }
}
