abstract class RequestPasswordEvent {}

class RequestPasswordSubmitted extends RequestPasswordEvent {
  final String email;

  RequestPasswordSubmitted(this.email);
}
