import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
        actions: <Widget>[
          IconButton(
            onPressed: () {},
            icon: SizedBox(
              width: 24, // Adjust the width as needed
              height: 24, // Adjust the height as needed
              child: Lottie.network(
                'https://lottie.host/f94925bd-8cfd-4aeb-a57b-d4592e99699e/WTrN9A5nlu.json',
                repeat: false,
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: Text(
          'Send Money Screen',
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            backgroundColor: Colors.cyan,
          ),
        ),
      ),
    );
  }
}

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Money'),
      ),
      body: const Center(
        child: Text(
          'Receive Money Screen',
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.yellow,
          ),
        ),
      ),
    );
  }
}

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: const Center(
        child: Text(
          'Transaction History Screen',
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.red,
          ),
        ),
      ),
    );
  }
}
