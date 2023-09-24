import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Counter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int count = 0;

  void _incrementCounter() {
    setState(() {
      count++;
      _checkCount();
    });
  }

  void _decrementCounter() {
    setState(() {
      if (count > 0) {
        count--;
        _checkCount();
      }
    });
  }

  void _checkCount() {
    if (count >= 5) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Button pressed $count times."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("Close"),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Counter App"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Count:',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '$count',
              style: TextStyle(fontSize: 48),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                ElevatedButton(
                  onPressed: _incrementCounter,
                  child: Text('+'),
                ),
                SizedBox(width: 20),
                ElevatedButton(
                  onPressed: _decrementCounter,
                  child: Text('-'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
