// ignore_for_file: avoid_unnecessary_containers

import 'package:calculator_app/buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Calculatorapp());
}

class Calculatorapp extends StatelessWidget {
  //constructor
  const Calculatorapp({Key? key}) : super(key: key);

//build function
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //calling homepage state
      home: HomePage(),
    );
  }
}

//definition of homePageState function
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  final List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '=',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: GridView.builder(
                  itemCount: buttons.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (BuildContext context, int index) {
                    return MyButton(
                      buttontext: buttons[index],
                      color: isOperator(buttons[index])
                          ? Colors.green
                          : Colors.deepPurple[50],
                      textColor: isOperator(buttons[index])
                          ? Colors.green
                          : Colors.deepPurple,
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    List<String> operators = ['%', '/', '*', '+', '-', '='];
    return operators.contains(x);
  }
}
