import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: (const Icon(Icons.menu)),
          title: (const Text("Gym App")),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  i -= 1;
                });
              },
              child: (const Icon(Icons.exposure_minus_1)),
            ),
            FloatingActionButton(
              onPressed: () {
                setState(() {
                  i += 1;
                });
              },
              child: (const Icon(Icons.exposure_plus_1)),
            ),
          ],
        ),
        body: Center(
            child: Container(
                child: (Text(i.toString(),
                    style: (const TextStyle(
                      color: Color.fromARGB(255, 0, 0, 0),
                      decoration: TextDecoration.none,
                      fontSize: 70,
                      fontWeight: FontWeight.w500,
                    )))))));
  }
}
