// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:manage/mainScreen/firstExport.dart';

class Orders extends StatefulWidget {
  const Orders({Key? key}) : super(key: key);

  @override
  State<Orders> createState() => _OrdersState();
}

class _OrdersState extends State<Orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: const Drawer(
      //   child: MyDrawer(),
      // ),
      appBar: AppBar(
        title: const Text('Orders'),
      ),
    );
  }
}
