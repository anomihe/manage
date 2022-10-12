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
  @override
  void initState() {
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
          return ListView.builder(
            itemCount: state.models.length,
            itemBuilder: ((context, index) {
              return Card(
                child: Row(
                  children: [
                    const SizedBox(),
                    Column(
                      children: [
                        Text(state.models[index].name),
                        Text(state.models[index].desc),
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
