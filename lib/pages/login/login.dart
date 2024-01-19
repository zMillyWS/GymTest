import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:gym_app/shared/models/user_model.dart';
import 'package:gym_app/pages/sign_up/signup.dart';
import 'package:gym_app/shared/models/constants/preferences_keys.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _mailInputController = TextEditingController();
  final TextEditingController _passwordInputController =
      TextEditingController();
  bool continueConnected = false;

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
              Image.asset(
                "assets/iconloginscreen.png",
                height: constraints.maxHeight * .20,
              ),
              Container(
                padding: const EdgeInsets.only(top: 20),
                height: constraints.maxHeight * .1,
                child: const AutoSizeText(
                  "Entrar",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    SizedBox(
                      width: constraints.maxWidth,
                      height: constraints.maxHeight * .09,
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
                      height: constraints.maxHeight * 0.09,
                      child: TextFormField(
                        controller: _passwordInputController,
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
                  ],
                ),
              ),
              Container(
                alignment: const Alignment(0.9, 0),
                child: GestureDetector(
                  onTap: () {},
                  child: const AutoSizeText(
                    "Esqueci minha senha",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  Checkbox(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                      side: MaterialStateBorderSide.resolveWith(
                        (states) =>
                            const BorderSide(width: 1.5, color: Colors.white),
                      ),
                      checkColor: const Color.fromARGB(255, 58, 119, 231),
                      activeColor: Colors.white,
                      value: continueConnected,
                      onChanged: (bool? newValue) {
                        setState(() {
                          continueConnected = newValue!;
                        });
                      }),
                  const Text(
                    "Continuar conectado?",
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
                  backgroundColor: const Color.fromARGB(255, 24, 126, 209),
                ),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _doLogin();
                  }
                },
                child: const AutoSizeText(
                  'Login',
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Padding(padding: EdgeInsets.only(bottom: screenwidhtsize * .07)),
              const Divider(color: Color.fromARGB(110, 255, 255, 255)),
              Padding(
                padding: EdgeInsets.symmetric(vertical: screenwidhtsize * .05),
                child: const AutoSizeText(
                  "Ainda não tem cadastro?",
                  style: TextStyle(color: Colors.white),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  fixedSize: Size(300, (screenwidhtsize * .17)),
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromARGB(255, 24, 126, 209),
                ),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SignUpPage()));
                },
                child: const AutoSizeText(
                  'Cadastre-se',
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }

  void _doLogin() async {
    String mailForm = _mailInputController.text;
    String passForm = _passwordInputController.text;

    LoginModel savedUser = await _getSavedUser();

    if (mailForm == savedUser.mail && passForm == savedUser.password) {
      print("LOGIN EFETUADO COM SUCESSO");
    } else {
      print("EMAIL OU SENHA INCORRETOS");
    }
  }

  Future<LoginModel> _getSavedUser() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonUser = prefs.getString(PreferencesKeys.activeUser)!;

    Map<String, dynamic> mapUser = json.decode(jsonUser);
    LoginModel user = LoginModel.fromJson(mapUser);
    return user;
  }
}
