import 'dart:convert';
import 'package:flutter/material.dart';

import 'package:sgi_application/src/services/api/api.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/login_response/login_response.dart';
import '../os/os_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _rememberMe = false;
  final _formkey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final kLabelStyle =
      const TextStyle(color: Colors.white, fontFamily: 'OpenSans');

  Future<void> login(BuildContext context) async {
    FocusScope.of(context).unfocus();
    final api = Api();
    var response = await api.request('Auth/login', RequestType.post, {
      "login": _emailController.text,
      "senha": _passwordController.text,
      "versao": "88",
      "plataforma": "ANDROID"
    });

    if (response?.statusCode == 200) {
      var loginResponse =
          LoginResponse.fromJson(json.decode(response?.body ?? ''));
      SharedPreferences sharedPreferences =
          await SharedPreferences.getInstance();
      sharedPreferences.setString('token', loginResponse.accessToken);
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => const OsPage()));
    } else {
      _passwordController.clear();
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content:
            Text('Usuário e/ou senha inválidos', textAlign: TextAlign.center),
        backgroundColor: Colors.redAccent,
        duration: Duration(seconds: 2),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black12,
        body: Form(
          key: _formkey,
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    'assets/logo_emive.png',
                    height: 80,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Login',
                        labelStyle: TextStyle(color: Colors.white)),
                    controller: _emailController,
                  ),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    decoration: const InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        enabledBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: Colors.white)),
                        labelText: 'Senha',
                        labelStyle: TextStyle(color: Colors.white)),
                    controller: _passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                  ),
                  const SizedBox(height: 35),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: const Color.fromARGB(255, 235, 196, 0),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                    ),
                    onPressed: () {
                      login(context);
                    },
                    child: const Text('ENTRAR'),
                  ),
                  Container(
                    child: Row(
                      children: <Widget>[
                        Theme(
                          data: ThemeData(unselectedWidgetColor: Colors.white),
                          child: Checkbox(
                            value: _rememberMe,
                            checkColor: const Color.fromARGB(255, 218, 215, 3),
                            activeColor: Colors.white,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                        ),
                        Text('Lembrar login', style: kLabelStyle),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
