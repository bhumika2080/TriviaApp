import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trivia_app/screens/result_screen.dart';

import 'screens/quiz_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
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

  void _incrementCounter() {
    setState(() {});
  }

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
                radius: 50,
                backgroundColor: Colors.blue,
                child: Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
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
              onPressed: userName.isNotEmpty
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const QuizScreen()),
                      );
                      print('Start button pressed');
                    }
                  : null,
              child: Text('Start'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: userName.isNotEmpty
                  ? () {
                      setUserName(userName);
                      print('Username set: $userName');
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ResultScreen()),
                      );
                      // Add logic for the "Show Result" button
                      print('Show Result button pressed');
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

