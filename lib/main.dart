import 'package:application_test/TEST2.dart';
import 'package:application_test/home.dart';
import 'package:application_test/login.dart';
import 'package:application_test/test.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return (const MaterialApp(
      title: 'Gym App',
      home: Test2(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
