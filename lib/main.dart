import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Gradient container example'),
        ),
        body: Center(
          child: SizedBox(
            height: 500,
            width: 200,
            child: Image.asset('assets/images/space.jpg'),
          ),
        ),
      ),
    );
  }
}
