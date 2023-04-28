import 'dart:math';

import 'package:flutter/material.dart';

class ClickGame extends StatefulWidget {
  const ClickGame({super.key});

  @override
  State<ClickGame> createState() => _ClickGameState();
}

class _ClickGameState extends State<ClickGame> {
  int randomNum1 = Random().nextInt(101);
  int randomNum2 = Random().nextInt(101);
  int totalClicks = 0;
  int correctAnswer = 0;
  int incorrectAnswer = 0;
  bool isGameFinished = false;

  @override
  void initState() {
    super.initState();
    if (randomNum1 == randomNum2) {
      insertRandomNumber();
    }
  }

  void insertRandomNumber() {
    randomNum1 = Random().nextInt(101);
    randomNum2 = Random().nextInt(101);
  }

  void checkAnswer(int buttonNum) {
    if (totalClicks < 10) {
      if (buttonNum == 1) {
        if (randomNum1 > randomNum2) {
          correctAnswer++;
        } else {
          incorrectAnswer++;
        }
      } else if (buttonNum == 2) {
        if (randomNum2 > randomNum1) {
          correctAnswer++;
        } else {
          incorrectAnswer++;
        }
      }

      insertRandomNumber();
      if (randomNum1 == randomNum2) {
        insertRandomNumber();
      }
    } else {
      isGameFinished = true;
    }

    totalClicks++;
  }

  void reset() {
    totalClicks = 0;
    isGameFinished = false;
    correctAnswer = 0;
    incorrectAnswer = 0;
    insertRandomNumber();
  }
  // int button1 = 0;
  // int button2 = 0;
  // int counter = 0;
  // Generator genertor = Generator();

  // void userSubmitAnswer({required int answer}) {}

  // void getNewNumbers() {
  //   genertor.generateRandomNum();
  //   setState(() {
  //     button1 = genertor.first;
  //     button2 = genertor.second;
  //   });
  //   Generator g = Generator();

  //   for (int i = 0; i < 10; i++) {
  //     g.generateRandomNum();
  //     print('Choose your aswer : ${g.first}  or ${g.second}');
  //     int userAnswer = int.parse(stdin.readLineSync()!);
  //     g.userInput(userValue: userAnswer);
  //   }
  // }

  // @override
  // void initState() {
  //   super.initState();

  //   getNewNumbers();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Click Game'),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: SizedBox(
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkAnswer(1);
                            });
                          },
                          child: Text(
                            randomNum1.toString(),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.only(left: 8.0),
                        height: 100,
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              checkAnswer(2);
                            });
                          },
                          child: Text(randomNum2.toString()),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Result",
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "Incorrect Answer : ${isGameFinished ? incorrectAnswer : " "}",
                      style: const TextStyle(fontSize: 25),
                    ),
                    Text(
                        "Correct Answer : ${isGameFinished ? correctAnswer : ""}",
                        style: const TextStyle(fontSize: 25)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          reset();
                        });
                      },
                      child: const Text("Reload"),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
