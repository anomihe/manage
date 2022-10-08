import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:manage/models/firebaseModels/models_fire.dart';

class ProductRepo {
  final _fireStore = FirebaseFirestore.instance.collection('products');
  final user = FirebaseAuth.instance;

  Future<void> creates(
      {required String name,
      required String description,
      required String price,
      required String imagePath}) async {
    try {
      // await _fireStore.doc().set({
      //   'name': name,
      //   'description': description,
      //   'imagePath': imagePath,
      // });
      await _fireStore.add({
        'name': name,
        'description': description,
        'price': price,
        'imagePath': imagePath
      });
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  Future<List<FireModels>> get() async {
    List<FireModels> prod = [];
    try {
      final products =
          await FirebaseFirestore.instance.collection('products').get();
      for (var element in products.docs) {
        prod.add(FireModels.fromJson(element.data()));
      }
    } on FirebaseException catch (e) {
      if (kDebugMode) {
        print(e.code);
      }
    } catch (e) {
      throw Exception(e.toString());
    }
    return prod;
  }

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
}
