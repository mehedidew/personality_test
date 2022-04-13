import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:personality_test/global/global.dart';
import 'package:personality_test/model/questionModel.dart';
import 'package:sizer/sizer.dart';

class QuestionUI extends StatefulWidget {
  static var routeName = 'questionUI';
  final List<QuestionModel>? questions;
  const QuestionUI({Key? key, this.questions}) : super(key: key);

  @override
  _QuestionUIState createState() => _QuestionUIState();
}

class _QuestionUIState extends State<QuestionUI> {
  final PageController _pageController = PageController(initialPage: 0);
  late List<QuestionModel> questionList;
  String buttonText = 'Next';
  @override
  void initState() {
    super.initState();
    questionList = widget.questions!;
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
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
        child: Center(
          child: Padding(
            padding: EdgeInsets.only(
              top: 8.w,
            ),
            child: PageView(
              controller: _pageController,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              children: List.generate(questionList.length, (index) {
                QuestionModel question = questionList[index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 80.w,
                      child: Text(
                        question.question,
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
                    Container(
                      width: 90.w,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: question.answers.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: SizedBox(
                              height: 6.h,
                              child: ElevatedButton(
                                style: ButtonStyle(
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
                                  backgroundColor: MaterialStateProperty.all(question.selected == question.answers[index] ? Colors.white : Colors.pink),
                                ),
                                onPressed: () {
                                  setState(() {
                                    question.selected = question.answers[index];
                                  });
                                },
                                child: Center(
                                    child: Text(
                                  question.answers[index].text,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: question.selected == question.answers[index] ? pink : Colors.white,
                                    fontSize: 10.0.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'OpenSans',
                                  ),
                                )),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                      width: 40.w,
                      child: Directionality(
                        textDirection: TextDirection.rtl,
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
                            if (question.selected != null) {
                              _pageController.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
                              print(question.selected?.score);
                            } else {
                              Fluttertoast.showToast(
                                  msg: "Please select an answer",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.BOTTOM,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: lightPink,
                                  textColor: Colors.pink,
                                  fontSize: 12.sp);
                            }
                          },
                          child: Center(
                              child: Text(
                            buttonText,
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
                  ],
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  button(bool last, VoidCallback voidCallback) {
    if (last == true) {
    } else {
      return SizedBox(
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
          onPressed: voidCallback,
          child: Center(
              child: Text(
            buttonText,
            style: TextStyle(
              color: Colors.white,
              fontSize: 10.0.sp,
              letterSpacing: 2,
              fontWeight: FontWeight.bold,
              fontFamily: 'OpenSans',
            ),
          )),
        ),
      );
    }
  }
}
