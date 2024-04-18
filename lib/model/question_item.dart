import 'package:finance_app2_0/model/answer_item.dart';

enum EQueastionType { financialLiteracy, bankingProducts, investments }

class QuestionItem {
  String? title;
  List<AnswerItem>? answers;
  bool? isCompleted;
  bool? isCorrect;

  QuestionItem({this.title, this.answers, this.isCompleted, this.isCorrect});
}
