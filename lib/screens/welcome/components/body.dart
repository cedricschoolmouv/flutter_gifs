import 'package:flutter/material.dart';
import 'package:test_project/components/Background.dart';
import 'package:test_project/components/rounded-button.dart';
import 'package:test_project/screens/app/app-screen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/gif.png',
              height: 120,
              width: 120,
            ),
            SizedBox(height: size.height * 0.05),
            Text(
              "WELCOME TO GIF",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            SizedBox(height: size.height * 0.3),
            RoundedButton(
              text: "START",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AppScreen();
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
