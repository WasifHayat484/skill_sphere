import 'package:skill_sphere/Signup_page.dart';
import 'package:skill_sphere/main.dart';
import 'package:flutter/material.dart';

import 'Signup_page2.dart';

class Showcase extends StatelessWidget {
  const Showcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 5.0,
              ),
              Image.asset(
                "images/logo.png",
                fit: BoxFit.cover,
                height: 200,
              ),
              // ignore: prefer_const_constructors
              SizedBox(
                height: 0.0,
              ),
              Text(
                "Sign up as a",
                style: TextStyle(
                  fontSize: 12.5,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 12.0,
              ),
              Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    ElevatedButton(
                      child: Text("User"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                      onPressed: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => RegistrationForm()),
                  );
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Text(
                      "or",
                      style: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      child: Text("Employee"),
                      style: TextButton.styleFrom(minimumSize: Size(150, 50)),
                      onPressed: () {
                        Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SignupPage()),
                  );
                      },
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                      height: 50.0,
                    ),
                  ],
                ),
              )
            ],
          ),
        ));
  }
}