import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'login_page.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset('assets/lotties/welcome.json', height: 400.0),
                FittedBox(
                  child: Text(
                    "ZASKER",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45.0,
                      letterSpacing: 35.0,
                    ),
                  ),
                ),
                SizedBox(height: 15),
                Text(
                  'To Do List',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 15.0,
                  ),
                ),
                SizedBox(height: 30),
                FilledButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginPage();
                        },
                      ),
                    );
                  },
                  style: FilledButton.styleFrom(
                    minimumSize: Size(double.infinity, 40.0),
                  ),
                  child: Text('Get started'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
