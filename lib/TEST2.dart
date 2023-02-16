// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class Teste extends StatefulWidget {
  const Teste({super.key});

  @override
  State<Teste> createState() => _Teste();
}

class _Teste extends State<Teste> {
  @override
  Widget build(BuildContext context) {
    final emailTxt = TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'e-mail'),
        ),
        senhaTxt = TextField(
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(10.0)),
              hintText: 'senha'),
        );

    return Material(
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [
                  Colors.blue,
                  Colors.red,
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 620.0,
              width: 320.0,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 65, 53, 53),
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 5.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    child: Text("Entrar"),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: 200.0,
              width: 340.0,
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(48.0),
                  child: Column(
                    children: <Widget>[
                      emailTxt,
                      senhaTxt,
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 80,
            left: 106,
            width: 180,
            height: 280,
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromARGB(158, 33, 149, 243),
                boxShadow: [
                  BoxShadow(
                    color: Color.fromARGB(255, 65, 53, 53),
                    blurRadius: 15.0, // soften the shadow
                    spreadRadius: 3.0, //extend the shadow
                    offset: Offset(
                      5.0, // Move to right 5  horizontally
                      5.0, // Move to bottom 5 Vertically
                    ),
                  )
                ],
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.person,
                  size: 150, color: Color.fromARGB(255, 43, 40, 40)),
            ),
          ),
        ],
      ),
    );
  }
}
