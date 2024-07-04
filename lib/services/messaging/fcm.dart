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

  /// create an instance of firebase messaging. 
  final _firebaseMessaging = FirebaseMessaging.instance;

// function to initialize notifications. 
  Future<void> initNotifications() async {

    // request permission form user. 
    await _firebaseMessaging.requestPermission();

    // fetch the fcm token for this device. 
    final fcmToken = await _firebaseMessaging.getToken();

    // print the fcm token.
    print('Token:  $fcmToken');
    FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage); 
    initPushNotifications();
    handleMessage(message, context); 
  }
}