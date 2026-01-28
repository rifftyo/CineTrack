import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/register_user.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_event.dart';
import 'package:cinetrack/features/auth/presentation/bloc/register/register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUser registerUser;

  RegisterBloc(this.registerUser) : super(RegisterInitial()) {
    on<RegisterSubmitted>(_registerSubmitted);
  }

  Future<void> _registerSubmitted(
    RegisterSubmitted event,
    Emitter<RegisterState> emit,
  ) async {
    if (event.fullname.isEmpty) {
      return emit(RegisterFailure("Fullname is required"));
    }

    if (event.username.isEmpty) {
      return emit(RegisterFailure("Username is required"));
    }

    final username = event.username.toLowerCase();
    final usernameValid = RegExp(r'^[a-z0-9_.]+$').hasMatch(username);

    if (!usernameValid) {
      return emit(
        RegisterFailure(
          "Username must be lowercase and contain only letters, numbers, _ or .",
        ),
      );
    }

    if (event.email.isEmpty) {
      return emit(RegisterFailure("Email is required"));
    }

    if (event.password.isEmpty) {
      return emit(RegisterFailure("Password is required"));
    }

    emit(RegisterLoading());

    final result = await registerUser.execute(
      event.email,
      event.fullname,
      username,
      event.password,
    );

    result.fold(
      (failure) => emit(RegisterFailure(failure.message)),
      (message) => emit(RegisterSuccess(message)),
    );
  }
}
