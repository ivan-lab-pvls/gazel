import 'package:finance_app2_0/bottom_bar.dart';
import 'package:finance_app2_0/model/game.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

GameModel game = GameModel();

class GamePage extends StatefulWidget {
  const GamePage({super.key});

  @override
  State<GamePage> createState() => _GamePageState();
}

class _GamePageState extends State<GamePage> {
  int matchedCard = 0;
  int score = 0;
  bool isComplete = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F6FE),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.fromLTRB(16, 60, 16, 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Game',
                  style: TextStyle(
                      fontFamily: 'SF Pro Text',
                      fontSize: 32,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 13),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Text(
                            'Find a pair and score the most points',
                            style: TextStyle(
                                fontFamily: 'SF Pro Text',
                                fontSize: 20,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 0, 16, 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          'Score: $score',
                          style: const TextStyle(
                              fontFamily: 'SF Pro Text',
                              color: Color(0xFF5E81FF),
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: 400,
                      width: 500,
                      child: GridView.builder(
                          itemCount: game.gameImg!.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 8,
                            crossAxisSpacing: 4.0,
                            mainAxisSpacing: 4.0,
                          ),
                          padding: const EdgeInsets.all(16.0),
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  game.gameImg![index] = game.cards_list[index];
                                  game.matchCheck
                                      .add({index: game.cards_list[index]});
                                });
                                if (game.matchCheck.length == 2) {
                                  if (game.matchCheck[0].values.first ==
                                      game.matchCheck[1].values.first) {
                                    game.matchCheck.clear();
                                    matchedCard = matchedCard + 2;
                                    score = score + 2;
                                    setState(() {});
                                    if (matchedCard == game.gameImg!.length) {
                                      // isComplete = true;
                                      // setState(() {});
                                    }
                                  } else {
                                    Future.delayed(
                                        const Duration(milliseconds: 500), () {
                                      setState(() {
                                        game.gameImg![game.matchCheck[0].keys
                                            .first] = game.hiddenCard;
                                        game.gameImg![game.matchCheck[1].keys
                                            .first] = game.hiddenCard;
                                        game.matchCheck.clear();
                                      });
                                    });
                                  }
                                }
                              },
                              child: Stack(
                                alignment: Alignment.center,
                                children: [
                                  Container(
                                    height: 34,
                                    width: 34,
                                    padding: const EdgeInsets.all(2),
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        color: const Color(0xFFDFEAF9)),
                                  ),
                                  game.gameImg![index] !=
                                          "assets/gameIcons/main_icon.png"
                                      ? Container(
                                          height: 34,
                                          width: 34,
                                          padding: const EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              color: const Color(0xFF5E81FF)),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Text(
                                                game.gameImg![index],
                                                textAlign: TextAlign.center,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        )
                                      : const SizedBox()
                                ],
                              ),
                            );
                          })),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 10),
            child: InkWell(
              onTap: () {
                game.initCards();
                game.initGame();
                score = 0;
                matchedCard = 0;
                setState(() {});
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: const Color(0xFF5E81FF),
                    borderRadius: BorderRadius.circular(8)),
                child: const Text(
                  'Restart',
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
          BottomBar(
            callBack: () {
              setState(() {});
            },
          ),
        ],
      ),
    );
  }
}
