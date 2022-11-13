
import 'package:eat_test/page.dart';
import 'package:eat_test/three_page/detail_dalty.dart';
import 'package:eat_test/three_page/detail_sweet.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const homepage(),
    );
  }
}
