import 'package:flutter/material.dart';
import 'dart:developer' as devtools show log;

extension Log on Object {
  void log() => devtools.log(toString());
}

class MyDrawer extends StatefulWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const CircleAvatar(
          radius: 70,
          backgroundImage: AssetImage('assets/02-Jervix.jpg'),
        ),
        myContaier(context),
        //  pressedText('My Products', '/Allproducts'),
        pressedText('Orders', '/orders'),
        pressedText('New Products', '/New_Products'),
        TextButton(
            child: const Text('Log Out'),
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('Log Out'),
                      content: const Text('Do You Wish To Log Out'),
                      actions: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/');
                            },
                            child: const Text('Yes')),
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('No'))
                      ],
                    );
                  });
            }),
      ],
    );
  }

  Widget pressedText(String text, String pressed) {
    return Container(
      width: 300,
      height: 40,
      color: Colors.red,
      child: InkWell(
          focusColor: Colors.grey,
          onTap: (() => Navigator.popAndPushNamed(context, pressed)),
          child: Text(text)),
    );
  }

  Widget myContaier(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: const Card(
        child: Text('My Products'),
      ),
    );
  }
}
