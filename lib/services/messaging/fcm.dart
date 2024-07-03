import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/screens/inbox.dart';

Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
   print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message != null)  {
    // Navigator.push(context, MaterialPageRoute(builder: (context) => InboxScreen()));
Navigator.pushNamed(context, '/inbox');

  }


}

Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true, 
  ); 

  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);
  FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);  
  FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage); 
}
class FirebaseApi{
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    print('Token:  $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage); 
  }
}