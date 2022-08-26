import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json_serialization/model/complex_user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  void getUser(BuildContext context) async {
    final file = await rootBundle.loadString('json/complex_response.json');

    final json = jsonDecode(file);

    final ComplexUser user = ComplexUser.fromJson(json["user"]);

    print(user.toJson());
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('JSON Serialization'),
        ),
        body: SafeArea(
          child: Container(
              child: Column(
            children: [
              ElevatedButton(
                  onPressed: () => getUser(context), child: Text('Press'))
            ],
          )),
        ),
      ),
    );
  }
}
