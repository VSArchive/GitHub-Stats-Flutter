import 'dart:async';

import 'package:flutter/material.dart';
import 'package:github_stats/app/navigation/homepage.dart';

import 'app/navigation/homepage.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController rotationController;

  @override
  void initState() {
    rotationController =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);

    rotationController.forward();
    rotationController.addListener(() {
      setState(() {
        if (rotationController.status == AnimationStatus.completed) {
          rotationController.repeat();
        }
      });
    });
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context).pushReplacement(
        MaterialPageRoute(
            builder: (BuildContext context) => MaterialHomePage()),
      ),
    );
  }

  @override
  void dispose() {
    rotationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: RotationTransition(
        turns: Tween(begin: 0.0, end: 1.0).animate(rotationController),
        child: Image.asset(
          'assets/splash.png',
          scale: 3,
        ),
      )),
    );
  }
}
