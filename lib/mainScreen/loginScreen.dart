// ignore_for_file: file_names
//import 'dart:html';

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            // const CircleAvatar(
            //   radius: 50,
            // ),
            Image.asset(
              'assets/02-Jervix.jpg',
              height: 200,
              colorBlendMode: BlendMode.colorBurn,
            ),
            const SizedBox(
              height: 40,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Username',
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.all(15.0),
              child: TextField(
                  decoration: InputDecoration(
                      icon: Icon(
                        Icons.key,
                        color: Colors.white,
                      ),
                      label: Text(
                        'Password',
                        style: TextStyle(color: Colors.white),
                      ))),
            ),
            MaterialButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/Homepage');
                },
                child: const Text('Login'))
          ],
        ),
      ),
    );
  }
}
