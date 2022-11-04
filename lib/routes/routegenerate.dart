import 'package:flutter/material.dart';
import 'package:manage/mainScreen/addingNewProd/addNew.dart';
import 'package:manage/mainScreen/addingNewProd/update.dart';
import 'package:manage/mainScreen/firstExport.dart';
import 'package:manage/mainScreen/registar.dart';

class ManagementRoute {
  Route<dynamic>? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        });
      case '/Homepage':
        return MaterialPageRoute(builder: (_) {
          return const Homepage();
        });
      case '/orders':
        return MaterialPageRoute(builder: (_) {
          return const Orders();
        });
      case '/New_Products':
        return MaterialPageRoute(builder: (_) {
          return const NewProductScreen();
        });
      case '/adding':
        return MaterialPageRoute(builder: (_) {
          return const AddNew();
        });
      // case '/update':
      //   return MaterialPageRoute(builder: (_) {
      //     return const Update();
      //   });
      case '/add':
        return MaterialPageRoute(builder: (_) {
          return const AddNew();
        });
      case '/register':
        return MaterialPageRoute(builder: (_) {
          return const RegisterScreen();
        });
      case '/log out':
        return MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        });
      default:
    }
    return null;
  }
}
