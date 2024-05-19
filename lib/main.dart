import 'package:flutter/material.dart';
import 'package:profile_screen/CustomSearchDelegate.dart';
import 'package:profile_screen/Person.dart';
import 'package:profile_screen/SendMoneyScreen.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

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
        actions: <Widget>[
          Center(
            child: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                showSearch(context: context, delegate: CustomSearchDelegate());
              },
            ),
          ),
          IconButton(
            icon: const Icon(Icons.qr_code_scanner),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const QRCodeScannerScreen()),
              );
            },
          ),
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (String result) {
              switch (result) {
                case 'Settings':
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SettingsScreen()),
                  );
                  break;
                case 'Help':
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const HelpScreen()),
                  );
                  break;
                // Add more cases for additional options
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'Settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'Help',
                child: Text('Help'),
              ),
              // Add more PopupMenuItems here for additional options
            ],
          ),
        ],
      ),
      body: SizedBox(
        width: 1800,
        height: 1800,
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/gpaybackground.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                    image: 'assets/images/receivemoney.jpg',
                  ),
                  GpayButton(
                    text: 'Transaction History',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                const TransactionHistoryScreen()),
                      );
                    },
                    image: 'assets/images/transaction.png',
                  ),
                  GpayButton(
                    text: 'Pay Bills',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const PayBillsScreen()),
                      );
                    },
                    image: 'assets/images/pay bill.jpg',
                  ),
                  GpayButton(
                    text: 'Rewards',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const RewardsScreen()),
                      );
                    },
                    image: 'assets/images/rewards.jpg',
                  ),
                  const Spacer(),
                  GpayButton(
                    text: 'People',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PeopleScreen()),
                      );
                      // Add functionality for the "People" button
                    },
                    image: 'assets/images/people.jpg',
                  ),
                  const Spacer(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PeopleScreen extends StatelessWidget {
  PeopleScreen({super.key});
  final List<Person> people = [
    Person(name: 'Alice', imageUrl: 'assets/images/alice.jpg'),
    Person(name: 'Surya', imageUrl: 'assets/images/surya.jpg'),
    Person(name: 'Akhil', imageUrl: 'assets/images/akhil.jpg'),
    // Add more people as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('people'),
        ),
        body: const Center(
            child: Text(
          'PeopleScreen',
          style: TextStyle(fontSize: 24),
        )));
  }
}

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _QRCodeScannerScreenState createState() => _QRCodeScannerScreenState();
}

class _QRCodeScannerScreenState extends State<QRCodeScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  QRViewController? controller;

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Code Scanner'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            flex: 5,
            child: QRView(
              key: qrKey,
              onQRViewCreated: _onQRViewCreated,
            ),
          ),
          Expanded(
            flex: 1,
            child: Center(
              child: (result != null)
                  ? Text(
                      'Barcode Type: ${result!.format}   Data: ${result!.code}')
                  : const Text('Scan a code'),
            ),
          ),
        ],
      ),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
    });
  }
}

class RewardsScreen extends StatelessWidget {
  const RewardsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    // Define the UI of the rewards screen using widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rewards'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your Rewards Information',
                style: TextStyle(fontSize: 20),
              ),
              // Add more widgets to display rewards information
            ],
          ),
        ),
      ),
    );
  }
}

class HelpScreen extends StatelessWidget {
  const HelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help'),
        centerTitle: true,
      ),
      body: const Padding(
        padding: EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'How can we help you?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'If you have any questions or need assistance, please contact our support team at support@example.com.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '1. How to send money?\n'
              'Answer: To send money, go to the Send Money screen and follow the instructions.\n\n'
              '2. How to receive money?\n'
              'Answer: To receive money, go to the Receive Money screen and follow the instructions.\n\n'
              '3. How to view transaction history?\n'
              'Answer: To view transaction history, go to the Transaction History screen.',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            // Add more FAQ items here
          ],
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
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text('Account'),
            onTap: () {
              // Handle account settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.notifications),
            title: const Text('Notifications'),
            onTap: () {
              // Handle notification settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.security),
            title: const Text('Privacy'),
            onTap: () {
              // Handle privacy settings
            },
          ),
          ListTile(
            leading: const Icon(Icons.help),
            title: const Text('Help & Support'),
            onTap: () {
              // Handle help & support
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About'),
            onTap: () {
              // Handle about
            },
          ),
        ],
      ),
    );
  }
}

class PayBillsScreen extends StatelessWidget {
  const PayBillsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pay Bills'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Pay your bills here!',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your bill payment logic here
              },
              child: const Text('Pay Now'),
            ),
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

  const GpayButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(image, width: 60, height: 40),
          const SizedBox(height: 30.0),
          Text(text),
        ],
      ),
    );
  }
}
