// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../models/question_model.dart';

// class QuizScreen extends StatefulWidget {
//   @override
//   _QuizScreenState createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   late List<Trivia> triviaList;
//   int currentQuestionIndex = 0;
//   bool answered = false;

//   @override
//   void initState() {
//     super.initState();
//     loadData();
//   }

//   Future<void> loadData() async {
//     try {
//       ApiCalling apiCalling = ApiCalling();
//       List<Trivia> data = await apiCalling.getData();
//       setState(() {
//         triviaList = data;
//         shuffleOptions();
//       });
//     } catch (e) {
//       print("Error loading data: $e");
//     }
//   }

//   // Widget buildLoading() {
//   //   return Center(
//   //     child: CircularProgressIndicator(),
//   //   );
//   // }

//   void shuffleOptions() {
//     var currentQuestion = triviaList[currentQuestionIndex];
//     var options = List<String>.from(currentQuestion.incorrectAnswers!);
//     options.add(currentQuestion.correctAnswer!);
//     options.shuffle();

//     // Update the shuffled options to the current question
//     currentQuestion.incorrectAnswers = options;
//   }

//   Future<void> checkAnswer(String selectedAnswer) async {
//     if (answered) return;

//     setState(() {
//       answered = true;
//     });

//     Trivia currentQuestion = triviaList[currentQuestionIndex];
//     String correctAnswer = currentQuestion.correctAnswer!;

//     //shared preference
//     bool isCorrect = selectedAnswer == correctAnswer;

//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     List<String> selectedOptions =
//         prefs.getStringList('selected_options') ?? [];

//     // selectedOptions.add(selectedAnswer);
//     selectedOptions
//         .add('$selectedAnswer - ${isCorrect ? 'Correct' : 'Incorrect'}');

//     prefs.setStringList('selected_options', selectedOptions);

//     //shared preference end

//     if (selectedAnswer == correctAnswer) {
//       // Correct answer
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Correct!'),
//           backgroundColor: Colors.green,
//         ),
//       );
//     } else {
//       // Incorrect answer
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text('Incorrect!'),
//           backgroundColor: Colors.red,
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (currentQuestionIndex >= triviaList.length) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Trivia Quiz App'),
//         ),
//         body: Center(
//           child: Text('End of Quiz'),
//         ),
//       );
//     }

//     Trivia currentQuestion = triviaList[currentQuestionIndex];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Trivia Quiz App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text(
//               'Question ${currentQuestionIndex + 1}/${triviaList.length}',
//               style: TextStyle(fontSize: 20),
//             ),
//             SizedBox(height: 20),
//             Text(
//               currentQuestion.question!.text!,
//               style: TextStyle(fontSize: 24),
//             ),
//             SizedBox(height: 20),
//             Column(
//               children: currentQuestion.incorrectAnswers!
//                   .map((option) => ElevatedButton(
//                         onPressed: () {
//                           checkAnswer(option);
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: answered
//                               ? (option == currentQuestion.correctAnswer
//                                   ? Colors.green
//                                   : Colors.red)
//                               : null,
//                         ),
//                         child: Text(option),
//                       ))
//                   .toList(),
//             ),
//             SizedBox(height: 20),
//             ElevatedButton(
//               onPressed: () {
//                 // Move to the next question and shuffle options
//                 setState(() {
//                   currentQuestionIndex++;
//                   answered = false;
//                   shuffleOptions();
//                 });
//               },
//               child: Text('Next Question'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// with circular progress indicator

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/question_model.dart';
import 'result_screen.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Trivia> triviaList;
  int currentQuestionIndex = 0;
  bool answered = false;
  bool isLoading = true; // Add this flag for loading state

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    try {
      ApiCalling apiCalling = ApiCalling();
      List<Trivia> data = await apiCalling.getData();
      setState(() {
        triviaList = data;
        shuffleOptions();
        isLoading = false; // Set loading to false when data is loaded
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  void shuffleOptions() {
    var currentQuestion = triviaList[currentQuestionIndex];
    var options = List<String>.from(currentQuestion.incorrectAnswers!);
    options.add(currentQuestion.correctAnswer!);
    options.shuffle();

    // Update the shuffled options to the current question
    currentQuestion.incorrectAnswers = options;
  }

  Future<void> checkAnswer(String selectedAnswer) async {
    if (answered) return;

    setState(() {
      answered = true;
    });

    Trivia currentQuestion = triviaList[currentQuestionIndex];
    String correctAnswer = currentQuestion.correctAnswer!;

    // shared preference
    bool isCorrect = selectedAnswer == correctAnswer;

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> selectedOptions =
        prefs.getStringList('selected_options') ?? [];

    selectedOptions
        .add('$selectedAnswer - ${isCorrect ? 'Correct' : 'Incorrect'}');

    prefs.setStringList('selected_options', selectedOptions);

    // shared preference end

    if (selectedAnswer == correctAnswer) {
      // Correct answer
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Correct!'),
          backgroundColor: Colors.green,
        ),
      );
    } else {
      // Incorrect answer
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Incorrect!'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    // if (currentQuestionIndex >= triviaList.length) {
    //   return Scaffold(
    //     appBar: AppBar(
    //       title: Text('Trivia Quiz App'),
    //     ),
    //   );
    // }

    Trivia currentQuestion = triviaList[currentQuestionIndex];

    return Scaffold(
      appBar: AppBar(
        title: Text('Trivia Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Question ${currentQuestionIndex + 1}/${triviaList.length}',
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              currentQuestion.question!.text!,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            Column(
              children: currentQuestion.incorrectAnswers!
                  .map((option) => ElevatedButton(
                        onPressed: () {
                          checkAnswer(option);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: answered
                              ? (option == currentQuestion.correctAnswer
                                  ? Colors.green
                                  : Colors.red)
                              : null,
                        ),
                        child: Text(option),
                      ))
                  .toList(),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: answered
                  ? () {
                      ScaffoldMessenger.of(context).removeCurrentSnackBar();
                      if (currentQuestionIndex < triviaList.length - 1) {
                        // If there are more questions, move to the next question
                        setState(() {
                          currentQuestionIndex++;
                          answered = false;
                          shuffleOptions();
                        });
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ResultScreen(),
                          ),
                        );
                      }
                    }
                  : null,
              child: Text(
                currentQuestionIndex < triviaList.length - 1
                    ? 'Next Question'
                    : 'View Results',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
