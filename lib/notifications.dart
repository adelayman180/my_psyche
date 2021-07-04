import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import './main.dart';

final List<String> advices = [
  "The life is hope, who lost the hope is losing life.",
  "Find yourself a place at the top, at the bottom it's too crowded.",
  "If you cannot leave a beautiful trail in hearts, do not plant in them unforgettable money.",
  "It is not enough to have a good mind, the important thing is to use this mind well.",
  "When you taste the difficulties in your life, your mind will become much older than your age.",
  "Don't be confused about a matter, leave it, if it comes back to you, it is yours, and if it does not return, it is not yours.",
  "Don't despair if you take a step back, the arrow needs to take it back to go forward.",
  "When you're angry, you don't make decisions, and you're happy, you don't make promises.",
  "Hope is that small window that the smaller it is, but it opens up wide horizons.",
  "The best height that a person reaches and earns respect for is honesty.",
];

final List<String> tasks = [
  'Do new daily activities where you need to collaborate with people rather than in an individual way.',
  'Attend a party with your friends.',
  'Try to make new friends, one friend at least weekly.',
  'Try to talk to people without shyness or tension.',
  'Always talk out loud and don`t talk to yourself.',
  'Reply to all messages that you receive daily on social networking sites.',
  'Ask someone on the street for help without knowing him.',
  'Smile at people in the street and greete them without knowing them.',
  'Accept or attend at least 3 events per week that you are invited to.',
  'Play a team sport where you have to deal with people.',
];

void sendNotifications(
    DateTime scheduledNotificationDateTime, int index) async {
  var androidPlatformChannelSpecifics = AndroidNotificationDetails(
    'notif',
    'notif',
    'Channel for Alarm notification',
    icon: 'mipmap/ic_launcher',
    largeIcon: DrawableResourceAndroidBitmap('mipmap/ic_launcher'),
  );

  var platformChannelSpecifics =
      NotificationDetails(android: androidPlatformChannelSpecifics);

  await flutterLocalNotificationsPlugin.schedule(0, 'Today `s advice',
      advices[index], scheduledNotificationDateTime, platformChannelSpecifics);
}
