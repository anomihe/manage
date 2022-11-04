import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/bloc_state.dart';
import 'package:manage/bloc_state/main_bloc.dart';
import 'package:manage/firebaseServices/repo.dart';
import 'package:manage/firebaseServices/signinrepo.dart';
import 'package:manage/mainScreen/registar.dart';
import 'package:manage/routes/routegenerate.dart';
import './mainScreen/firstExport.dart';
import 'package:firebase_core/firebase_core.dart';
import 'bloc_state/credn/userbloc_dart_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  //ManagementRoute route;
  runApp((Home(
    route: ManagementRoute(),
  )));
}

class Home extends StatelessWidget {
  const Home({Key? key, required this.route}) : super(key: key);

  final ManagementRoute route;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => MainBloc(ProductRepo())..add(const LoadEvent()),
      child: MaterialApp(
          onGenerateRoute: route.generateRoute,
          title: 'Management',
          home: BlocBuilder<MainBloc, ManageState>(
            bloc: MainBloc(ProductRepo()),
            builder: ((context, state) {
              if (state is GettingProd) {
                return const LoginScreen();
              }
              // if (state is LoadingState) {
              //   return const LoginScreen();
              // }
              else if (state is LoadState) {
                return const Allproducts();
              } else if (state is LoginState) {
                return const Homepage();
              }
              //else if (state is LoginState) {
              //   return  Homepage();
              // }
              else if (state is RegistrationView) {
                return const RegisterScreen();
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
          )),
    );
  }
}

// class NewHome extends StatelessWidget {
//   const NewHome({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         crossAxisAlignment:CrossAxisAlignment.center, 
//         children: [
//           const Text('wlecome, Let\'s Login '),
//           MaterialButton(
//             onPressed: () {
//               context.read<MainBloc>().add(LoginEvent());
//             },
//             child: const Text('Go'),
//           )
//         ],
//       ),
//     );
//   }
// }

// class NewHome extends StatelessWidget {
//   const NewHome({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<MainBloc, ManageState>(
//       // bloc: MainBloc(ProductRepo()),
//       bloc: MainBloc(ProductRepo()),
//       builder: ((context, state) {
//         if (state is LoadingState) {
//           return const LoginScreen();
//         }
//         if (state is LoginState) {
//           return const Homepage();
//         }
//         if (state is RegisterState) {
//           return const RegisterScreen();
//         } else {
//           return const Center(child: CircularProgressIndicator());
//         }
//       }),
//     );
//   }
// }
