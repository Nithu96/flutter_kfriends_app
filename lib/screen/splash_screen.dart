import 'package:flutter/material.dart';
import 'dart:async';

import '../component/bottom_navigation_screen.dart';
import '../services/font_size.dart';
import 'sub_screen/home_screen.dart';


class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    Timer(const Duration(seconds: 5), () {
      Navigator.pushAndRemoveUntil<dynamic>(
        context,
        MaterialPageRoute<dynamic>(
          builder: (BuildContext context) => const BottomNaviScreen(),
        ),
            (route) => false, //if you want to disable back feature set to false
      );
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller.forward();
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: Color(0xFF82B9DF)),
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                'assets/splashLogo.png',
                scale: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
