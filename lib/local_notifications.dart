import 'package:flutter_local_notifications/flutter_local_notifications.dart';

//define this method in global scope not a class scope
void showNotificationMessage(String? description, String? title) {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  var android = AndroidInitializationSettings('@mipmap/ic_launcher');
  var iOS = IOSInitializationSettings();
  var initSettings = InitializationSettings(android: android, iOS: iOS);
  flutterLocalNotificationsPlugin.initialize(initSettings,
      onSelectNotification: null);

  String groupKey = 'com.example.general-notification-channel';
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'general-notification-channel',
    'general-notification-channel',
    'general-notification-channel',
    importance: Importance.max,
    priority: Priority.high,
    groupKey: groupKey,
    //   setAsGroupSummary: true
  );

  var iOSPlatformChannelSpecifics = IOSNotificationDetails();
  NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iOSPlatformChannelSpecifics);
  flutterLocalNotificationsPlugin.show(
      0, title, description, platformChannelSpecifics);
}