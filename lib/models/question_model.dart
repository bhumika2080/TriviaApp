import 'dart:convert';

import 'package:http/http.dart' as http;

import 'quiz_questions.dart';

class Trivia {
  String? category;
  String? id;
  String? correctAnswer;
  List<String>? incorrectAnswers;
  Question? question;
  List<String>? tags;
  String? type;
  String? difficulty;

  Trivia({
    this.category,
    this.id,
    this.correctAnswer,
    this.incorrectAnswers,
    this.question,
    this.tags,
    this.type,
    this.difficulty,
  });

  Trivia.fromJson(Map<String, dynamic> json) {
    category = json['category'];
    id = json['id'];
    correctAnswer = json['correctAnswer'];
    incorrectAnswers = json['incorrectAnswers'].cast<String>();
    question =
        json['question'] != null ? Question.fromJson(json['question']) : null;
    tags = json['tags'].cast<String>();
    type = json['type'];
    difficulty = json['difficulty'];
  }



  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['category'] = category;
    data['id'] = id;
    data['correctAnswer'] = correctAnswer;
    data['incorrectAnswers'] = incorrectAnswers;
    if (question != null) {
      data['question'] = question!.toJson();
    }
    data['tags'] = tags;
    data['type'] = type;
    data['difficulty'] = difficulty;
    return data;
  }
}

class Question {
  String? text;

  Question({this.text});

  Question.fromJson(Map<String, dynamic> json) {
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['text'] = text;
    return data;
  }
}

//return evrything in the api: all the data

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


//chatgpt modified it idk what's different
class ApiCalling {
  String url = "https://the-trivia-api.com/v2/questions";

  Future<List<QuizQuestion>> getData() async {
    List<QuizQuestion> list = [];
    http.Response response = await http.get(Uri.parse(url));
    if (response.statusCode == 200 ||
        response.statusCode == 201 ||
        response.statusCode == 202) {
      var body = response.body;
      var jsonBody = jsonDecode(body);
      jsonBody.forEach((element) {
        list.add(QuizQuestion.fromTrivia(Trivia.fromJson(element)));
      });
      return list;
    }
    return list;
  }
}
