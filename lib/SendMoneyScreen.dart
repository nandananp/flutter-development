import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

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
          'MONEY SEND SUCCESSFULLY',

          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            backgroundColor: Colors.greenAccent,

          ),
        ),
      ),
    );
  }
}

class ReceiveMoneyScreen extends StatelessWidget {
  const ReceiveMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Receive Money'),
      ),
      body: const Center(
        child: Text(
          'RECEIVE MONEY SCREEN',
          style: TextStyle(

    fontSize: 30,
            color: Colors.black,
            backgroundColor: Colors.deepPurpleAccent,
          ),
        ),
      ),
    );
  }
}

class TransactionHistoryScreen extends StatelessWidget {
  const TransactionHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction History'),
      ),
      body: const Center(
        child: Text(
          'TRANSACTION HISTORY SCREEN',
          style: TextStyle(
            fontSize:20,
            color: Colors.black,
            backgroundColor: Colors.purple,
          ),
        ),
      ),
    );
  }
}
