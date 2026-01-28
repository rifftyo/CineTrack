abstract class ResetPasswordEvent {}

class ResetPasswordSubmitted extends ResetPasswordEvent {
  final String email;
  final String code;
  final String newPassword;

  ResetPasswordSubmitted(this.email, this.code, this.newPassword);
}
