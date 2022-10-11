// ignore_for_file: file_names
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/credn/userbloc_dart_bloc.dart';
import 'package:manage/bloc_state/main_bloc.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey,
        body: SingleChildScrollView(
          child: Center(
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                      controller: username,
                      decoration: const InputDecoration(
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
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextField(
                      controller: password,
                      decoration: const InputDecoration(
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
                      context.read<MainBloc>().add(LoginEvent(
                          username: username.text.trim(),
                          password: password.text.trim()));
                      // Navigator.pushNamed(context, '/Homepage');
                    },
                    child: const Text('Login')),
                MaterialButton(
                    onPressed: () {
                      context.read<MainBloc>().add(const AppEventGoToReg());
                      // Navigator.pushNamed(context, '/register');
                    },
                    child: const Text('Register'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
