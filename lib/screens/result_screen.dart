
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
