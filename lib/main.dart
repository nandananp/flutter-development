import 'package:flutter/material.dart';

void main() {
  runApp(const GPayUI());
}

class GPayUI extends StatelessWidget {
  const GPayUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GPay UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const GPayHomePage(),
    );
  }
}

class GPayHomePage extends StatelessWidget {
  const GPayHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Google Pay'),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GpayButton(
              text: 'Send Money',
              onPressed: () {
                print('Sending money...');
              },
              image: 'assets/images/sendmoney.jpg',
            ),
            GpayButton(
                text: 'Receive Money',
                onPressed: () {
                  print('Receiving money...');
                },
                image: 'assets/images/receivemoney.jpg'),
            GpayButton(
                text: 'Transaction History',
                onPressed: () {
                  print('Viewing transaction history...');
                },
                image: 'assets/images/transaction.png'),
            GpayButton(
                text: 'Settings',
                onPressed: () {
                  print('Accessing settings...');
                },
                image: 'assets/images/settings.jpg'),
          ] ,
        ),
      ),
    
    );
  }
}

class GpayButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final String image;

  const GpayButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      required this.image});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image, width: 100, height: 200),
          const SizedBox(width: 2.0), // Add spacing between image and text
          Text(text),
        ],
      ),
    );
  }
}
