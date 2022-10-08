// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:manage/firebaseServices/signinrepo.dart';

// part 'userbloc_dart_event.dart';
// part 'userbloc_dart_state.dart';

// class UserblocDartBloc extends Bloc<UserblocEvent, UserblocState> {
//   final AuthRepo repo;
//   UserblocDartBloc(this.repo) : super(UserInitial()) {
//     on<AddingEvent>((event, emit) {
//       emit(const LoadingState());
//     });
//     on<Create>((event, emit) async {
//       try {
//         final username = event.username;
//         final password = event.password;
//         // final use = await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         //   email: username,
//         //   password: password,
//         // );
//         await repo.createUser(email: username, password: password);
//         // final use = await repo.createUser(email: username, password: password);
//         //final register = use.user!;
//         // emit(RegisterState(user: register));
//         emit(RegisterState());
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     });
//     on<LoginEvent>((event, emit) async {
//       try {
//         try {
//           final username = event.username;
//           final password = event.password;

//           // final use = await FirebaseAuth.instance.signInWithEmailAndPassword(
//           //   email: username,
//           //   password: password,
//           // );
//           final use = await repo.login(email: username, password: password);
//           final used = use.user!;
//           emit(LoginState(user: used));
//         } catch (e) {
//           debugPrint(e.toString());
//         }
//       } catch (e) {
//         debugPrint(e.toString());
//       }
//     });
//     on<LogOut>((event, emit) async {
//       await FirebaseAuth.instance.signOut();
//       emit(const LogOutState());
//     });
//     on<AppEventGoToReg>((event, emit) {
//       emit(const RegistrationView());
//     });
//   }
// }
