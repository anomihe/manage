import 'package:flutter/material.dart';
import 'package:manage/mainScreen/firstExport.dart';

class Homepage extends StatelessWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(
        backgroundColor: Color.fromARGB(178, 54, 55, 92),
        child: MyDrawer(),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(148, 255, 64, 128),
        title: const Text('CEDER WORLD'),
      ),
      body: const Allproducts(),
    );
  }
}
