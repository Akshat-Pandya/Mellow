import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mellowapp/firebase_options.dart';
import 'package:mellowapp/screens/auth_login.dart';
import 'package:mellowapp/screens/auth_signup.dart';
import 'package:mellowapp/screens/home_screen.dart';
import 'package:mellowapp/screens/profile.dart';
import 'package:mellowapp/screens/splash_screen.dart';
import 'package:mellowapp/screens/welcome_screens.dart';
import 'package:mellowapp/theme/mellowtheme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: MellowTheme.getTheme(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome': (context) => const WelcomeScreens(),
        '/home': (context) => const HomeScreen(),
        '/profile': (context) => const ProfileScreen(),
        '/login': (context) =>  LoginScreen(),
        '/signup': (context) =>  SignupScreen(),

      },
    );
  }
}



