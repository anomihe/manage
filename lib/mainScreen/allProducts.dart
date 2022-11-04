// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/bloc_state.dart';
import 'package:manage/bloc_state/main_bloc.dart';
import 'package:manage/firebaseServices/repo.dart';
import 'package:manage/models/firebaseModels/models_fire.dart';

class Allproducts extends StatefulWidget {
  const Allproducts({Key? key}) : super(key: key);

  @override
  State<Allproducts> createState() => _AllproductsState();
}

class _AllproductsState extends State<Allproducts> {
  MainBloc refresh = MainBloc(ProductRepo());
  late FireModels repoModels;
  ProductRepo main = ProductRepo();
  @override
  void initState() {
    // MainBloc refresh = MainBloc(ProductRepo());
    super.initState();

    BlocProvider.of<MainBloc>(context).add(const LoadEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: BlocBuilder<MainBloc, ManageState>(
      bloc: MainBloc(ProductRepo()),
      builder: (context, state) {
        if (state is LoadState) {
          // List<FireModels> data = state.models;

          return ListView.builder(
//future:refresh ,

            // itemCount: data.length,
            itemBuilder: ((context, index) {
              return Card(
                child: Row(
                  children: [
                    Image.network(state.models[index].path),
// SizedBox(
// image.memory()
// ),
                    Column(
                      children: [
                        Text(state.models[index].name),
                        Text(state.models[index].desc),
                        Text(state.models[index].price.toString()),
                      ],
                    )
                  ],
                ),
              );
            }),
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    ));
  }
}
