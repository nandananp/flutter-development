import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
      ),
      drawer: Drawer(
        child: Container(
          color: Colors.deepOrange[200],
          child: ListView(
            children: const [
              DrawerHeader(
                child: Center(
                  child: Text('L O G O'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
