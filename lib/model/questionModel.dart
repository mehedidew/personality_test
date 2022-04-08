import 'package:personality_test/model/answerModel.dart';

class QuestionModel {
  final String question;
  final List<AnswerModel> answers;
  QuestionModel({
    required this.question,
    required this.answers,
  });
}
