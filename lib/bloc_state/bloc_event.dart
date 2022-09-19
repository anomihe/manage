abstract class ManageEvent {
  //remember to add equatables and bool loading;
  const ManageEvent();
}

class LoadingEvent extends ManageEvent {}

class LoginEvent extends ManageEvent {
  final String username;
  final String password;
  const LoginEvent({
    required this.username,
    required this.password,
  });
}

class RegistrationEvent extends ManageEvent {
  final String username;
  final String password;
  const RegistrationEvent({
    required this.username,
    required this.password,
  });
}

class AddEvent extends ManageEvent {
  final String name;
  final String description;
  final String imagePath;

  AddEvent(
      {required this.name, required this.description, required this.imagePath});
}

class LogOutEvent extends ManageEvent {}

class UploadEvent extends ManageEvent {}
