import 'dart:convert';

import 'package:ch10_fastcampus_freezed/basic_model.dart';
import 'package:ch10_fastcampus_freezed/freezed_user_model.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

import 'json_serial_basic_model.dart';

String jsonUrl = "https://jsonplaceholder.typicode.com/users";

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            final response = await http.get(Uri.parse(jsonUrl));
            if (response.statusCode == 200) {
              // print(response.body);
              List<dynamic> jsonResp = jsonDecode(response.body);
              // print(jsonResp);
              for (var element in jsonResp) {
                final jsonData = element as Map<String, dynamic>;

                final user = FreezedUserModel.fromJson(jsonData);
                print(user.toString());
              }
            }
          },
        ),
      ),
    );
  }
}
