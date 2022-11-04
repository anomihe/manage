// ignore_for_file: file_names
//import 'dart:html';

import 'package:flutter/material.dart';
import 'package:manage/mainScreen/firstExport.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, ManageState>(
      listener: (context, state) {
        if (state is LoginState) {
          Navigator.pushNamed(context, '/Homepage');
        }
        if (state is RegistrationView) {
          Navigator.pushNamed(context, '/register');
        }
      },
      child: Form(
        key: _formKey,
        child: GestureDetector(
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
                      child: TextFormField(
                          controller: username,
                          validator: (value) {
                            if (value == null && value!.isEmpty) {
                              return 'please enter your email';
                            }
                            return null;
                          },
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
                      child: TextFormField(
                          controller: password,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'please enter your password';
                            }
                            return null;
                          },
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
                          if (_formKey.currentState!.validate()) {
                            context.read<MainBloc>().add(LoginEvent(
                                username: username.text.trim(),
                                password: password.text.trim()));
                            //  Navigator.pushNamed(context, '/Homepage');
                          }
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
        ),
      ),
    );
  }
}
