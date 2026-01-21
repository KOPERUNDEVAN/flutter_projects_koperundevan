import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gameapp_skiezui/screens/login.dart';
import 'package:gameapp_skiezui/widget/widget_screen.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 235,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/image/quiz-time-logo-label-question-26-removebg-preview.png",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(height: 40),
            ],
          ),
          Positioned(
            top: 680,
            left: 120,
            child: ElevatedButton(
              onPressed: () async {
                if (FirebaseAuth.instance.currentUser != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WidgetScreen()),
                  );
                } else {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Login()),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Color(0xff675b5b),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                "Get started",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
