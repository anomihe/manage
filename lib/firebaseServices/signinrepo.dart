// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:manage/models/firebaseModels/usermodel.dart';

// class AuthRepo {
  // final user = FirebaseAuth.instance;
//   Future<UserCredential> createUser(
//       {required String email, required String password}) async {
//     final use = await user.createUserWithEmailAndPassword(
//         email: email, password: password);
//     return use;
//   }

//   Future<UserCredential> login(
//       {required String email, required String password}) async {
//     final use = await FirebaseAuth.instance.signInWithEmailAndPassword(
//       email: email,
//       password: password,
//     );
//     return use;
//   }

//   Future logout() async {
//     await FirebaseAuth.instance.signOut();
//   }
// }
