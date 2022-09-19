import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/bloc_state.dart';

class MainBloc extends Bloc<ManageEvent, ManageState> {
  MainBloc() : super(LoadingState()) {
    on<LoginEvent>((event, emit) async {
      try {
        final username = event.username;
        final password = event.password;
        final use = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: username,
          password: password,
        );
        final used = use.user!;
        emit(LoginState(user: used));
      } catch (e) {
        print(e.toString());
      }
    });
    on<RegistrationEvent>((event, emit) async {
      try {
        final username = event.username;
        final password = event.password;
        final use = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: username,
          password: password,
        );
        final register = use.user!;
        emit(RegisterState(user: register));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    on<LogOutEvent>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      emit(LogOutState());
    });
    on<AddEvent>((event, emit) async {
      try {
        final name = event.name;
        final description = event.description;
        final imagePath = File(event.imagePath);
        final ref = FirebaseStorage.instance
            .ref()
            .child('prouctionImages')
            .child('$name.jpg');
        await ref.putFile(imagePath);
        final url = ref.getDownloadURL();
        final add =
            await FirebaseFirestore.instance.collection('products').doc().set({
          'name': name,
          'description': description,
          'imagePath': url,
        });
        emit(AddState(store: add));
      } catch (e) {
        debugPrint(e.toString());
      }
    });
  }
}
