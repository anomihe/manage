import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
//import 'dart:developer' as devTools show log;

// extension Log on devTools{

// }

class NewProductScreen extends StatefulWidget {
  const NewProductScreen({Key? key}) : super(key: key);

  @override
  State<NewProductScreen> createState() => _NewProductScreenState();
}

class _NewProductScreenState extends State<NewProductScreen> {
  // void showDialog() {
  //   showDialog(
  //     context:context,

  //   );
  // }
  final CollectionReference prod =
      FirebaseFirestore.instance.collection('products');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Products'),
      ),
      body: StreamBuilder(
          stream: prod.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Text(snapshot.data!.docs[index]['name']),
                        Text(snapshot.data!.docs[index]['desc'])
                      ],
                    );
                  });
            } else {
              return ListView(children: []);
            }
          }),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, '/adding');
              },
              heroTag: 'add',
              backgroundColor: Colors.grey,
              child: const Icon(Icons.add),
            ),
            FloatingActionButton(
              onPressed: () {},
              heroTag: 'upload',
              backgroundColor: Colors.grey,
              child: const Icon(Icons.upload_file),
            )
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
