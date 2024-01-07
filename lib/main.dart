import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/screens/result_screen.dart';

import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: ''),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String userName = '';

  @override
  Widget build(BuildContext context) {
    final isKeyboard = MediaQuery.of(context).viewInsets.bottom != 0;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (!isKeyboard)
              CircleAvatar(
                radius: 100,
                backgroundColor: Colors.blue,
                child: Text(
                  'Quiz',
                  style: TextStyle(
                    fontSize: 70,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            SizedBox(height: 20),
            Text(
              'Enter your name',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(height: 10),
            TextFormField(
              onChanged: (value) {
                setState(() {
                  userName = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Your Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (userName.trim().length >= 3 &&
                    RegExp(r'^[a-zA-Z]+$').hasMatch(userName.trim())) {
                  // Valid username
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => QuizScreen()),
                  );
                  print('Start button pressed');
                } else {
                  // Invalid username
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                          'Invalid username. Please enter at least 3 alphabetical characters.'),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              child: Text('Start Quiz'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: userName.isNotEmpty
                  ? () {
                      if (userName.trim().length >= 3 &&
                          RegExp(r'^[a-zA-Z]+$').hasMatch(userName.trim())) {
                        // Valid username
                        setUserName(userName);
                        print('Username set: $userName');
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ResultScreen()),
                        );
                        print('Show Result button pressed');
                      } else {
                        // Invalid username
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Invalid username. Please enter at least 3 alphabetical characters.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    }
                  : null,
              child: Text('Show Result'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> setUserName(userNameValue) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setString('usersname', userNameValue);
  }
}
