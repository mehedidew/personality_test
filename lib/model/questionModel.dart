import 'package:personality_test/model/answerModel.dart';

class QuestionModel {
  final String question;
  final List<AnswerModel> answers;
  AnswerModel? selected;
  QuestionModel({
    required this.question,
    required this.answers,
    this.selected,
  });
}
