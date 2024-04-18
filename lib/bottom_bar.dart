import 'package:finance_app2_0/pages/game_page.dart';
import 'package:finance_app2_0/pages/home_page.dart';
import 'package:finance_app2_0/pages/news_page.dart';
import 'package:finance_app2_0/pages/quiz_page.dart';
import 'package:finance_app2_0/pages/user_page.dart';
import 'package:flutter/material.dart';

enum EPageOnSelect {
  homePage,

  newsPage,
  gamePage,
  quizPage,
  settingsPage
}

class BottomBar extends StatefulWidget {
  const BottomBar(
      {super.key, required this.callBack, this.fromCocktailPage = false});
  final VoidCallback callBack;
  final bool fromCocktailPage;

  @override
  State<BottomBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 10, 16, 10),
      child: Container(
        decoration: BoxDecoration(
            color: const Color(0xFFF0F6FE),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                blurRadius: 15.0,
                spreadRadius: 10.0,
                offset: const Offset(
                  5.0,
                  5.0,
                ),
              ),
            ],
            borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                page = EPageOnSelect.homePage;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const HomePage()),
                    (route) => false);
                widget.callBack();
                setState(() {});
              },
              child: SizedBox(
                  width: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      page == EPageOnSelect.homePage
                          ? Image.asset(
                              'assets/home.png',
                              color: const Color(0xFF6F6CD9),
                            )
                          : Image.asset(
                              'assets/home.png',
                              color: Colors.black
                                  .withOpacity(0.4)
                                  .withOpacity(0.4),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('Operations',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                color: page == EPageOnSelect.homePage
                                    ? const Color(0xFF6F6CD9)
                                    : Colors.black.withOpacity(0.4),
                                fontSize: 12)),
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                page = EPageOnSelect.newsPage;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const NewsPage()),
                    (route) => false);
                widget.callBack();
                setState(() {});
              },
              child: SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      page == EPageOnSelect.newsPage
                          ? Image.asset(
                              'assets/news.png',
                              color: const Color(0xFF6F6CD9),
                            )
                          : Image.asset(
                              'assets/news.png',
                              color: Colors.black
                                  .withOpacity(0.4)
                                  .withOpacity(0.4),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('News',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                color: page == EPageOnSelect.newsPage
                                    ? const Color(0xFF6F6CD9)
                                    : Colors.black.withOpacity(0.4),
                                fontSize: 12)),
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                page = EPageOnSelect.gamePage;
                game.initCards();
                game.initGame();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const GamePage()),
                    (route) => false);
                widget.callBack();
                setState(() {});
              },
              child: SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      page == EPageOnSelect.gamePage
                          ? Image.asset(
                              'assets/game.png',
                              color: const Color(0xFF6F6CD9),
                            )
                          : Image.asset(
                              'assets/game.png',
                              color: Colors.black
                                  .withOpacity(0.4)
                                  .withOpacity(0.4),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('Game',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                color: page == EPageOnSelect.gamePage
                                    ? const Color(0xFF6F6CD9)
                                    : Colors.black.withOpacity(0.4),
                                fontSize: 12)),
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                page = EPageOnSelect.quizPage;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const QuizPage()),
                    (route) => false);
                widget.callBack();
                setState(() {});
              },
              child: SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      page == EPageOnSelect.quizPage
                          ? Image.asset(
                              'assets/quiz.png',
                              color: const Color(0xFF6F6CD9),
                            )
                          : Image.asset(
                              'assets/quiz.png',
                              color: Colors.black.withOpacity(0.4),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('Quiz',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                color: page == EPageOnSelect.quizPage
                                    ? const Color(0xFF6F6CD9)
                                    : Colors.black.withOpacity(0.4),
                                fontSize: 12)),
                      )
                    ],
                  )),
            ),
            InkWell(
              onTap: () {
                page = EPageOnSelect.settingsPage;
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const UserPage()),
                    (route) => false);
                widget.callBack();
                setState(() {});
              },
              child: SizedBox(
                  width: 50,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      page == EPageOnSelect.settingsPage
                          ? Image.asset(
                              'assets/settings.png',
                              color: const Color(0xFF6F6CD9),
                            )
                          : Image.asset(
                              'assets/settings.png',
                              color: Colors.black.withOpacity(0.4),
                            ),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text('Settings',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontWeight: FontWeight.w500,
                                color: page == EPageOnSelect.settingsPage
                                    ? const Color(0xFF6F6CD9)
                                    : Colors.black.withOpacity(0.4),
                                fontSize: 12)),
                      )
                    ],
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
