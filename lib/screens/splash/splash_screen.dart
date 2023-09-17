import 'dart:async';
import 'package:XFoody/settings/size_configuration.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../Home/home.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoadingScreen();
  }
}

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 9), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomeScreen(key: Key("AHFG5CBS8KRHF1")),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfiguration().init(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(200),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/intro.gif'),
                  )),
            ),
            SizedBox(height: SizeConfiguration.defaultSize * 0.2),
            /*AnimatedTextKit(
              repeatForever: false,
              totalRepeatCount: 1,
              animatedTexts: [
                TyperAnimatedText('Welcome to XFoody',
                    speed: Duration(milliseconds: 100),
                    curve: Curves.ease,
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 28,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Parisienne')),
              ],
            ),*/ // second style desable comment to use it

            SizedBox(
              width: 250.0,
              child: Center(
                child: DefaultTextStyle(
                  style: const TextStyle(
                    fontSize: 30.0,
                    fontFamily: 'Baguette',
                  ),
                  child: AnimatedTextKit(
                    isRepeatingAnimation: false,
                    animatedTexts: [
                      TyperAnimatedText('XFoody',
                          speed: const Duration(milliseconds: 250)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
