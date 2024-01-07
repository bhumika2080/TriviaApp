// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trivia_app/main.dart';

// class ResultScreen extends StatefulWidget {
//   const ResultScreen({super.key});

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   String? userNameDisplay;
//   late List<String> resultDisplay;

//   @override
//   void initState() {
//     super.initState();
//     getUserName();
//   }

//   @override
//   Widget build(BuildContext context) {
//     getUserName();
//     getStringList();
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             userNameDisplay == null
//                 ? Text('Take the quiz first')
//                 : Text(userNameDisplay!),
//             resultDisplay == null
//                 ? Text('There was an error when showing your results')
//                 : Text(resultDisplay as String), // Ensure this line is correct
//           ],
//         ),
//       ),
//     );
//   }

//   void getUserName() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     userNameDisplay = pref.getString('usersname');
//     setState(() {
//       userNameDisplay = pref.getString('usersname');
//     });
//   }

//   // void getStringList() async {
//   //   final SharedPreferences pref = await SharedPreferences.getInstance();
//   //   resultDisplay = pref.getStringList('selected_options') as String?;
//   //   setState(() {
//   //     resultDisplay = pref.getStringList('selected_options') as String?;
//   //   });
//   // }
//   void getStringList() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     resultDisplay = pref.getStringList('selected_options')!;
//     setState(() {
//       resultDisplay = pref.getStringList('selected_options')!;
//     });
//   }
// }

// // // user ko result pani dekhauna ko lagi, displays username, answers and clear data button

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trivia_app/main.dart';

// class ResultScreen extends StatefulWidget {
//   const ResultScreen({Key? key}) : super(key: key);

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   String? userNameDisplay;
//   String resultDisplay = '';

//   @override
//   void initState() {
//     super.initState();
//     getUserName();
//     getStringList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             userNameDisplay == null
//                 ? Text('Take the quiz first')
//                 : Text(userNameDisplay!),
//             resultDisplay.isEmpty
//                 ? Text('There was an error when showing your results')
//                 : Text(resultDisplay),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: clearData,
//               child: Text('Clear Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void getUserName() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     userNameDisplay = pref.getString('usersname');
//     setState(() {
//       userNameDisplay = pref.getString('usersname');
//     });
//   }

//   void getStringList() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     List<String>? selectedOptions = pref.getStringList('selected_options');
//     resultDisplay = selectedOptions?.join(', ') ?? '';
//     setState(() {
//       resultDisplay = selectedOptions?.join(', ') ?? '';
//     });
//   }

//   void clearData() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.clear(); // Clears all data in SharedPreferences
//     setState(() {
//       userNameDisplay = null;
//       resultDisplay = '';
//     });
//   }
// }

// // // shows score and correct and incorrect

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:trivia_app/main.dart';

// class ResultScreen extends StatefulWidget {
//   const ResultScreen({Key? key}) : super(key: key);

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   String? userNameDisplay;
//   String resultDisplay = '';
//   int correctAnswersCount = 0;
//   int totalQuestions = 0;

//   @override
//   void initState() {
//     super.initState();
//     getUserName();
//     getStringList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             userNameDisplay == null
//                 ? Text('Take the quiz first')
//                 : Text(userNameDisplay!),
//             resultDisplay.isEmpty
//                 ? Text('There was an error when showing your results')
//                 : Column(
//                     children: [
//                       Text(resultDisplay),
//                       SizedBox(height: 20),
//                       Text('$correctAnswersCount/$totalQuestions Correct'),
//                     ],
//                   ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: clearData,
//               child: Text('Clear Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void getUserName() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     userNameDisplay = pref.getString('usersname');
//     setState(() {
//       userNameDisplay = pref.getString('usersname');
//     });
//   }

//   void getStringList() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     List<String>? selectedOptions = pref.getStringList('selected_options');
//     totalQuestions = selectedOptions?.length ?? 0;

//     // Reset the correct answers count
//     correctAnswersCount = 0;

//     resultDisplay = selectedOptions
//             ?.asMap()
//             .map((index, option) {
//               bool isCorrect = option == triviaList[index].correctAnswer;
//               if (isCorrect) {
//                 correctAnswersCount++;
//               }
//               return MapEntry(
//                 index,
//                 '$option - ${isCorrect ? "Correct" : "Incorrect"}',
//               );
//             })
//             .values
//             .join('\n') ??
//         '';

//     setState(() {
//       resultDisplay = selectedOptions
//               ?.asMap()
//               .map((index, option) {
//                 bool isCorrect = option == triviaList[index].correctAnswer;
//                 if (isCorrect) {
//                   correctAnswersCount++;
//                 }
//                 return MapEntry(
//                   index,
//                   '$option - ${isCorrect ? "Correct" : "Incorrect"}',
//                 );
//               })
//               .values
//               .join('\n') ??
//           '';
//     });
//   }

//   void clearData() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.clear(); // Clears all data in SharedPreferences
//     setState(() {
//       userNameDisplay = null;
//       resultDisplay = '';
//       correctAnswersCount = 0;
//       totalQuestions = 0;
//     });
//   }
// }

// // // shows if the answers are correct or not, but not the score

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class ResultScreen extends StatefulWidget {
//   const ResultScreen({Key? key}) : super(key: key);

//   @override
//   State<ResultScreen> createState() => _ResultScreenState();
// }

// class _ResultScreenState extends State<ResultScreen> {
//   String? userNameDisplay;
//   String resultDisplay = '';

//   @override
//   void initState() {
//     super.initState();
//     getUserName();
//     getStringList();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             userNameDisplay == null
//                 ? Text('Take the Quiz first to View your Results')
//                 : Text(
//                     'Hi ' + userNameDisplay! + ', This is Your Quiz Results:'),
//             resultDisplay.isEmpty ? Text('...results .. here...') : Text(resultDisplay),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: clearData,
//               child: Text('Clear Data'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   void getUserName() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     userNameDisplay = pref.getString('usersname');
//     setState(() {
//       userNameDisplay = pref.getString('usersname');
//     });
//   }

//   void getStringList() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     List<String>? selectedOptions = pref.getStringList('selected_options');
//     int correctCount = 0;

//     resultDisplay = selectedOptions?.map((option) {
//           List<String> parts = option.split(' - ');
//           if (parts.length == 2) {
//             String answer = parts[0];
//             String correctness = parts[1];
//             if (correctness == 'Correct') {
//               correctCount++;
//             }
//             return '$answer - $correctness';
//           }
//           return option;
//         }).join(', ') ??
//         '';

//     setState(() {
//       resultDisplay = selectedOptions?.map((option) {
//             List<String> parts = option.split(' - ');
//             if (parts.length == 2) {
//               String answer = parts[0];
//               String correctness = parts[1];
//               if (correctness == 'Correct') {
//                 correctCount++;
//               }
//               return '$answer - $correctness';
//             }
//             return option;
//           }).join(', \n') ??
//           '';
//     });

//     print('Correct Count: $correctCount');
//   }

//   void clearData() async {
//     final SharedPreferences pref = await SharedPreferences.getInstance();
//     pref.clear(); // Clears all data in SharedPreferences
//     setState(() {
//       userNameDisplay = null;
//       resultDisplay = '';
//     });
//   }
// }



// same as before but ui validation

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({Key? key}) : super(key: key);

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String? userNameDisplay;
  String resultDisplay = '';

  @override
  void initState() {
    super.initState();
    getUserName();
    getStringList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 50),
                userNameDisplay == null
                    ? Text('Take the Quiz first to View your Results')
                    : Text(
                        'Hi ' + userNameDisplay! + ', This is Your Quiz Results:'),
                        SizedBox(height: 20),
                resultDisplay.isEmpty
                    ? Text('...results .. here...')
                    : Text(resultDisplay),
                // SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ElevatedButton(
            onPressed: clearData,
            child: Text('Clear Data'),
          ),
        ),
      ),
    );
  }

  void getUserName() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    userNameDisplay = pref.getString('usersname');
    setState(() {
      userNameDisplay = pref.getString('usersname');
    });
  }

  void getStringList() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? selectedOptions = pref.getStringList('selected_options');

    resultDisplay = selectedOptions
            ?.map((option) {
              List<String> parts = option.split(' - ');
              if (parts.length == 2) {
                String answer = parts[0];
                String correctness = parts[1];
                return '$answer - $correctness';
              }
              return option;
            })
            .join(', \n') ??
        '';

    setState(() {
      resultDisplay = selectedOptions
              ?.map((option) {
                List<String> parts = option.split(' - ');
                if (parts.length == 2) {
                  String answer = parts[0];
                  String correctness = parts[1];
                  return '$answer - $correctness';
                }
                return option;
              })
              .join(', \n') ??
          '';
    });
  }

  void clearData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.clear(); // Clears all data in SharedPreferences
    setState(() {
      userNameDisplay = null;
      resultDisplay = '';
    });
  }
}
