// ignore_for_file: file_names
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/main_bloc.dart';

import '../bloc_state/credn/userbloc_dart_bloc.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _fromKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Registration'),
        ),
        backgroundColor: Colors.grey,
        body: Form(
          key: _fromKey,
          child: SingleChildScrollView(
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
                    child: TextFormField(
                        controller: username,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your password';
                          }
                          return null;
                        },
                        decoration: const InputDecoration(
                            hintText: 'name@mail.com ',
                            icon: Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            label: Text(
                              'email',
                              style: TextStyle(color: Colors.white),
                            ))),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: TextFormField(
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'please enter your password';
                          }
                          return null;
                        },
                        controller: password,
                        decoration: const InputDecoration(
                            hintText: 'password',
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
                        if (_fromKey.currentState!.validate()) {
                          context.read<MainBloc>().add(Create(
                              username: username.text.trim(),
                              password: password.text.trim()));
                        }
                        // Navigator.pushNamed(context, '/Homepage');
                      },
                      child: const Text('Registration'))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
