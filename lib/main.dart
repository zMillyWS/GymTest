import 'package:application_test/screens/loginofc.dart';
import 'package:application_test/testes/TEST2.dart';
import 'package:application_test/screens/home.dart';
import 'package:application_test/screens/login.dart';
import 'package:application_test/testes/test.dart';
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
      home: LoginScreenTwo(),
      debugShowCheckedModeBanner: false,
    ));
  }
}
