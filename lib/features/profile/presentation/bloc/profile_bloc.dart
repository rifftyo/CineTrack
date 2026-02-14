import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/profile/domain/usecases/profile.dart';
import 'package:cinetrack/features/profile/presentation/bloc/profile_state.dart';

class ProfileBloc extends Cubit<ProfileState> {
  final Profile profile;

  ProfileBloc(this.profile) : super(ProfileInitial());

  Future<void> fetchProfile() async {
    emit(ProfileLoading());

    final result = await profile.execute();

    result.fold(
      (failure) => emit(ProfileFailure(error: failure.message)),
      (data) => emit(ProfileSuccess(userData: data)),
    );
  }
}
