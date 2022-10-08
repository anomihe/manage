import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/bloc_state.dart';
import 'package:manage/bloc_state/main_bloc.dart';

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
    return Scaffold(
      body: BlocListener<MainBloc, ManageState>(
        listener: ((context, state) {
          if (state is AddState) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Added to database')));
          }
        }),
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Column(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  TextField(controller: nameCont),
                  const SizedBox(
                    height: 100,
                  ),
                  TextField(controller: desCont),
                  const SizedBox(
                    height: 100,
                  ),
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: imagefile == null
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
                  ),
                  // Container(
                  //   child: imagefile ==null: Colu,
                  // )
                  MaterialButton(
                    onPressed: () {
                      BlocProvider.of<MainBloc>(context).add(AddEvent(
                        name: nameCont.text,
                        description: desCont.text,
                        imagePath: imagefile!.path,
                        price: '',
                      ));
                      Navigator.pop(context);
                      nameCont.clear();
                      desCont.clear();
                      // imagefile!.delete();
                      added = true;
                    },
                    child: const Text('add'),
                  )
                ])),
      ),
    );
  }
}
