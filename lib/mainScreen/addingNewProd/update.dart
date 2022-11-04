import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:manage/bloc_state/bloc_event.dart';
import 'package:manage/bloc_state/bloc_state.dart';
import 'package:manage/bloc_state/main_bloc.dart';
import 'package:manage/mainScreen/firstExport.dart';
import 'package:manage/models/firebaseModels/models_fire.dart';

class Update extends StatefulWidget {
  final FireModels models;
  const Update({Key? key, required this.models}) : super(key: key);

  @override
  State<Update> createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  @override
  void initState() {
    super.initState();
    // FireModels fire = ModalRoute.of(context)!.settings.arguments as FireModels;
    //nameCont = fire.name as TextEditingController;
    nameCont = TextEditingController(text: widget.models.name);
    desCont = TextEditingController(text: widget.models.desc);
    priceCont = TextEditingController(text: widget.models.price.toString());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    // this._getCategories();
  }

  File? imagefile;
  bool added = false;
  final ImagePicker _picker = ImagePicker();
  TextEditingController? nameCont;
  TextEditingController? desCont;
  TextEditingController? priceCont;
  Future _getFromCamera() async {
    try {
      final imagefile = await _picker.pickImage(source: ImageSource.camera);
      // final imagefile = await _picker.pickImage(source:);
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
      //was supposed to add a bloc listener
      body: SingleChildScrollView(
        child: Container(
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(controller: nameCont),
                    const SizedBox(
                      height: 50,
                    ),
                    TextField(controller: desCont),
                    TextField(controller: priceCont),
                    const SizedBox(
                      height: 50,
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
                          : Image.network(
                              widget.models.path,
                              fit: BoxFit.cover,
                            ),
                    ),
                    // Container(
                    //   child: imagefile ==null: Colu,
                    // )
                    MaterialButton(
                      onPressed: () {
                        var added = FireModels(
                          name: nameCont!.text,
                          desc: desCont!.text,
                          path: imagefile!.path,
                          price: int.parse(priceCont!.text),
                        );
                        ProductRepo.updated(models: added)
                            .then((value) => Navigator.pop(context));

                        // BlocProvider.of<MainBloc>(context).add(AddEvent(
                        //   models: added,
                        // name: nameCont.text,
                        // description: desCont.text,
                        // imagePath: imagefile!.path,
                        // price: '',
                        //));
                        // Navigator.pop(context);
                        nameCont!.clear();
                        desCont!.clear();
                        priceCont!.clear();
                        // imagefile!.delete();
                        // added = true;
                      },
                      child: const Text('Update'),
                    )
                  ]),
            )),
      ),
    );
  }
}
