import 'package:QuickBite/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


Future<void> handleBackgroundMessage(RemoteMessage message) async {
  print('Title: ${message.notification?.title}');
   print('Body: ${message.notification?.body}');
    print('Payload: ${message.data}');
}

void handleMessage(RemoteMessage? message) {
  if (message != null)  return; 
    

navigatorKey.currentState?.pushNamed('/inbox', arguments: message);

}

// function to initialize background settings. 
Future initPushNotifications() async {
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true, 
  ); 

// handle notifications if the app was terminated and now opened. 
  FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

  // attach event listenrs for when a notification oens the app. 
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
  
  }
}