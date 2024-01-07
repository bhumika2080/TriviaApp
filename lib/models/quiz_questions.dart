// // class QuizQuestion {
// //   String id;
// //   String questionText;
// //   List<String> options;
// //   String? selectedOption;

// //   QuizQuestion({
// //     required this.id,
// //     required this.questionText,
// //     required this.options,
// //     this.selectedOption,
// //   });
// // }


// // quiz questions chatgpt second attempt
// // import 'question_model.dart';

// // class QuizQuestion {
// //   String id;
// //   String questionText;
// //   List<String> options;
// //   String? selectedOption;

// //   QuizQuestion({
// //     required this.id,
// //     required this.questionText,
// //     required this.options,
// //     this.selectedOption,
// //   });

// //   // Create a factory method to convert Trivia to QuizQuestion
// //   factory QuizQuestion.fromTrivia(Trivia trivia) {
// //     return QuizQuestion(
// //       id: trivia.id ?? '',
// //       questionText: trivia.question?.text ?? '',
// //       options: (trivia.incorrectAnswers ?? []) + [trivia.correctAnswer ?? ''],
// //       selectedOption: null, // Initially, no option is selected
// //     );
// //   }
// // }


// // Assuming QuizQuestion class looks something like this:
// import 'question_model.dart';

// class QuizQuestion {
//   String? text;
//   List<String>? options;
//   String? correctAnswerIndex;

//   QuizQuestion({
//     this.text,
//     this.options,
//     this.correctAnswerIndex,
//   });

//   factory QuizQuestion.fromTrivia(Trivia trivia) {
//     return QuizQuestion(
//       text: trivia.question?.text,
//       options: trivia.incorrectAnswers,
//       correctAnswerIndex: trivia.correctAnswer,
//     );
//   }

//   get correctAnswer => null;
// }
