import 'package:flutter/material.dart';
import 'package:personality_test/api/mock_api.dart';
import 'package:personality_test/global/global.dart';
import 'package:personality_test/screens/question_ui.dart';
import 'package:sizer/sizer.dart';

class ResultUI extends StatefulWidget {
  static var routeName = '/result';
  final int score;
  const ResultUI({Key? key, required this.score}) : super(key: key);

  @override
  _ResultUIState createState() => _ResultUIState();
}

class _ResultUIState extends State<ResultUI> {
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
        child: Center(
          child: Text(
            widget.score < 12 ? 'You are something!' : 'You are something else!',
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
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
