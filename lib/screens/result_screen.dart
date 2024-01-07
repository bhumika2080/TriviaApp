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

// user ko result pani dekhauna ko lagi

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/main.dart';

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            userNameDisplay == null
                ? Text('Take the quiz first')
                : Text(userNameDisplay!),
            resultDisplay.isEmpty
                ? Text('There was an error when showing your results')
                : Text(resultDisplay),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: clearData,
              child: Text('Clear Data'),
            ),
          ],
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
    resultDisplay = selectedOptions?.join(', ') ?? '';
    setState(() {
      resultDisplay = selectedOptions?.join(', ') ?? '';
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
