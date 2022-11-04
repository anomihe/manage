import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/bloc_state.dart';
import 'package:manage/bloc_state/credn/userbloc_dart_bloc.dart';
import 'package:manage/firebaseServices/repo.dart';
import 'package:manage/models/firebaseModels/models_fire.dart';

class MainBloc extends Bloc<ManageEvent, ManageState> {
  final ProductRepo repo;

//final UserblocDartBloc _users;

  StreamSubscription? subscription;
  MainBloc(
    this.repo,
  ) : super(const GettingProd()) {
    // on<LoginEvent>((event, emit) async {
    //   try {
    //     final username = event.username;
    //     final password = event.password;

    //     final use = await FirebaseAuth.instance.signInWithEmailAndPassword(
    //       email: username,
    //       password: password,
    //     );
    //     final used = use.user!;
    //     emit(LoginState(user: used));
    //   } catch (e) {
    //     print(e.toString());
    //   }
    // });
    // on<RegistrationEvent>((event, emit) async {
    //   try {
    //     final username = event.username;
    //     final password = event.password;
    //     final use = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    //       email: username,
    //       password: password,
    //     );
    //     final register = use.user!;
    //     emit(RegisterState(user: register));
    //   } catch (e) {
    //     debugPrint(e.toString());
    //   }
    // });
    // on<LogOutEvent>((event, emit) async {
    //   await FirebaseAuth.instance.signOut();
    //   emit(const LogOutState());
    // });
    on<LoadingEvent>((event, emit) => const LoadingState());
    on<AddingEvents>((event, emit) {
      emit(const GettingProd());
    });
    on<AddEvent>((event, emit) async {
      try {
        //final name = event.name;
        // final description = event.description;
        //final price = event.price;
        // final name = event.models.name;
        // final description = event.models.desc;
        // final imagePath = File(event.imagePath);
        // final ref = FirebaseStorage.instance
        //     .ref()
        //     .child('productionImages')
        //     .child('$name.jpg');
        // await ref.putFile(imagePath);
        //final url = await ref.getDownloadURL();
        // await FirebaseFirestore.instance.collection('products').doc().set({
        //   'name': name,
        //   'description': description,
        //   'imagePath': url,
        // });
        // await repo.creates(
        //     name: name,
        //     description: description,
        //     price: event.price,
        //     imagePath: url);
        repo.creates(models: event.models);
        // final state= this.state;
        //  if(state is LoadState){
        emit(
          //  LoadState(models: List.from(state.models)..add(event.add))
          const AddState(),
        );
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    on<LoadEvent>((event, emit) async {
      emit(const GettingProd());
      Future.delayed(const Duration(seconds: 3));
      // final fire = FirebaseFirestore.instance
      //     .collection('products')
      //     .snapshots()
      //     .map((snapshot) {
      //   return snapshot.docs
      //       .map((doc) => FireModels.fromJson(doc.data()))
      //       .toList();
      // });
      // subscription = _users.stream.listen((event) {
      //   add(LoginEvent(username: username, password: password));
      // });
      //List<FireModels> mood = await ProductRepo.geting().listen((event) add(UpdateEvent(models: models)));
      subscription?.cancel();
      subscription =
          repo.geting().listen((models) => add(UpdateEvent(models: models)));
      try {
        // final data = await repo.get();
        // emit(LoadState(models: ));

      } catch (e) {
        print(e);
      }
      // emit(LoadState(models: data));
    });
    on<UpdateEvent>((event, emit) {
      emit(LoadState(models: event.models));
    });
    //from used bloc
    on<AddingEvent>((event, emit) {
      emit(const LoadingState());
    });
    on<Create>((event, emit) async {
      try {
        final username = event.username;
        final password = event.password;
        // final use = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        //   email: username,
        //   password: password,
        // );
        await repo.createUser(email: username, password: password);
        // final use = await repo.createUser(email: username, password: password);
        //final register = use.user!;
        // emit(RegisterState(user: register));
        emit(RegisterState());
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    on<LoginEvent>((event, emit) async {
      try {
        try {
          final username = event.username;
          final password = event.password;

          // final use = await FirebaseAuth.instance.signInWithEmailAndPassword(
          //   email: username,
          //   password: password,
          // );
          final use = await repo.login(email: username, password: password);
          final used = use.user!;
          emit(LoginState(user: used));
          try {
            // final data = await ProductRepo.get();
            // emit(LoadState(models: data));
          } catch (e) {
            print(e);
          }
          // final data = await repo.get();
          // emit(LoadState(models: data));
        } on FirebaseAuthException catch (e) {
          debugPrint('this is the error ${e.toString()}');
        } catch (e) {
          debugPrint('this is the error ${e.toString()}');
        }
      } catch (e) {
        debugPrint(e.toString());
      }
    });
    on<LogOut>((event, emit) async {
      await FirebaseAuth.instance.signOut();
      emit(const LogOutState());
    });
    on<AppEventGoToReg>((event, emit) {
      emit(const RegistrationView());
    });

    //ended here

    // on<UpdateEvent>((event, emit) {
    //   final state = this.state;
    //   if(state is LoadState){

    //   }
    // });
  }
}
