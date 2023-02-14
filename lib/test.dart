import 'package:flutter/material.dart';

class Test extends StatefulWidget {
  const Test({super.key});

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(
                  label: Text('e-mail'),
                  hintText: 'nome@email.com',
                ),
              ),
              TextFormField(
                decoration: InputDecoration(
                  fillColor: Colors.black,
                  label: Text('senha'),
                  hintText: 'Digite sua senha',
                ),
              ),
              SizedBox(
                height: 12,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text('ENTRAR'),
              )
            ],
          )),
    ));
  }
}
