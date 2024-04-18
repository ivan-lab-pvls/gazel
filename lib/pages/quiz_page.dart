import 'package:finance_app2_0/bottom_bar.dart';
import 'package:finance_app2_0/model/result_item.dart';
import 'package:finance_app2_0/pages/quiz_game_page.dart';
import 'package:finance_app2_0/pages/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<ResultItem> results = [];

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  @override
  void initState() {
    super.initState();
    getData(
      () {
        setState(() {});
      },
    );
  }

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
                  'Quiz',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: results.isEmpty
                ? const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 68),
                        child: Text(
                          'Check how much you know about finance',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontFamily: 'SF Pro Text',
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      )
                    ],
                  )
                : SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: getResults(),
                    ),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute<void>(
                      builder: (BuildContext context) => const QuizGamePage()),
                );
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF5E81FF),
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  results.isEmpty ? 'Start' : 'Try again',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          BottomBar(
            callBack: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }

  Widget getResults() {
    List<Widget> list = [];
    for (var result in results) {
      list.add(Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
            color: const Color(0xFFDFEAF9),
            borderRadius: BorderRadius.circular(8)),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${result.count} / 15',
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF5E81FF),
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  Flexible(
                      child: result.count == 15
                          ? const Text(
                              'You have successfully answered all the questions, way to go!',
                              style: TextStyle(
                                  fontFamily: 'SF Pro Text',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16),
                            )
                          : result.count! < 15 && result.count! > 8
                              ? const Text(
                                  'You have a good grasp of the basics!',
                                  style: TextStyle(
                                      fontFamily: 'SF Pro Text',
                                      fontWeight: FontWeight.w400,
                                      fontSize: 16),
                                )
                              : result.count == 0
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
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  result.date!,
                  style: const TextStyle(
                      fontFamily: 'SF Pro Text',
                      color: Color(0xFF24262B),
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                )
              ],
            )
          ],
        ),
      ));
      list.add(const SizedBox(
        height: 12,
      ));
    }
    return Column(
      children: list,
    );
  }
}
