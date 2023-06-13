import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyState(),
    );
  }
}

class MyState extends StatefulWidget {
  const MyState({super.key});

  @override
  State<MyState> createState() => _MyStateState();
}

class _MyStateState extends State<MyState> {
  List dataList = [];

  Future<void> fetchData() async {
    var url = Uri.parse('https://jsonplaceholder.typicode.com/albums');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      dataList = jsonDecode(response.body);
    } else {
      print("Request failed status: ${response.statusCode}.");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("API - ROBBY MAULANA"),
        ),
        body: ListView.builder(
          itemCount: dataList.length,
          itemBuilder: ((context, index) {
            return Container(
              child: ListView(
                children: [Text(dataList[index]['title'])],
              ),
            );
          }),
        ));
  }
}
