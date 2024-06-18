import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/firebase_options.dart';
import 'package:quick_bite/model/restaurant.dart';
import 'package:quick_bite/screens/form/providers/login_providers.dart';import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quick_bite/screens/form/register.dart';
import 'package:quick_bite/screens/home.dart';
// ignore: unused_import
import 'package:quick_bite/services/auth/auth_gate.dart';


import 'screens/form/congrats_screen.dart';
import 'screens/form/forgotpwd.dart';
import 'screens/form/login.dart';
import 'screens/form/providers/forgotpwd_providers.dart';
import 'screens/form/providers/register_providers.dart';
import 'screens/form/verifyemail.dart';
import 'screens/profile.dart';
import 'screens/splash.dart';
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
ChangeNotifierProvider(create: (_) => SignUpProvider()),
        ChangeNotifierProvider(create: (_) => LoginProvider()),
         ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
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
    return   MaterialApp(
      debugShowCheckedModeBanner: false, 
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          // Add other supported locales here
        ],
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
      home: SplashScreen(), 
     // home: const AuthGate(), 
       theme: Provider.of<ThemeProvider>(context).themeData,
   // initialRoute: '/',
        routes: {
         // '/': (context) => SplashScreen(),
          '/home': (context) => const HomeScreen(),
          '/signup': (context) => const RegisterScreen(),
          '/login': (context) => const LoginScreen(),
          '/forgot_password': (context) => const ForgotpwdScreen(),
          '/verify_email': (context) => VerifyEmailScreen(),
          '/profile': (context) => ProfileScreen(),
'/congrats': (context) => CongratsScreen(),
        },
    );
  }
}