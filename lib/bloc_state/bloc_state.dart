import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:manage/models/firebaseModels/models_fire.dart';

abstract class ManageState extends Equatable {
  const ManageState();
}

// class LoadingState extends ManageState {
//   @override
//   List<Object?> get props => [];
// }

// class LoginState extends ManageState {
//   final User user;
//   // final String password;
//   const LoginState({
//     required this.user,
//   });
//   @override
//   List<Object?> get props => [user];
// }
class GettingProd extends ManageState {
  const GettingProd();
  @override
  List<Object?> get props => [];
}

// class RegisterState extends ManageState {
//   // final String username;
//   // final String password;
//   final User user;
//   const RegisterState({
//     required this.user,
//   });
//   @override
//   List<Object?> get props => [user];
// }

class LogOutState extends ManageState {
  // final String username;
  // final String password;
  const LogOutState();
  @override
  List<Object?> get props => [];
}

class UploadState extends ManageState {
  @override
  List<Object?> get props => [];
}

class AddState extends ManageState {
  // final String name;
  // final String description;
  // final Reference imagePath;
  // final void store;
  //final store;
  const AddState();
  @override
  List<Object?> get props => [];
}

class LoadState extends ManageState {
  final List<FireModels> models;
  const LoadState({required this.models});
  @override
  List<Object?> get props => [models];
}
//from previous bloc

class LoadingState extends ManageState {
  const LoadingState();
  @override
  List<Object> get props => [];
}

class LoginState extends ManageState {
  final User user;
  // final String password;
  const LoginState({
    required this.user,
  });
  @override
  List<Object> get props => [user];
}

class RegisterState extends ManageState {
  // final String username;
  // final String password;
  // final User user;
  // const RegisterState({
  //   required this.user,
  // });
  @override
  List<Object> get props => [];
}

class RegistrationView extends ManageState {
  const RegistrationView();

  @override
  List<Object?> get props => [];
}

// class LogOutState extends ManageState {
//   // final String username;
//   // final String password;
//   const LogOutState();
//   @override
//   List<Object> get props => [];
// }
