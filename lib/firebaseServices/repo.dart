//import 'dart:html';

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:manage/models/firebaseModels/models_fire.dart';

import '../mainScreen/firstExport.dart';

class ProductRepo {
  final _fireStore = FirebaseFirestore.instance.collection('products');
  final user = FirebaseAuth.instance;

  // Future<void> creates(
  //     {required String name,
  //     required String description,
  //     required String price,
  //     required String imagePath}) async {
  //   try {
  //     // await _fireStore.doc().set({
  //     //   'name': name,
  //     //   'description': description,
  //     //   'imagePath': imagePath,
  //     // });
  //     User? use = user.currentUser;
  //     final uid = use!.uid;
  //     await _fireStore.doc().set({
  //       'name': name,
  //       'description': description,
  //       'price': price,
  //       'imagePath': imagePath,
  //     });
  //     // await _fireStore.doc().collection('products').add({
  //     //   'name': name,
  //     //   'description': description,
  //     //   'price': price,
  //     //   'imagePath': imagePath
  //     // });
  //   } on FirebaseException catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //   }
  // }

  Future creates({
    required FireModels models,
  }) async {
    try {
      // await _fireStore.doc().set({
      //   'name': name,
      //   'description': description,
      //   'imagePath': imagePath,
      // });
      final docId = _fireStore.doc().id;
      final imagePath = File(models.path);
      final ref = FirebaseStorage.instance
          .ref()
          .child('productionImages')
          .child('${models.name}.jpg');
      await ref.putFile(imagePath);
      final url = await ref.getDownloadURL();
      User? use = user.currentUser;
      final uid = use!.uid;
      final newUser = FireModels(
              id: docId,
              name: models.name,
              desc: models.desc,
              path: url,
              price: models.price)
          .toMap();
      return await _fireStore.doc(docId).set(
            newUser,
            //{
            // 'name': models.name,
            // 'description': models.desc,
            // 'price': models.price,
            // 'imagePath': url,
            //}
          );
      // await _fireStore.doc().collection('products').add({
      //   'name': name,
      //   'description': description,
      //   'price': price,
      //   'imagePath': imagePath
      // });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }
  // Future<List<FireModels>> geting() async {
  //   List<FireModels> prod = [];
  //   try {
  //     User? use = user.currentUser;
  //     String uid = use!.uid;
  //     final products =
  //         await FirebaseFirestore.instance.collection('products').doc().get();
  //     // final productss =
  //     //     FirebaseFirestore.instance.collection('products').doc(uid).snapshots();
  //     if (products.data() != null) {
  //       for (var element in products.get('products')) {
  //         prod.add(FireModels.fromJson(element.data()));
  //       }
  //     }
  //   } on FirebaseException catch (e) {
  //     if (kDebugMode) {
  //       print(e.code);
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  //   return prod;
  // }

  final users = FirebaseAuth.instance;
  Future<UserCredential> createUser(
      {required String email, required String password}) async {
    final use = await user.createUserWithEmailAndPassword(
        email: email, password: password);
    return use;
  }

  Future<UserCredential> login(
      {required String email, required String password}) async {
    final use = await user.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return use;
  }

  Future logout() async {
    await FirebaseAuth.instance.signOut();
  }

  static Stream<List<FireModels>> get() {
    return FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map((event) {
      return event.docs.map((doc) => FireModels.fromSnaphot(doc)).toList();
    });
  }

//was to be used in bloc to get the dats from firebase
  Stream<List<FireModels>> geting() {
    return FirebaseFirestore.instance
        .collection('products')
        .snapshots()
        .map((event) {
      return event.docs.map((doc) => FireModels.fromSnaphot(doc)).toList();
    });
  }
// void get(){
//   DocumentSnapshot snapshot = FirebaseFirestore.instance.collection('products').doc(uid).
// }

  Future update({
    required FireModels models,
  }) async {
    final imagePath = File(models.path);
    final ref = FirebaseStorage.instance
        .ref()
        .child('productionImages')
        .child('${models.name}.jpg');
    await ref.putFile(imagePath);
    final url = await ref.getDownloadURL();
    User? use = user.currentUser;
    final uid = use!.uid;
    final newUser = FireModels(
            id: models.id,
            name: models.name,
            desc: models.desc,
            path: url,
            price: models.price)
        .toMap();
    return await _fireStore.doc(models.id).update(
          newUser,
        );
  }

  static Future updated({
    required FireModels models,
  }) async {
    final imagePath = File(models.path);
    final ref = FirebaseStorage.instance
        .ref()
        .child('productionImages')
        .child('${models.name}.jpg');
    // image = Image.memory

    // Reference reff = FirebaseStorage.instance.refFromURL(models.path);
    await ref.putFile(imagePath);
    final url = await ref.getDownloadURL();
    // User? use = user.currentUser;
    // final uid = use!.uid;

    final newUser = FireModels(
            id: models.id,
            name: models.name,
            desc: models.desc,
            path: url,
            price: models.price)
        .toMap();
    return await FirebaseFirestore.instance.collection('products').doc().update(
          newUser,
        );
  }

  Future delete(FireModels models) async {
    final doc = _fireStore.doc(models.id).delete();
    return doc;
  }
}
