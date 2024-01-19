import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gym_app/shared/models/user_model.dart';
import 'package:gym_app/shared/models/constants/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameInputController = TextEditingController();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  final TextEditingController _confirmInputController = TextEditingController();

  bool showPassword = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        padding: EdgeInsets.only(
          left: size.height * .05,
          right: size.height * .05,
          top: size.height * .01,
        ),
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
              Color.fromARGB(255, 27, 98, 235),
              Color.fromARGB(255, 132, 178, 238)
            ])),
        child: LayoutBuilder(builder: (_, constraints) {
          double screenwidhtsize = constraints.maxWidth.toDouble();
          return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const AutoSizeText(
                  "Cadastro",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .08,
                        child: TextFormField(
                          controller: _nameInputController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            labelText: 'Nome Completo',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .08,
                        child: TextFormField(
                          controller: _mailInputController,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.email_outlined,
                              color: Colors.white,
                            ),
                            labelText: 'E-mail',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório!';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(
                        width: constraints.maxWidth,
                        height: constraints.maxHeight * .08,
                        child: TextFormField(
                          controller: _passwordInputController,
                          obscureText: (showPassword == true) ? false : true,
                          style: const TextStyle(color: Colors.white),
                          cursorColor: Colors.white,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.key,
                              color: Colors.white,
                            ),
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: Colors.white),
                            enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white)),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Campo obrigatório!';
                            }
                            return null;
                          },
                        ),
                      ),
                      (showPassword == false)
                          ? SizedBox(
                              width: constraints.maxWidth,
                              height: constraints.maxHeight * .08,
                              child: TextFormField(
                                controller: _confirmInputController,
                                obscureText: true,
                                style: const TextStyle(color: Colors.white),
                                cursorColor: Colors.white,
                                decoration: const InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.key,
                                    color: Colors.white,
                                  ),
                                  labelText: 'Confirme sua senha',
                                  labelStyle: TextStyle(color: Colors.white),
                                  enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                  focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.white)),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Campo obrigatório!';
                                  }
                                  return null;
                                },
                              ),
                            )
                          : Container(),
                      Row(
                        children: [
                          Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(2.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) => const BorderSide(
                                    width: 1.5, color: Colors.white),
                              ),
                              checkColor:
                                  const Color.fromARGB(255, 58, 119, 231),
                              activeColor: Colors.white,
                              value: showPassword,
                              onChanged: (bool? newValue) {
                                setState(() {
                                  showPassword = newValue!;
                                });
                              }),
                          const Text(
                            "Mostrar senha",
                            style: TextStyle(color: Colors.white),
                          ),
                          Padding(
                              padding: EdgeInsets.symmetric(
                                  vertical: screenwidhtsize * .12)),
                        ],
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          fixedSize: Size(300, (screenwidhtsize * .17)),
                          foregroundColor: Colors.white,
                          backgroundColor:
                              const Color.fromARGB(255, 24, 126, 209),
                        ),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _doSignUp();
                          }
                        },
                        child: const AutoSizeText(
                          'Cadastrar',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: screenwidhtsize * .15),
                      ),
                      Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: const Color.fromARGB(255, 250, 250, 250),
                              width: 2.0,
                            ),
                          ),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.keyboard_return_sharp,
                              color: Colors.white,
                              size: constraints.maxHeight * .05,
                            ),
                          )),
                    ],
                  ),
                ),
              ]);
        }),
      ),
    );
  }

  void _doSignUp() {
    LoginModel newUser = LoginModel(
      name: _nameInputController.text,
      mail: _mailInputController.text,
      password: _passwordInputController.text,
      keepOn: true,
    );
    _saveUser(newUser);
  }

  void _saveUser(LoginModel user) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(PreferencesKeys.activeUser, jsonEncode(user.toJson()));
  }
}
