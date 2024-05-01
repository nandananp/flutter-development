import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  final color;
  // ignore: prefer_typing_uninitialized_variables
  final textcolor;
  final String buttontext;
  const MyButton(
      {super.key,
      this.color,
      this.textcolor,
      required this.buttontext,
      required Color textColor});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
            color: color,
            child: Center(
              child: Text(
                buttontext,
                style: TextStyle(color: textcolor),
              ),
            )),
      ),
    );
  }
}
