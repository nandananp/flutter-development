import 'package:flutter/material.dart';
import 'package:profile_screen/SendMoneyScreen.dart';

void main() {
  runApp(const GPayUI());
}

class GPayUI extends StatelessWidget {
  const GPayUI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        title: const Text(
          'Google Pay',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/images/gpaybackground.png',
              ),
              alignment: Alignment.bottomCenter),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GpayButton(
              text: 'Send Money',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const SendMoneyScreen()),
                );
              },
              image: 'assets/images/sendmoney.jpg',
            ),
            GpayButton(
                text: 'Receive Money',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const ReceiveMoneyScreen()),
                  );
                },
                image: 'assets/images/receivemoney.jpg'),
            GpayButton(
                text: 'Transaction History',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const TransactionHistoryScreen()),
                  );
                },
                image: 'assets/images/transaction.png'),
            GpayButton(
                text: 'Settings',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                },
                image: 'assets/images/settings.jpg'),
          ],
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
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Image.asset(image, width: 100, height: 200),
          const SizedBox(
            width: 2.0,
            height: 2.0,
          ), // Add spacing between image and text
          Text(text),
        ],
      ),
    );
  }
}
