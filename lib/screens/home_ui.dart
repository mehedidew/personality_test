import 'package:flutter/material.dart';
import 'package:personality_test/global/global.dart';
import 'package:personality_test/screens/question_ui.dart';
import 'package:sizer/sizer.dart';

class HomeUI extends StatefulWidget {
  static var routeName = '/home';
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
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
          child: Padding(
            padding: EdgeInsets.only(
              top: 8.w,
            ),
            child: SizedBox(
              height: 5.h,
              width: 40.w,
              child: ElevatedButton(
                style: ButtonStyle(
                  // backgroundColor: MaterialStateProperty.all(lightPink),
                  elevation: MaterialStateProperty.resolveWith(
                    (states) {
                      if (states.contains(MaterialState.pressed)) {
                        return 2.sp;
                      } else {
                        return 6.sp;
                      }
                    },
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.sp),
                    ),
                  ),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => QuestionUI(
                            questions: questions,
                          )));
                },
                child: Center(
                    child: Text(
                  'Start the test',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 10.0.sp,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'OpenSans',
                  ),
                )),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
