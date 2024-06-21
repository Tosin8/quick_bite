import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:quick_bite/firebase_options.dart';
import 'package:quick_bite/model/restaurant.dart';
import 'package:quick_bite/screens/form/providers/login_providers.dart';import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:quick_bite/screens/form/signup.dart';
import 'package:quick_bite/screens/home.dart';
// ignore: unused_import
import 'package:quick_bite/services/auth/auth_gate.dart';


import 'screens/form/congrats_screen.dart';
import 'screens/form/newpwdscreen.dart';
import 'screens/form/pwd_reset_congrats.dart';
import 'screens/form/resetpwd.dart';
import 'screens/form/trash/forgotpwd.dart';
import 'screens/form/login.dart';
import 'screens/form/providers/forgotpwd_providers.dart';
import 'screens/form/verifyemail.dart';
import 'screens/profile.dart';
import 'screens/splash.dart';
import 'services/auth/auth_services.dart';
import 'themes/theme_provider.dart';

void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MultiProvider(

      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ), 
        // theme provider
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(), 
      child: const MyApp(), 
    ), 


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
          '/signup': (context) =>  const SignUpScreen(),
          '/login': (context) => LoginScreen(),
          '/forgot_password': (context) => const ForgotpwdScreen(),
          '/verify_email': (context) => const VerificationScreen(),
          '/profile': (context) => ProfileScreen(),
'/congratulations': (context) => const CongratulatoryScreen(),
'/reset-password': (context) => const ResetPasswordScreen(),
          '/reset-congratulations': (context) => PasswordResetSuccessScreen(),
          '/new_password': (context) => NewPasswordScreen(email: '',),
        },
    );
  }
}