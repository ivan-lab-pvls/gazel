import 'package:dots_indicator/dots_indicator.dart';
import 'package:finance_app2_0/pages/home_page.dart';
import 'package:flutter/material.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  ValueNotifier<int> page = ValueNotifier(0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F6FE),
      body: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 65, 16, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'GAZEL: Invest',
                  style: TextStyle(
                    fontFamily: 'SF Pro Text',
                    fontSize: 32,
                    fontWeight: FontWeight.w400,
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 26, 32),
            child: Image.asset('assets/icon.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ValueListenableBuilder(
                  valueListenable: page,
                  builder: (context, index, child) => DotsIndicator(
                    dotsCount: 2,
                    position: page.value,
                    decorator: DotsDecorator(
                      size: const Size(8.0, 8.0),
                      activeSize: const Size(16.0, 8.0),
                      spacing: const EdgeInsets.all(3),
                      activeColor: const Color(0xFF5E81FF),
                      color: const Color(0xFFDFEAF9),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                      activeShape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (page.value == 0)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Manage your rental',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          if (page.value == 0)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'Track your real estate payments\nwith ease',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          if (page.value == 1)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Check your wallet',
                    style: TextStyle(
                        fontFamily: 'SF Pro Text',
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
          if (page.value == 1)
            const Padding(
              padding: EdgeInsets.fromLTRB(16, 0, 16, 55),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Flexible(
                    child: Text(
                      'In our app you can track your spendings and incomes',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'SF Pro Text',
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: InkWell(
              onTap: () {
                if (page.value == 0) {
                  page.value = 1;
                  setState(() {});
                } else if (page.value == 1) {
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute<void>(
                        builder: (BuildContext context) => const HomePage()),
                  );
                }
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
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
