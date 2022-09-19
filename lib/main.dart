import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage/bloc_state/main_bloc.dart';
import 'package:manage/routes/routegenerate.dart';
import './mainScreen/firstExport.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
    return BlocProvider(
      create: (context) {
        return MainBloc();
      },
      child: MaterialApp(
        onGenerateRoute: route.generateRoute,
        title: 'Management',
        home: const LoginScreen(),
      ),
    );
  }
}
