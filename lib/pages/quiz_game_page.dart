import 'dart:math';
import 'package:finance_app2_0/model/answer_item.dart';
import 'package:finance_app2_0/model/question_item.dart';
import 'package:finance_app2_0/model/result_item.dart';
import 'package:finance_app2_0/pages/final_quiz_page.dart';
import 'package:finance_app2_0/pages/quiz_page.dart';
import 'package:finance_app2_0/pages/user_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class QuizGamePage extends StatefulWidget {
  const QuizGamePage({
    super.key,
  });

  @override
  State<QuizGamePage> createState() => _QuizGamePageState();
}

class _QuizGamePageState extends State<QuizGamePage> {
  List<QuestionItem> questions = [
    QuestionItem(
        title: 'What is APR in the context of credit cards and loans?',
        answers: [
          AnswerItem(title: 'Annual Percentage Rate', isCorrect: true),
          AnswerItem(title: 'Automatic Payment Recognition', isCorrect: false),
          AnswerItem(title: 'Annual Amortization Rate ', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title:
            'What is the process of assessing the value of an asset or property called?',
        answers: [
          AnswerItem(title: 'Shareholder Assessment', isCorrect: false),
          AnswerItem(title: 'Market Valuation', isCorrect: true),
          AnswerItem(title: 'Active Management', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is ETF?',
        answers: [
          AnswerItem(title: 'One-time Trading Fund', isCorrect: false),
          AnswerItem(title: 'Exchange-Traded Fund', isCorrect: true),
          AnswerItem(title: 'Economic Tariff Fund', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the difference between stocks and bonds?',
        answers: [
          AnswerItem(
              title:
                  'Bonds represent ownership in a company, and stocks represent a promise to return money.',
              isCorrect: false),
          AnswerItem(
              title:
                  ' Stocks represent ownership in a company, and bonds represent a company\'s debt obligation.',
              isCorrect: true),
          AnswerItem(
              title: 'Bonds and stocks are the same thing.', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is an IRA?',
        answers: [
          AnswerItem(title: 'Individual Reserve Account ', isCorrect: false),
          AnswerItem(title: 'Individual Stock Growth ', isCorrect: false),
          AnswerItem(title: 'Individual Retirement Account', isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What factors affect a person\'s credit score? ',
        answers: [
          AnswerItem(
              title: 'Monthly income amount and eye color.', isCorrect: false),
          AnswerItem(title: 'Payment history and debt level.', isCorrect: true),
          AnswerItem(
              title:
                  ' Love for cats and the number of friends on social media.',
              isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title:
            'What is cash flow, and why is it important for financial planning?',
        answers: [
          AnswerItem(
              title:
                  'It\'s the cash flowing into a bank account, important for loan repayment.',
              isCorrect: false),
          AnswerItem(
              title: 'It\'s a company\'s profit, important for stock growth.',
              isCorrect: false),
          AnswerItem(
              title:
                  'It\'s the flow of cash into and out of a business or personal finances, important for evaluating financial health and decision-making.',
              isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is compound interest?',
        answers: [
          AnswerItem(
              title: 'Interest paid by the bank each year.', isCorrect: false),
          AnswerItem(
              title: 'Interest accrued only on the principal amount.',
              isCorrect: false),
          AnswerItem(
              title:
                  'Interest earned on the initial deposit and the interest already earned on it.',
              isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title:
            'What types of insurance are typically included in auto insurance?',
        answers: [
          AnswerItem(
              title: 'Life insurance and unemployment insurance.',
              isCorrect: false),
          AnswerItem(
              title: 'Home insurance and health insurance.', isCorrect: false),
          AnswerItem(
              title: 'Damage insurance and injury insurance.', isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title:
            'What is an investment portfolio, and why is it important for risk diversification?',
        answers: [
          AnswerItem(
              title:
                  'It\'s a collection of funds gathered for investment in a single asset.',
              isCorrect: false),
          AnswerItem(
              title:
                  'It\'s a combination of various assets such as stocks, bonds, real estate, and others, important for reducing investment risk.',
              isCorrect: true),
          AnswerItem(
              title:
                  'It\'s a strategy of investing only in one type of asset for maximizing profit.',
              isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title:
            'What documents are required for filing a tax return in the USA?',
        answers: [
          AnswerItem(title: 'Only a passport.', isCorrect: false),
          AnswerItem(title: 'Only a W-2 form.', isCorrect: false),
          AnswerItem(
              title: 'W-2 form, 1099 form, income, and deduction information.',
              isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What strategies can be used for debt reduction?',
        answers: [
          AnswerItem(title: 'Only ignoring debts', isCorrect: false),
          AnswerItem(
              title: 'Creating a budget and planning debt repayment.',
              isCorrect: true),
          AnswerItem(title: 'Closing all credit cards.', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the rule of 72 used for in finance?',
        answers: [
          AnswerItem(title: 'Calculating compound interest. ', isCorrect: true),
          AnswerItem(title: 'Assessing creditworthiness.', isCorrect: false),
          AnswerItem(title: 'Determining retirement age.', isCorrect: false),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What does FICO stand for in relation to credit scores?',
        answers: [
          AnswerItem(
              title: 'Financial Indicators and Credit Outcomes.',
              isCorrect: false),
          AnswerItem(
              title: 'Financial Instrument for Credit Oversight.',
              isCorrect: false),
          AnswerItem(title: 'Fair Isaac Corporation. ', isCorrect: true),
        ],
        isCompleted: false),
    QuestionItem(
        title: 'What is the purpose of a 401(k) retirement plan?',
        answers: [
          AnswerItem(title: 'Tax-free savings account.', isCorrect: false),
          AnswerItem(
              title: 'Employer-sponsored retirement savings plan.',
              isCorrect: true),
          AnswerItem(
              title: 'Student loan repayment program.', isCorrect: false),
        ],
        isCompleted: false),
  ];

  List colors = [
    const Color(0xFFE334FF),
    const Color(0xFF3B4DF0),
    const Color(0xFFA045FB),
    const Color(0xFFF475B2),
  ];
  List<String> images = [
    'assets/image1.jpg',
    'assets/image2.jpg',
    'assets/image3.jpg',
    'assets/image4.jpg',
    'assets/image5.jpg',
    'assets/image6.jpeg',
    'assets/image7.jpg',
  ];

  int index = 0;

  int questionNumber = 0;
  QuestionItem currentQuestion = QuestionItem();
  AnswerItem selected = AnswerItem();
  int correctAnswers = 0;
  String currentImage = '';
  @override
  void initState() {
    super.initState();
    questions.shuffle();
  }

  @override
  Widget build(BuildContext context) {
    Map<int, QuestionItem> quastionMap = {};
    quastionMap = questions.asMap();

    quastionMap.forEach((key, value) {
      if (key == questionNumber) {
        currentQuestion = value;
        if (selected.title == null) {
          currentImage = images[Random().nextInt(7)];
        }
      }
    });
    return Scaffold(
      backgroundColor: const Color(0xFFF0F6FE),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 60, 16, 37),
            child: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Row(
                    children: [
                      Icon(Icons.chevron_left),
                      Text(
                        'Back',
                        style: TextStyle(
                            fontFamily: 'SF Pro Text',
                            fontSize: 16,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                  Text(
                    '${questionNumber + 1}/15',
                    style: const TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 18,
                        fontWeight: FontWeight.w600),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                currentImage,
                              ))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 56, top: 24, left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            currentQuestion.title!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w400,
                                fontSize: 16),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: getAnswers(),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 18),
            child: InkWell(
              onTap: () {
                if (selected.title != null) {
                  currentQuestion.isCompleted = true;

                  if (questionNumber < 14) {
                    selected = AnswerItem();
                    questionNumber++;
                  } else {
                    ResultItem result = ResultItem();
                    result.count = correctAnswers;
                    result.date = DateFormat("MM/dd/yy").format(DateTime.now());
                    results.add(result);
                    addData();
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute<void>(
                          builder: (BuildContext context) => FinalQuizPage(
                                score: correctAnswers,
                              )),
                    );
                  }

                  setState(() {});
                }
              },
              child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      color: selected.title != null
                          ? const Color(0xFF5E81FF)
                          : const Color(0xFF5E81FF).withOpacity(0.5),
                      borderRadius: BorderRadius.circular(8)),
                  child: const Text(
                    'Next',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500),
                  )),
            ),
          ),
        ],
      ),
    );
  }

  Widget getAnswers() {
    List<Widget> list = [];

    for (var answer in currentQuestion.answers!) {
      list.add(InkWell(
        onTap: () {
          if (answer.isCorrect!) {
            correctAnswers++;
          }
          currentQuestion.isCorrect = answer.isCorrect;
          selected = answer;
          setState(() {});
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (selected == answer)
              const Icon(
                Icons.radio_button_checked,
                color: Color(0xFF5E81FF),
              ),
            if (selected != answer)
              const Icon(
                Icons.circle_outlined,
              ),
            const SizedBox(
              width: 7,
            ),
            Flexible(
              child: Text(
                answer.title!,
                style: const TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ],
        ),
      ));
      list.add(const SizedBox(
        height: 24,
      ));
    }

    return Column(
      children: list,
    );
  }
}
