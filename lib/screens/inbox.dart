// import 'package:QuickBite/components/drawer/app_drawer.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';


// class InboxScreen extends StatefulWidget {
//   const InboxScreen({super.key});

//   @override
//   _InboxScreenState createState() => _InboxScreenState();
// }

// class _InboxScreenState extends State<InboxScreen> {


//   @override
//   Widget build(BuildContext context) {

//     final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage; 
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Inbox'),
//       ),
//       drawer: const AppDrawer(),
//       body:  Padding(
//         padding: const EdgeInsets.all(12),
//         child: Column(
//           children: [
//             Container(
//               decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Text('${message.notification!.title}'), 
//                     Text('${message.notification!.body}'),  
//                      Text('${message.data}'), 
//                 ],
//               ),
//             )
//           ]
//         )
//       ),
//     );
//   }
// }

import 'package:QuickBite/components/drawer/app_drawer.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  _InboxScreenState createState() => _InboxScreenState();
}


class _InboxScreenState extends State<InboxScreen> {
  @override
  Widget build(BuildContext context) {
    // Safely get the message from ModalRoute arguments
    final args = ModalRoute.of(context)?.settings.arguments;
    RemoteMessage? message;

    // Check if the args are of type RemoteMessage
    if (args is RemoteMessage) {
      message = args;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      drawer: const AppDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: message != null
            ? Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(message.notification?.title ?? "No Title"),
                        Text(message.notification?.body ?? "No Body"),
                        Text(message.data.isNotEmpty ? message.data.toString() : "No Data"),
                      ],
                    ),
                  )
                ],
              )
            : const Center(
                child: Text("No message found"),
              ),
      ),
    );
  }
}

