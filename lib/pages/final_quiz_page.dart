import 'package:finance_app2_0/pages/quiz_page.dart';
import 'package:flutter/material.dart';

class FinalQuizPage extends StatelessWidget {
  const FinalQuizPage({super.key, required this.score});
  final int score;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F6FE),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 65, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Your score',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text(
                    '$score / 15',
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5E81FF),
                        fontSize: 32),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(
                        child: score == 15
                            ? const Text(
                                'You have successfully answered all the questions, way to go!',
                                style: TextStyle(
                                    fontFamily: 'SF Pro Text',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              )
                            : score < 15 && score > 8
                                ? const Text(
                                    'You have a good grasp of the basics!',
                                    style: TextStyle(
                                        fontFamily: 'SF Pro Text',
                                        fontWeight: FontWeight.w400,
                                        fontSize: 16),
                                  )
                                : score == 0
                                    ? const Text(
                                        'You\'ll definitely make it next time',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      )
                                    : const Text(
                                        'It was close, try next time!',
                                        style: TextStyle(
                                            fontFamily: 'SF Pro Text',
                                            fontWeight: FontWeight.w400,
                                            fontSize: 16),
                                      )),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizPage()),
                    (route) => false);
              },
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: const Color(0xFF5E81FF),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        color: Color(0xFFF2F7FF),
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  )),
            ),
          ),
        ],
      ),
    );
  }
}
