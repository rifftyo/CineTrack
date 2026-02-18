import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/auth/domain/usecases/logout.dart';
import 'package:cinetrack/features/auth/presentation/bloc/logout/logout_bloc.dart';

class LogoutBloc extends Cubit<LogoutState> {
  final Logout logout;

  LogoutBloc(this.logout) : super(LogoutInitial());

  Future<void> logoutUser() async {
    emit(LogoutLoading());

    final result = await logout.execute();

    result.fold(
      (failure) => emit(LogoutFailure(failure.message)),
      (_) => emit(LogoutSuccess("Logout successful")),
    );
  }
}
