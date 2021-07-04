import 'package:flutter/material.dart';
import 'root_page.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void main(List<String> args) {
  runApp(MaterialApp(
    theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.white),
    home: RootPage(),
  ));
  initialiseNotifications();
}

void initialiseNotifications() async {
  WidgetsFlutterBinding.ensureInitialized();

  var initializationSettingsAndroid =
      AndroidInitializationSettings('mipmap/ic_launcher');
  var initializationSettings =
      InitializationSettings(android: initializationSettingsAndroid);
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
}
