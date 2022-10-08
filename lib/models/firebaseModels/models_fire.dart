import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FireModels extends Equatable {
  final String name;
  final String desc;
  final String path;
  const FireModels(
      {required this.name, required this.desc, required this.path});

  @override
  List<Object?> get props => [name, desc, path];

  factory FireModels.fromJson(Map<String, dynamic> snap) {
    FireModels models = FireModels(
      name: snap['name'],
      desc: snap['desc'],
      path: snap['path'],
    );
    return models;
  }
}
