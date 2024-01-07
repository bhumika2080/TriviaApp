// // with just the incorrect answers

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'question_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Trivia Quiz App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: QuizScreen(),
//     );
//   }
// }

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
//       });
//     } catch (e) {
//       print("Error loading data: $e");
//     }
//   }

//   void checkAnswer(String selectedAnswer) {
//     if (answered) return;

//     setState(() {
//       answered = true;
//     });

//     Trivia currentQuestion = triviaList[currentQuestionIndex];
//     String correctAnswer = currentQuestion.correctAnswer!;

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
//     if (triviaList == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Trivia Quiz App'),
//         ),
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

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
//                           primary: answered
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
//                 // Move to the next question
//                 setState(() {
//                   currentQuestionIndex++;
//                   answered = false;
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



// // with the correct answer too hopefully, but only three options still and has error when showing the color for correct answer

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'question_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Trivia Quiz App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: QuizScreen(),
//     );
//   }
// }

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

//   void shuffleOptions() {
//     for (var question in triviaList) {
//       var options = List<String>.from(question.incorrectAnswers!);
//       options.add(question.correctAnswer!);
//       options.shuffle();
//       question.incorrectAnswers = options.sublist(0, options.length - 1);
//     }
//   }

//   void checkAnswer(String selectedAnswer) {
//     if (answered) return;

//     setState(() {
//       answered = true;
//     });

//     Trivia currentQuestion = triviaList[currentQuestionIndex];
//     String correctAnswer = currentQuestion.correctAnswer!;

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


// // hopefully final : the number of correct options increased each time so no

// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// import 'question_model.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Trivia Quiz App',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: QuizScreen(),
//     );
//   }
// }

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

//   void shuffleOptions() {
//     for (var question in triviaList) {
//       var options = List<String>.from(question.incorrectAnswers!);
//       options.add(question.correctAnswer!);
//       options.shuffle();
//       question.incorrectAnswers = options;
//     }
//   }

//   void checkAnswer(String selectedAnswer) {
//     if (answered) return;

//     setState(() {
//       answered = true;
//     });

//     Trivia currentQuestion = triviaList[currentQuestionIndex];
//     String correctAnswer = currentQuestion.correctAnswer!;

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
//     if (triviaList == null) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Trivia Quiz App'),
//         ),
//         body: Center(
//           child: CircularProgressIndicator(),
//         ),
//       );
//     }

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
//                           primary: answered
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



// final one?

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// class Trivia {
//   String? category;
//   String? id;
//   String? correctAnswer;
//   List<String>? incorrectAnswers;
//   Question? question;
//   List<String>? tags;
//   String? type;
//   String? difficulty;

//   Trivia({
//     this.category,
//     this.id,
//     this.correctAnswer,
//     this.incorrectAnswers,
//     this.question,
//     this.tags,
//     this.type,
//     this.difficulty,
//   });

//   Trivia.fromJson(Map<String, dynamic> json) {
//     category = json['category'];
//     id = json['id'];
//     correctAnswer = json['correctAnswer'];
//     incorrectAnswers = json['incorrectAnswers'].cast<String>();
//     question =
//         json['question'] != null ? Question.fromJson(json['question']) : null;
//     tags = json['tags'].cast<String>();
//     type = json['type'];
//     difficulty = json['difficulty'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['category'] = category;
//     data['id'] = id;
//     data['correctAnswer'] = correctAnswer;
//     data['incorrectAnswers'] = incorrectAnswers;
//     if (question != null) {
//       data['question'] = question!.toJson();
//     }
//     data['tags'] = tags;
//     data['type'] = type;
//     data['difficulty'] = difficulty;
//     return data;
//   }
// }

// class Question {
//   String? text;

//   Question({this.text});

//   Question.fromJson(Map<String, dynamic> json) {
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['text'] = text;
//     return data;
//   }
// }

// class ApiCalling {
//   String url = "https://the-trivia-api.com/v2/questions";

//   Future<List<Trivia>> getData() async {
//     List<Trivia> list = [];
//     http.Response response = await http.get(Uri.parse(url));
//     if (response.statusCode == 200 ||
//         response.statusCode == 201 ||
//         response.statusCode == 202) {
//       var body = response.body;
//       var jsonBody = jsonDecode(body);
//       jsonBody.forEach((element) {
//         list.add(Trivia.fromJson(element));
//       });
//       return list;
//     }
//     return list;
//   }
// }


class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  late List<Trivia> triviaList;
  int currentQuestionIndex = 0;
  bool answered = false;

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
      });
    } catch (e) {
      print("Error loading data: $e");
    }
  }

  // void shuffleOptions() {
  //   for (var question in triviaList) {
  //     var options = List<String>.from(question.incorrectAnswers!);
  //     options.add(question.correctAnswer!);
  //     options.shuffle();
  //     question.incorrectAnswers = options.sublist(0, 1); // Keep only one correct answer
  //   }
  // }
void shuffleOptions() {
  var currentQuestion = triviaList[currentQuestionIndex];
  var options = List<String>.from(currentQuestion.incorrectAnswers!);
  options.add(currentQuestion.correctAnswer!);
  options.shuffle();
  
  // Update the shuffled options to the current question
  currentQuestion.incorrectAnswers = options;
}
  void checkAnswer(String selectedAnswer) {
    if (answered) return;

    setState(() {
      answered = true;
    });

    Trivia currentQuestion = triviaList[currentQuestionIndex];
    String correctAnswer = currentQuestion.correctAnswer!;

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
    if (triviaList == null) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Trivia Quiz App'),
        ),
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    if (currentQuestionIndex >= triviaList.length) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Trivia Quiz App'),
        ),
        body: Center(
          child: Text('End of Quiz'),
        ),
      );
    }

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
                          primary: answered
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
              onPressed: () {
                // Move to the next question and shuffle options
                setState(() {
                  currentQuestionIndex++;
                  answered = false;
                  shuffleOptions();
                });
              },
              child: Text('Next Question'),
            ),
          ],
        ),
      ),
    );
  }
}
