import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:personality_test/screens/home_ui.dart';
import 'package:personality_test/screens/question_ui.dart';
import 'package:personality_test/screens/result_ui.dart';
import 'package:personality_test/screens/splashscreen.dart';
import 'package:sizer/sizer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (BuildContext context, Orientation orientation, DeviceType deviceType) {
      return MaterialApp(
        title: 'Personality Test',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.pink,
        ),
        initialRoute: SplashScreen.routeName,
        routes: {
          HomeUI.routeName: (context) => const HomeUI(),
          SplashScreen.routeName: (context) => const SplashScreen(),
          QuestionUI.routeName: (context) => const QuestionUI(),
          ResultUI.routeName: (context) => const ResultUI(
                score: 0,
              ),
        },
      );
    });
  }
}
