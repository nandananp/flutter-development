// ignore: file_names
import 'package:flutter/material.dart';

class SendMoneyScreen extends StatelessWidget {
  const SendMoneyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Send Money'),
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
  const ReceiveMoneyScreen({super.key});

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
  const TransactionHistoryScreen({super.key});

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

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: const Center(
        child: Text(
          'Settings Screen',
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.orange,
          ),
        ),
      ),
    );
  }
}
