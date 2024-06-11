import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/screens/splash.dart';


import 'themes/theme_provider.dart';

void main(){
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), 
      child: const MyApp(), 
    )
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