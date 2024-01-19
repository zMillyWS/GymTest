import 'package:flutter/material.dart';
import 'package:gym_app/pages/login/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'GymApp',
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
