import 'package:firebase_auth/firebase_auth.dart';

abstract class ManageState {
  const ManageState();
}

class LoadingState extends ManageState {}

class LoginState extends ManageState {
  final User user;
  // final String password;
  LoginState({
    required this.user,
  });
}

class RegisterState extends ManageState {
  // final String username;
  // final String password;
  final User user; 
  const RegisterState({
    required this.user,
  });
}

class LogOutState extends ManageState {
  // final String username;
  // final String password;
  LogOutState();
}

class UploadState extends ManageState {}

class AddState extends ManageState {}
