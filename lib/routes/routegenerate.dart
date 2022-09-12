import 'package:flutter/material.dart';
import 'package:manage/mainScreen/firstExport.dart';

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
      case '/log out':
        return MaterialPageRoute(builder: (_) {
          return const LoginScreen();
        });
      default:
    }
    return null;
  }
}
