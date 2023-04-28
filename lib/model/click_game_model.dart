import 'dart:io';
import 'dart:math';



// class Generator {
//   int first = 0;
//   int second = 0;

//   int correct = 0;
//   int incrrect = 0;

//   Random random = Random();

// // 1s call
//   void generateRandomNum() {
//     first = random.nextInt(101);
//     second = random.nextInt(101);
//     print('$first  $second');
//   }

// // 
//   int getGreaterValue() {
//     if (first > second) return first;
//     return second;
//   }
// // call this from view
//   void userInput({required int userValue}) {
//     if (userValue == getGreaterValue()) {
//       correct++;
//     } else {
//       incrrect++;
//     }
//   }
// }

// void main() {
//   Generator g = Generator();

//   for (int i = 0; i < 10; i++) {
//     g.generateRandomNum();
//     print('Choose your aswer : ${g.first}  or ${g.second}');
//     int userAnswer = int.parse(stdin.readLineSync()!);
//     g.userInput(userValue: userAnswer);
//   }
//   print('Result');
//   print(g.correct);
//   print(g.incrrect);
// }
