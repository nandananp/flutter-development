import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class FetchData extends StatelessWidget {
  const FetchData({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            TextButton(
              onPressed: () {
                fetchData();
              },
              child: const Center(
                child: Text(
                  'Fetch Data from API',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

// just a function to call to the specified API
  void fetchData() async {
    //create an object of Dio class.
    var dioObject = Dio();

    var response =
        await dioObject.get('https://jsonplaceholder.typicode.com/posts/1');

    print('API call initiated ------------------->');
    print('API response status code  ${response.statusCode}');
    print('API response  : ${response.data.toString()}');
  }
}
