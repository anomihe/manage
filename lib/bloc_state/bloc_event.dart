abstract class ManageEvent {
  const ManageEvent();
}

class LoadingEvent extends ManageEvent {}

class LoginEvent extends ManageEvent {
 final String username;
 final  String password;
  const LoginEvent({
    required this.username,
    required this.password,
  });
}
class RegistrationEvent extends ManageEvent {
 final String username;
 final  String password;
  const RegistrationEvent({
    required this.username,
    required this.password,
  });
}

class LogOutEvent extends ManageEvent {}

class UploadEvent extends ManageEvent {}
