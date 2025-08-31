import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:to_do_list_flutter/data/constants.dart';
import 'package:to_do_list_flutter/data/models/user.dart';
import 'package:to_do_list_flutter/data/services/api_service.dart';
import '../widget_tree.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPw = TextEditingController();

  String errorMessage = "";

  @override
  Widget build(BuildContext context) {
    double widthScreen = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: LayoutBuilder(
              builder: (context, BoxConstraints constraints) {
                return FractionallySizedBox(
                  widthFactor: widthScreen > 500 ? 0.5 : 1.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Lottie.asset(
                        'assets/lotties/welcome.json',
                        height: 200.0,
                      ),
                      SizedBox(height: 20.0),
                      TextField(
                        controller: controllerEmail,
                        decoration: InputDecoration(
                          labelText: 'Email',
                          errorText: errorMessage,
                        ),
                      ),
                      SizedBox(height: 10.0),
                      TextField(
                        controller: controllerPw,
                        decoration: InputDecoration(labelText: 'Password'),
                        obscureText: true,
                      ),
                      SizedBox(height: 20.0),
                      FilledButton(
                        onPressed: () {
                          onLoginPressed();
                        },
                        style: FilledButton.styleFrom(
                          minimumSize: Size(double.infinity, 40.0),
                        ),
                        child: Text('Login'),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }

  void onLoginPressed() async {
    setState(() {
      errorMessage = "";
    });

    if (!isValidEmail(controllerEmail.text)) {
      setState(() {
        errorMessage = "Invalid email format";
      });
      return;
    }
    
    try {
      final result = await ApiService.callWebApi(
        endpoint: 'login',
        method: 'POST',
        body: {'email': controllerEmail.text, 'password': controllerPw.text},
      );

      final user = User.fromJson(result);

      final prefs = await SharedPreferences.getInstance();
      await prefs.setInt(LoginConst.userId, user.id);
      await prefs.setString(LoginConst.userName, user.userName);
      await prefs.setString(LoginConst.email, controllerEmail.text);

      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
          builder: (context) {
            return WidgetTree();
          },
        ),
        (route) => false,
      );
      controllerEmail.clear();
      controllerPw.clear();
    } catch (e) {
      setState(() {
        errorMessage = "Invalid email or password";
      });
    }
  }
}

bool isValidEmail(String email) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return emailRegex.hasMatch(email);
}
