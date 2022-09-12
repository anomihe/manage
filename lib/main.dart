import 'package:flutter/material.dart';
import 'package:manage/routes/routegenerate.dart';
import './mainScreen/firstExport.dart';

void main() {
  //ManagementRoute route;
  runApp(Home(
    route: ManagementRoute(),
  ));
}

class Home extends StatelessWidget {
  final ManagementRoute route;
  const Home({Key? key, required this.route}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: route.generateRoute,
      title: 'Management',
      home: const LoginScreen(),
    );
  }
}
