import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/firebase_options.dart';
import 'package:gameapp_skiezui/screens/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AnimatedSplashScreen(
        splashIconSize: 350,
        backgroundColor: Colors.white,
        animationDuration: Duration(microseconds: 800),
        splash: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                "assets/image/quiz-time-logo-label-question-26-removebg-preview.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
        ),
        nextScreen: Login(),
        splashTransition: SplashTransition.slideTransition,
      ),
    );
  }
}
