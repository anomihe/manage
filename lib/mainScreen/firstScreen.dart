//import 'dart:js';
import 'package:flutter/material.dart';
import 'package:manage/dialogs/custom_dialog.dart';
import 'package:manage/mainScreen/addingNewProd/update.dart';
import 'package:manage/mainScreen/firstExport.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  ProductRepo repo = ProductRepo();
  // CollectionReference users = FirebaseFirestore.instance.collection('products');
  final CollectionReference prod =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return BlocListener<MainBloc, ManageState>(
      listener: (context, state) {
        if (state is LoadState) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const Allproducts()));
        }

        // Navigator.of(context, rootNavigator: true).pop();
        // if (state is SubjectFailed) {
        //   showErrorDialog(context);
        // }
        // if (state is SubjectSuccess) {
        //   showSuccessDialog(context);
        // }
      },
      child: Scaffold(
          backgroundColor: Colors.grey,
          drawer: const Drawer(
            backgroundColor: Color.fromARGB(178, 54, 55, 92),
            child: MyDrawer(),
          ),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(148, 255, 64, 128),
            title: const Text('CEDER WORLD'),
            actions: [
              IconButton(
                  onPressed: () {
                    context.read<MainBloc>().add(const LoadEvent());
                  },
                  icon: const Icon(Icons.textsms))
            ],
          ),
          body: StreamBuilder<List<FireModels>>(
              stream: ProductRepo.get(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return Card(
                          elevation: 10,
                          color: Colors.blueGrey,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            //crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 100,
                                width: 100,
                                child: Image.network(
                                  snapshot.data![index].path,
                                  fit: BoxFit.contain,
                                ),
                              ),
                              const SizedBox(
                                width: 1.5,
                              ),
                              Column(
                                children: [
                                  Text(
                                    snapshot.data![index].name,
                                  ),
                                  Text(
                                    snapshot.data![index].desc,
                                    maxLines: 10000,
                                    style: TextStyle(),
                                  ),
                                  Text(
                                      'Price is ${snapshot.data![index].price}'),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    // mainAxisAlignment:
                                    //     MainAxisAlignment.spaceBetween,
                                    children: [
                                      MaterialButton(
                                          elevation: 10,
                                          color: Colors.grey[400],
                                          onPressed: (() {
                                            showDialog(
                                                context: context,
                                                builder: (context) {
                                                  return Custom(
                                                      title: 'Delete',
                                                      onpressed: (() {
                                                        // context.read<MainBloc>();
                                                        repo.delete(snapshot
                                                            .data![index]);
                                                        Navigator.pop(context);
                                                      }),
                                                      description:
                                                          'Do you wish to delete the product');
                                                });
                                          }),
                                          child: const Text('delete')),
                                      const SizedBox(
                                        width: 15,
                                      ),
                                      MaterialButton(
                                        color: Colors.green,
                                        onPressed: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: ((context) => Update(
                                                        models: FireModels(
                                                            id: snapshot
                                                                .data![index]
                                                                .id,
                                                            name: snapshot
                                                                .data![index]
                                                                .name,
                                                            desc: snapshot
                                                                .data![index]
                                                                .desc,
                                                            path: snapshot
                                                                .data![index]
                                                                .path,
                                                            price: snapshot
                                                                .data![index]
                                                                .price),
                                                      )))
                                              // Navigator.pushNamed(
                                              //   context,
                                              //   '/update',
                                              //    arguments: snapshot.data![index]
                                              // FireModels(
                                              //     id: snapshot.data![index].id,
                                              //     name:
                                              //         snapshot.data![index].name,
                                              //     desc:
                                              //         snapshot.data![index].desc,
                                              //     path:
                                              //         snapshot.data![index].path,
                                              //     price: snapshot
                                              //         .data![index].price),
                                              );
                                        },
                                        child: const Text('Update'),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        );
                      });
                } else {
                  return Center(
                      child: Column(
                    children: [
                      const CircularProgressIndicator(),
                      IconButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/add');
                          },
                          icon: const Icon(Icons.add))
                    ],
                  ));
                }
              })),
    );
  }

  // PersistentBottomSheetController bumtto(BuildContext context) {
  //   return showBottomSheet(
  //     context: context,
  //     builder: ((context) {
  //       return Container(
  //         height: 10,
  //       );
  //     }),
  //   );
  // }
}

//const Allproducts()

// class Homepage extends StatelessWidget {
//   Homepage({Key? key}) : super(key: key);
//   ProductRepo repo = ProductRepo();
//   CollectionReference users = FirebaseFirestore.instance.collection('products');
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         drawer: const Drawer(
//           backgroundColor: Color.fromARGB(178, 54, 55, 92),
//           child: MyDrawer(),
//         ),
//         appBar: AppBar(
//           backgroundColor: const Color.fromARGB(148, 255, 64, 128),
//           title: const Text('CEDER WORLD'),
//         ),
//         body: FutureBuilder<DocumentSnapshot>(
//           future:users.doc().get() ,
//           builder: (context, snapshot) {
//             if (snapshot.hasData) {
//               return Column(
//                 children: [
//                   Text(snapshot.data!['name']),
//                 ],
//               );
//             } else {
//               return const CircularProgressIndicator.adaptive();
//             }
//           },
//         )

//         //const Allproducts()

//         );
//   }

//   Widget products(AsyncSnapshot<Object?> snapshot) {
//     return const Card(
//       child: Text('name'),
//     );
//   }
// }
// FutureBuilder<DocumentSnapshot>(
//               future: users.doc('nkZTQ4xkHa3LSOpwvQle').get(),
//               builder: (context, snapshot) {
//                 if (snapshot.hasData) {
//                   return Column(
//                     children: [
//                       Text(snapshot.data!['name']),
//                       Text(snapshot.data!['description']),
//                     ],
//                   );
//                 } else {
//                   return const CircularProgressIndicator.adaptive();
//                 }
//               },
//             )
