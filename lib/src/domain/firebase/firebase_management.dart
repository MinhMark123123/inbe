import 'package:aac_core/aac_core.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:inabe/firebase_options.dart';
import 'package:inabe/src/data/constants/constants.dart';
import 'package:inabe/src/data/sources/local/key_data_source.dart';
import 'package:inabe/src/domain/notification_task/fcm_push.dart';
import 'package:inabe/src/domain/notification_task/notification_task.dart';

class FirebaseManagement {
  FirebaseManagement._();

  static Future<void> initializeApp() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;
    //FCM
    String? token = await FirebaseMessaging.instance.getToken();
    print("ttt --- token FirebaseMessaging: $token");
    KeyDataSource sharePref = KeyDataSource();
    sharePref.setFCMToken(token);
    FirebaseMessaging.onBackgroundMessage(firebaseMessagingBackgroundHandler);
    FirebaseMessaging.onMessage.listen(WorkerUpdateInformation.foregroundFCM);
    FirebaseMessaging.instance
        .subscribeToTopic(NotificationConstant.keyTopic);
  }
}
