import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:quick_bite/components/drawer/app_drawer.dart';

class InboxScreen extends StatefulWidget {
  @override
  _InboxScreenState createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {


  @override
  Widget build(BuildContext context) {

    final message = ModalRoute.of(context)!.settings.arguments as RemoteMessage; 
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inbox'),
      ),
      drawer: AppDrawer(),
      body:  Padding(
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('${message.notification!.title}'), 
                    Text('${message.notification!.body}'),  
                     Text('${message.data}'), 
                ],
              ),
            )
          ]
        )
      ),
    );
  }
}
