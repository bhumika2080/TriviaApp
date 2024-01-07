import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/main.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key});

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  String? userNameDisplay;

  @override
  void initState() {
    super.initState();
    getUserName();
  }

  @override
  Widget build(BuildContext context) {
    getUserName();
    return Scaffold(
      body: Center(
        child: userNameDisplay == null
        ? Text('Take the quiz first')
        : Text(userNameDisplay!),
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
}



// import 'package:flutter/material.dart';

// class ResultScreen extends StatelessWidget {
//   final int score;

//   const ResultScreen({Key? key, required this.score}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Result Screen'),
//       ),
//       body: Center(
//         child: Text(
//           'Your Score: $score',
//           style: const TextStyle(fontSize: 24),
//         ),
//       ),
//     );
//   }
// }
