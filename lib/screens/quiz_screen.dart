// // initial stateful class, no modifications

// import 'package:flutter/material.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen>
//     with SingleTickerProviderStateMixin {
//   late AnimationController _controller;

//   @override
//   void initState() {
//     super.initState();
//     _controller = AnimationController(vsync: this);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }



// chatgpt second attempt

// import 'package:flutter/material.dart';
// import '../models/question_model.dart';
// import '../models/quiz_questions.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({Key? key}) : super(key: key);

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   late List<QuizQuestion> quizQuestions;
//   int currentIndex = 0;

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     List<QuizQuestion> questions = await ApiCalling().getData();
//     setState(() {
//       quizQuestions = questions;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (quizQuestions.isEmpty) {
//       return Scaffold(
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     QuizQuestion currentQuestion = quizQuestions[currentIndex];

//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Quiz Question ${currentIndex + 1}'),
//       ),
//       body: Column(
//         children: [
//           Text(currentQuestion.questionText),
//           // Display answer options (use Radio, Checkbox, or any other UI)
//           // ...

//           // Navigation buttons
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: [
//               ElevatedButton(
//                 onPressed: _previousQuestion,
//                 child: Text('Previous'),
//               ),
//               ElevatedButton(
//                 onPressed: _nextQuestion,
//                 child: Text('Next'),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   void _nextQuestion() {
//     if (currentIndex < quizQuestions.length - 1) {
//       setState(() {
//         currentIndex++;
//       });
//     } else {
//       print('End of the quiz');
//     }
//   }

//   void _previousQuestion() {
//     if (currentIndex > 0) {
//       setState(() {
//         currentIndex--;
//       });
//     } else {
//       print('Already at the first question');
//     }
//   }
// }


// copied from another app 

// import 'package:flutter/material.dart';

// import '../components/answer_card.dart';
// import '../components/rectangular_button.dart';
// import '/screens/result_screen.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int? selectedAnswerIndex;
//   int questionIndex = 0;
//   int score = 0;
  

//   void pickAnswer(int value) {
//     selectedAnswerIndex = value;
//     final question = questions[questionIndex];
//     if (selectedAnswerIndex == question.correctAnswerIndex) {
//       score++;
//     }
//     setState(() {});
//   }

//   void goToNextQuestion() {
//     if (questionIndex < questions.length - 1) {
//       questionIndex++;
//       selectedAnswerIndex = null;
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     final question = questions[questionIndex];
//     bool isLastQuestion = questionIndex == questions.length - 1;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               question.question,
//               style: const TextStyle(
//                 fontSize: 21,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: question.options.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: selectedAnswerIndex == null
//                       ? () => pickAnswer(index)
//                       : null,
//                   child: AnswerCard(
//                     currentIndex: index,
//                     question: question.options[index],
//                     isSelected: selectedAnswerIndex == index,
//                     selectedAnswerIndex: selectedAnswerIndex,
//                     correctAnswerIndex: question.correctAnswerIndex,
//                   ),
//                 );
//               },
//             ),
//             // Next Button
//             isLastQuestion
//                 ? RectangularButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (_) => ResultScreen(
//                             score: score,
//                           ),
//                         ),
//                       );
//                     },
//                     label: 'Finish',
//                   )
//                 : RectangularButton(
//                     onPressed:
//                         selectedAnswerIndex != null ? goToNextQuestion : null,
//                     label: 'Next',
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }



// chatgpt revised the copied code to fit


// import 'package:flutter/material.dart';

// import '../components/answer_card.dart';
// import '../components/rectangular_button.dart';
// import '../models/question_model.dart';
// import '../models/quiz_questions.dart';
// import '/screens/result_screen.dart';

// class QuizScreen extends StatefulWidget {
//   const QuizScreen({super.key});

//   @override
//   State<QuizScreen> createState() => _QuizScreenState();
// }

// class _QuizScreenState extends State<QuizScreen> {
//   int? selectedAnswerIndex;
//   int questionIndex = 0;
//   int score = 0;
//   late List<QuizQuestion> questions; // Updated to use QuizQuestion

//   @override
//   void initState() {
//     super.initState();
//     // Fetch questions from the API when the widget is initialized
//     _fetchQuestions();
//   }

//   Future<void> _fetchQuestions() async {
//     try {
//       // Make an API call to get the questions
//       List<QuizQuestion> fetchedQuestions = await ApiCalling().getData();

//       setState(() {
//         questions = fetchedQuestions;
//       });
//     } catch (error) {
//       // Handle error (e.g., show an error message)
//       print('Error fetching questions: $error');
//     }
//   }

//   void pickAnswer(int value) {
//     selectedAnswerIndex = value;
//     final question = questions[questionIndex];
//     if (selectedAnswerIndex == question.correctAnswerIndex) {
//       score++;
//     }
//     setState(() {});
//   }

//   void goToNextQuestion() {
//     if (questionIndex < questions.length - 1) {
//       questionIndex++;
//       selectedAnswerIndex = null;
//     }
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     if (questions.isEmpty) {
//       // Handle the case where questions are still being fetched
//       return Scaffold(
//         appBar: AppBar(
//           title: const Text('Quiz App'),
//         ),
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

//     final question = questions[questionIndex];
//     bool isLastQuestion = questionIndex == questions.length - 1;

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Quiz App'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(24.0),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//           children: [
//             Text(
//               question.text!, // Accessing the text property from QuizQuestion
//               style: const TextStyle(
//                 fontSize: 21,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             ListView.builder(
//               shrinkWrap: true,
//               itemCount: question.options!.length,
//               itemBuilder: (context, index) {
//                 return GestureDetector(
//                   onTap: selectedAnswerIndex == null
//                       ? () => pickAnswer(index)
//                       : null,
//                   child: AnswerCard(
//                     currentIndex: index,
//                     question: question.options![index],
//                     isSelected: selectedAnswerIndex == index,
//                     selectedAnswerIndex: selectedAnswerIndex,
//                     correctAnswerIndex: question.correctAnswer!,
//                   ),
//                 );
//               },
//             ),
//             // Next Button
//             isLastQuestion
//                 ? RectangularButton(
//                     onPressed: () {
//                       Navigator.of(context).pushReplacement(
//                         MaterialPageRoute(
//                           builder: (_) => ResultScreen(
//                             // score: score,
//                           ),
//                         ),
//                       );
//                     },
//                     label: 'Finish',
//                   )
//                 : RectangularButton(
//                     onPressed:
//                         selectedAnswerIndex != null ? goToNextQuestion : null,
//                     label: 'Next',
//                   ),
//           ],
//         ),
//       ),
//     );
//   }
// }


// null error ako vaera yeslai milauna lako

import 'package:flutter/material.dart';

import '../components/answer_card.dart';
import '../components/rectangular_button.dart';
import '../models/question_model.dart';
import '../models/quiz_questions.dart';
import '/screens/result_screen.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({super.key});

  @override
  State<QuizScreen> createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? selectedAnswerIndex;
  int questionIndex = 0;
  int score = 0;
  late List<QuizQuestion> questions;

  @override
  void initState() {
    super.initState();
    // Fetch questions from the API when the widget is initialized
    _fetchQuestions();
  }

  Future<void> _fetchQuestions() async {
    try {
      // Make an API call to get the questions
      List<QuizQuestion> fetchedQuestions = await ApiCalling().getData();

      setState(() {
        questions = fetchedQuestions;
      });
    } catch (error) {
      // Handle error (e.g., show an error message)
      print('Error fetching questions: $error');
    }
  }

  void pickAnswer(int value) {
    selectedAnswerIndex = value;
    final question = questions[questionIndex];
    if (selectedAnswerIndex == question.correctAnswerIndex) {
      score++;
    }
    setState(() {});
  }

  void goToNextQuestion() {
    if (questionIndex < questions.length - 1) {
      questionIndex++;
      selectedAnswerIndex = null;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (questions == null || questions.isEmpty) {
      // Handle the case where questions are still being fetched
      return Scaffold(
        appBar: AppBar(
          title: const Text('Quiz App'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final question = questions[questionIndex];
    bool isLastQuestion = questionIndex == questions.length - 1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              question.text ?? '', // Accessing the text property from QuizQuestion with null check
              style: const TextStyle(
                fontSize: 21,
              ),
              textAlign: TextAlign.center,
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: question.options?.length ?? 0, // Null check for options
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: selectedAnswerIndex == null
                      ? () => pickAnswer(index)
                      : null,
                  child: AnswerCard(
                    currentIndex: index,
                    question: question.options?[index] ?? '', // Null check for options and index
                    isSelected: selectedAnswerIndex == index,
                    selectedAnswerIndex: selectedAnswerIndex,
                    correctAnswerIndex: question.correctAnswer ?? 0, // Null check for correctAnswer
                  ),
                );
              },
            ),
            // Next Button
            isLastQuestion
                ? RectangularButton(
                    onPressed: () {
                      Navigator.of(context).pushReplacement(
                        MaterialPageRoute(
                          builder: (_) => ResultScreen(
                            // score: score,
                          ),
                        ),
                      );
                    },
                    label: 'Finish',
                  )
                : RectangularButton(
                    onPressed:
                        selectedAnswerIndex != null ? goToNextQuestion : null,
                    label: 'Next',
                  ),
          ],
        ),
      ),
    );
  }
}
