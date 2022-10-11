import 'package:equatable/equatable.dart';
import 'package:manage/models/firebaseModels/models_fire.dart';

abstract class ManageEvent extends Equatable {
  //remember to add equatables and bool loading;
  const ManageEvent();
}

class LoadingEvent extends ManageEvent {
  @override
  List<Object?> get props => [];
}

class AddingEvents extends ManageEvent {
  @override
  List<Object?> get props => [];
}

// class LoginEvent extends ManageEvent {
//   final String username;
//   final String password;
//   const LoginEvent({
//     required this.username,
//     required this.password,
//   });

//   @override
//   List<Object?> get props => [username, password];
// }

// class RegistrationEvent extends ManageEvent {
//   final String username;
//   final String password;
//   const RegistrationEvent({
//     required this.username,
//     required this.password,
//   });

//   @override
//   List<Object?> get props => [username, password];
// }

class AddEvent extends ManageEvent {
  final String name;
  final String description;
  final String price;
  final String imagePath;

  const AddEvent(
      {required this.name,
      required this.description,
      required this.price,
      required this.imagePath});
  @override
  List<Object?> get props => [name, description, imagePath];
}

class LogOutEvent extends ManageEvent {
  @override
  List<Object?> get props => throw UnimplementedError();
}

class UploadEvent extends ManageEvent {
  @override
  // TODO: implement props
  List<Object?> get props => throw UnimplementedError();
}

class LoadEvent extends ManageEvent {
  //final List<FireModels> models;
  const LoadEvent();
  @override
  List<Object?> get props => [];
}

//from userbloc
class AddingEvent extends ManageEvent {
  @override
  List<Object> get props => [];
}

class Create extends ManageEvent {
  final String username;
  final String password;
  const Create({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

class LoginEvent extends ManageEvent {
  final String username;
  final String password;
  const LoginEvent({
    required this.username,
    required this.password,
  });

  @override
  List<Object?> get props => [username, password];
}

class LogOut extends ManageEvent {
  @override
  List<Object?> get props => [];
}

class AppEventGoToReg implements ManageEvent {
  const AppEventGoToReg();

  @override
  List<Object?> get props => [];

  @override
  // TODO: implement stringify
  bool? get stringify => throw UnimplementedError();
}
