import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class FireModels extends Equatable {
  final String? id;
  final String name;
  final String desc;
  final String path;
  final int price;
  const FireModels(
      {this.id,
      required this.name,
      required this.desc,
      required this.path,
      required this.price});

  @override
  List<Object?> get props => [id, name, desc, path, price];

  factory FireModels.fromJson(Map<String, dynamic> snap) {
    FireModels models = FireModels(
      id: snap['id'],
      name: snap['name'],
      desc: snap['desc'],
      path: snap['path'],
      price: snap['price'],
    );
    return models;
  }
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'desc': desc,
      'path': path,
      'price': price,
    };
  }

  static FireModels fromSnaphot(DocumentSnapshot snapshot) {
    FireModels models = FireModels(
      id: snapshot['id'],
      name: snapshot['name'],
      desc: snapshot['desc'],
      path: snapshot['path'],
      price: snapshot['price'],
    );
    return models;
  }

  FireModels copyWith(
      {String? id, String? name, String? desc, String? path, int? price}) {
    return FireModels(
      id: id ?? this.id,
      name: name ?? this.name,
      desc: desc ?? this.desc,
      path: path ?? this.path,
      price: price ?? this.price,
    );
  }
}
