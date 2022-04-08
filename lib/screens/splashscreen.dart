import 'dart:async';

import 'package:flutter/material.dart';
import 'package:personality_test/global/global.dart';
import 'package:personality_test/screens/home_ui.dart';
import 'package:sizer/sizer.dart';

class SplashScreen extends StatefulWidget {
  static var routeName = '/splashscreen';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () => goto());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 100.h,
        width: 100.w,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/pink_background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Personality Test',
              style: TextStyle(
                color: pink,
                shadows: <Shadow>[
                  Shadow(
                    offset: const Offset(1.0, 1.0),
                    blurRadius: 1.sp,
                    color: Colors.pink,
                  ),
                ],
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h),
              child: Text(
                'Learn about yourself..',
                style: TextStyle(
                  color: Colors.black54,
                  shadows: <Shadow>[
                    Shadow(
                      offset: const Offset(1.0, 1.0),
                      blurRadius: 1.sp,
                      color: Colors.pink,
                    ),
                  ],
                  fontSize: 10.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 5.0.h),
              child: SizedBox(
                width: 40.0.w,
                child: LinearProgressIndicator(
                  color: pink,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  goto() {
    Navigator.popAndPushNamed(context, HomeUI.routeName);
  }
}
