import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:assignment_task_1/homepage.dart';
import 'package:assignment_task_1/signup.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(MaterialApp(
    home: const MyApp(),
    routes: {
      Login.id: (context) => const Login(),
      Signup.id: (context) => const Signup(),
      HomePage.id: (context) => const HomePage()
    },
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        duration: 3000,
        splash: Icons.assignment,
        nextScreen: const Login(),
        splashTransition: SplashTransition.scaleTransition,
        backgroundColor: Colors.white);
  }
}
