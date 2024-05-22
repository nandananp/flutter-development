import 'package:flutter/material.dart';
import 'package:profile_screen/CustomSearchDelegate.dart';
import 'package:profile_screen/SendMoneyScreen.dart';
import 'package:profile_screen/Person.dart';
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
    final screenSize = MediaQuery.of(context).size;

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
      body: Container(
        width: screenSize.width,
        height: screenSize.height,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/gpaybackground.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                padding: const EdgeInsets.all(10),
                children: [
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
                  GpayButton(
                    text: 'People',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PeopleScreen()),
                      );
                    },
                    image: 'assets/images/people.jpg',
                  ),
                  GpayButton(
                    text: 'Business',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const BusinessScreen()),
                      );
                    },
                    image: 'assets/images/business.jpg',
                  ),
                  GpayButton(
                    text: 'Offers',
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const OffersScreen()),
                      );
                    },
                    image: 'assets/images/offer.jpg',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OffersScreen extends StatelessWidget {
  const OffersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Offers'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Offers',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // Add your offers UI here
            Text(
              'No offers available at the moment.',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}

class BusinessScreen extends StatelessWidget {
  const BusinessScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Business'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Welcome to the Business Section',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add your business-related functionality here
              },
              child: const Text('Add a Business'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your business-related functionality here
              },
              child: const Text('View Business Accounts'),
            ),
            ElevatedButton(
              onPressed: () {
                // Add your business-related functionality here
              },
              child: const Text('Business Analytics'),
            ),
            // Add more buttons or widgets for other business-related functionalities
          ],
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
    Person(name: 'Arya', imageUrl: 'assets/images/arya.jpg'),
    Person(name: 'Rahul', imageUrl: 'assets/images/rahul.jpg'),
    // Add more people as needed
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: people.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(people[index].imageUrl),
              ),
              title: Text(people[index].name),
              onTap: () {
                // Add functionality when a person is tapped
                // For example, navigate to a detail page for that person
              },
            );
          },
        ),
      ),
    );
  }
}

class QRCodeScannerScreen extends StatefulWidget {
  const QRCodeScannerScreen({super.key});

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
              style: Theme.of(context).textTheme.headlineMedium,
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
    super.key,
    required this.text,
    required this.onPressed,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final buttonHeight = screenSize.height * 0.1; // Reduced button height
    final buttonWidth = screenSize.width * 0.4;

    return SizedBox(
      height: buttonHeight,
      width: buttonWidth,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 20, // Adjust the radius to reduce the size
              backgroundColor: Colors.white, // or any color you prefer
              child: Image.asset(image,
                  width: 30, height: 30), // Adjust the image size
            ),
            const SizedBox(height: 5.0), // Adjust spacing as needed
            Text(text),
          ],
        ),
      ),
    );
  }
}
