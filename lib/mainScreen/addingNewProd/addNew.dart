import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class AddNew extends StatefulWidget {
  const AddNew({Key? key}) : super(key: key);

  @override
  State<AddNew> createState() => _AddNewState();
}

class _AddNewState extends State<AddNew> {
  File? imagefile;
  bool added = false;
  final ImagePicker _picker = ImagePicker();
  TextEditingController nameCont = TextEditingController();
  TextEditingController desCont = TextEditingController();
  Future _getFromCamera() async {
    try {
      final imagefile = await _picker.pickImage(source: ImageSource.camera);
      if (imagefile == null) {
        return;
      } else {
        final imageTmp = File(imagefile.path);
        setState(() {
          this.imagefile = imageTmp;
        });
      }
    } catch (e) {
      debugPrint('unable to load $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: Colors.blueGrey,
        ),
        child: Column(children: [
          TextField(controller: nameCont),
          TextField(controller: desCont),
          imagefile == null
              ? IconButton(
                  onPressed: () {
                    _getFromCamera();
                  },
                  icon: const Icon(
                    Icons.add_a_photo,
                  ),
                )
              : Image.file(
                  imagefile!,
                  fit: BoxFit.cover,
                ),
          // Container(
          //   child: imagefile ==null: Colu,
          // )
          MaterialButton(
            onPressed: () {
              Navigator.pop(context);
              nameCont.clear();
              desCont.clear();
              // imagefile!.delete();
              added = true;
            },
            child: const Text('add'),
          )
        ]));
  }
}
