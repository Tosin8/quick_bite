import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';
import 'package:quick_bite/main.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {


  @override
  Widget build(BuildContext context) {

    final message = ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      drawer: AppDrawer(),
      body: const Center(
        child: Text('Inbox Screen'),
      ),
    );
  }
}


 // final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  // @override
  // void initState() {
  //   super.initState();
  //   setupFirebaseMessaging();
  // }

  // void setupFirebaseMessaging() {
  //   // Request permission for receiving notifications on iOS
  //   FirebaseMessaging.instance.requestPermission();

  //   // Configure foreground message handler
  //   FirebaseMessaging.onMessage.listen((RemoteMessage message) {
  //     print('Received message: ${message.notification!.body}');
  //     // Handle foreground messages here, e.g., show a notification
  //     _showNotification(message);
  //   });

  //   // Configure when the app is in the background but opened from the notification
  //   FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
  //     print('Message opened app: ${message.notification!.body}');
  //     // Handle when the app is opened from a notification
  //   });
  // }

  // Show notification using flutter_local_notifications plugin
  // void _showNotification(RemoteMessage message) async {
  //   AndroidNotificationDetails androidPlatformChannelSpecifics =
  //       const AndroidNotificationDetails(
  //     'your_channel_id', // Change to your channel ID
  //     'your_channel_name', // Change to your channel name
  //    /// 'your_channel_description', // Change to your channel description
  //     importance: Importance.max,
  //     priority: Priority.high,
  //   );
  //   NotificationDetails platformChannelSpecifics =
  //       NotificationDetails(android: androidPlatformChannelSpecifics);
  //   await flutterLocalNotificationsPlugin.show(
  //     0,
  //     message.notification!.title,
  //     message.notification!.body,
  //     platformChannelSpecifics,
  //     payload: 'item x',
  //   );
  // }