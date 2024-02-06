import 'dart:async';

import 'package:flutter/material.dart';

import 'package:learning_project/screens/Welcom_Screen.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 8),
        () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => WelcomeScreen())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 838,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white70,
                  gradient: LinearGradient(
                      colors: [Colors.white70, Colors.indigo.shade300],
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter)),
              child: Center(
                child: Lottie.asset(
                  "assets/lottie/19146-tapered-hello.json",
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
