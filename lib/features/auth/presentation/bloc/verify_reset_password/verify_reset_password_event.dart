abstract class VerifyResetPasswordEvent {}

class VerifyResetPasswordSubmitted extends VerifyResetPasswordEvent {
  final String email;
  final String code;

  VerifyResetPasswordSubmitted(this.email, this.code);
}
