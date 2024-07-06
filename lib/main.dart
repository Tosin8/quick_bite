

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:quick_bite/firebase_options.dart';
import 'package:quick_bite/screens/form/signup.dart';
import 'package:quick_bite/screens/home.dart';
import 'package:quick_bite/screens/inbox.dart';
import 'package:quick_bite/services/messaging/fcm.dart';



import 'model/restaurant.dart';
import 'model/usermodel.dart';
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


// adding navigating key to easy navigation between apps. 
final navigatorKey = GlobalKey<NavigatorState>();


void main() async { 
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

await FirebaseApi().initNotifications(); 
   //await uploadFoodDetails();




  runApp(
   
       const MyApp(),
      
  ); 
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(
          create: (_) => AuthService(),
        ),
        StreamProvider<User?>(
          create: (context) => context.read<AuthService>().authStateChanges,
          initialData: null,
        ),
       
     ChangeNotifierProvider<ThemeProvider>(
          create: (_) => ThemeProvider(),
        ),

  StreamProvider<User?>.value(
          value: AuthService().authStateChanges,
          initialData: null,
        ),
     
         ChangeNotifierProvider(create: (_) => ForgotPasswordProvider()),
    // restaurant provider
    ChangeNotifierProvider(create: (context) => Restaurant()), 
    ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child:  Consumer<ThemeProvider>(
        builder: (context, themeProvider, child) {
          return MaterialApp(
      debugShowCheckedModeBanner: false, 
        supportedLocales: const [
          Locale('en', ''), // English, no country code
          // Add other supported locales here
        ],
        // localizationsDelegates: [
        //   GlobalMaterialLocalizations.delegate,
        //   GlobalWidgetsLocalizations.delegate,
        //   GlobalCupertinoLocalizations.delegate,
        // ],
      home: const SplashScreen(), 
     // home: const AuthGate(), 
       theme: Provider.of<ThemeProvider>(context).themeData,
   //initialRoute: '/',
        routes: {
         // '/': (context) => SplashScreen(),
       //  '/': (context) => const AuthWrapper(),
          '/home': (context) =>  const HomeScreen(),
          '/signup': (context) =>  const SignUpScreen(),
          '/login': (context) => const LoginScreen(),
          '/forgot_password': (context) => const ForgotpwdScreen(),
          '/verify_email': (context) => const VerificationScreen(),
          '/profile': (context) => const ProfileScreen(userId: '',),
'/congratulations': (context) => const CongratulatoryScreen(),
'/reset-password': (context) => const ResetPasswordScreen(),
          '/reset-congratulations': (context) => PasswordResetSuccessScreen(),
          '/new_password': (context) => NewPasswordScreen(email: '',),
          '/inbox': (context) =>  InboxScreen(),
        },
    );
  }));
  }
}

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User?>(context);

    if (user != null) {
      return const HomeScreen();
    } else {
      return const LoginScreen();
    }
  }
}