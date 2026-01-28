abstract class VerifyUserEvent {}

class VerifyUserSubmitted extends VerifyUserEvent {
  final String email;
  final String code;

  VerifyUserSubmitted(this.email, this.code);
}
