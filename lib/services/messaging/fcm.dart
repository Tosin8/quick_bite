// import 'package:QuickBite/main.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';


// Future<void> handleBackgroundMessage(RemoteMessage message) async {
//   print('Title: ${message.notification?.title}');
//    print('Body: ${message.notification?.body}');
//     print('Payload: ${message.data}');
// }

// void handleMessage(RemoteMessage? message) {
//   if (message != null)  return; 
    

// navigatorKey.currentState?.pushNamed('/inbox', arguments: message);

// }

// // function to initialize background settings. 
// Future initPushNotifications() async {
//   await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
//     alert: true,
//     badge: true,
//     sound: true, 
//   ); 

// // handle notifications if the app was terminated and now opened. 
//   FirebaseMessaging.instance.getInitialMessage().then(handleMessage);

//   // attach event listenrs for when a notification oens the app. 
//   FirebaseMessaging.onMessageOpenedApp.listen(handleMessage);  
//   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage); 
// }
// class FirebaseApi{

//   /// create an instance of firebase messaging. 
//   final _firebaseMessaging = FirebaseMessaging.instance;

// // function to initialize notifications. 
//   Future<void> initNotifications() async {

//     // request permission form user. 
//     await _firebaseMessaging.requestPermission();

//     // fetch the fcm token for this device. 
//     final fcmToken = await _firebaseMessaging.getToken();

//     // print the fcm token.
//     print('Token:  $fcmToken');
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage); 
//     initPushNotifications();
  
//   }
// }


import 'package:firebase_messaging/firebase_messaging.dart';

class FCMService {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  void initializeFCM() {
    // Request permissions for iOS
    _firebaseMessaging.requestPermission();

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print('Received a message while in the foreground!');
      print('Message data: ${message.data}');
    });

    // Handle background messages
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  }

  static Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
    print("Handling a background message: ${message.messageId}");
  }

  // Example function to send a notification (this would normally be done via Firebase Console or backend)
  void sendNotification() {
    _firebaseMessaging.subscribeToTopic('orders');
  }
}
