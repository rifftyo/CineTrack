abstract class RegisterEvent {}

class RegisterSubmitted extends RegisterEvent {
  final String email;
  final String fullname;
  final String username;
  final String password;

  RegisterSubmitted(
    this.email,
    this.fullname,
    this.username,
    this.password,
  );
}
