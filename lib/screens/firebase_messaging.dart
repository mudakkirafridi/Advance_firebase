import 'dart:math';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> backgroundHandler(RemoteMessage remoteMessage) async {
  print("${remoteMessage.notification!.title}");
}

class NotificationServices {
  static Future<void> initializing() async {
    //Notification setting
    NotificationSettings notificationSettings =
        await FirebaseMessaging.instance.requestPermission();
    if (notificationSettings.authorizationStatus ==
        AuthorizationStatus.authorized) {
      FirebaseMessaging.onBackgroundMessage(backgroundHandler);
      FirebaseMessaging.onMessage.listen((message) {
        print(message.notification.toString());
      });
      print('Message Authorized');
    }
  }
}
