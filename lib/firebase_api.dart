import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:fun_education_app/firebase_options.dart';
import 'package:get/get.dart';

class FirebaseApi {
  void navigationPush(RemoteMessage? message) {
    if (message == null) return;
    var route = message.data['route'];

    if (route != null) {
      Get.toNamed(route);
    }
  }

  static final _firebaseMessaging = FirebaseMessaging.instance;
  static final channel = AndroidNotificationChannel(
    'high_importance_channel',
    'High Importance Notifications',
    importance: Importance.high,
  );
  static final flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static Future<void> initLocalNotification() async {
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }

  Future<void> initNotification() async {
    await _firebaseMessaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );
    final token = await _firebaseMessaging.getToken();
    FirebaseApi.initLocalNotification();
    FirebaseMessaging.onMessage.listen(FirebaseApi.handleMessage);
    FirebaseMessaging.onBackgroundMessage(FirebaseApi.handleBackgroundMessage);
    FirebaseMessaging.onMessageOpenedApp.listen(navigationPush);
    print(token);
  }

  static Future<void> subscribeToTopic(String topic) async {
    await _firebaseMessaging.subscribeToTopic(topic);
  }

  static Future<void> unsubscribeFromTopic(String topic) async {
    await _firebaseMessaging.unsubscribeFromTopic(topic);
  }

  static Future<void> handleMessage(RemoteMessage message) async {
    RemoteNotification notification = message.notification!;

    flutterLocalNotificationsPlugin.show(
      notification.hashCode,
      notification.title,
      notification.body,
      NotificationDetails(
        android: AndroidNotificationDetails(
          channel.id,
          channel.name,
          icon: '@mipmap/ic_launcher',
        ),
      ),
    );
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    print('Message data: ${message.data}');
  }
}
