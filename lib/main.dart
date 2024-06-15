import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/firebase_options.dart';
import 'package:quick_bite/model/restaurant.dart';
import 'package:quick_bite/screens/splash.dart';


import 'themes/theme_provider.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(

      providers: [
        // theme provider
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), 
      child: const MyApp(), 
    ), 

    // restaurant provider
    ChangeNotifierProvider(create: (context) => Restaurant()), 
      ], 
      child: const MyApp(),
      ), 
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false, 
      home: SplashScreen()
       
    );
  }
}