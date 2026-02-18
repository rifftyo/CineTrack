import 'package:bloc/bloc.dart';
import 'package:cinetrack/features/profile/domain/entities/avatar.dart';
import 'package:cinetrack/features/profile/domain/usecases/update_profile.dart';
import 'package:cinetrack/features/profile/presentation/bloc/update_profile/update_profile_state.dart';

class UpdateProfileBloc extends Cubit<UpdateProfileState> {
  final UpdateProfile updateProfile;

  UpdateProfileBloc(this.updateProfile) : super(UpdateProfileInitial());

  Future<void> updateProfileData(
    String? fullName,
    String? userName,
    Avatar? avatar,
  ) async {
    emit(UpdateProfileLoading());

    final result = await updateProfile.execute(fullName, userName, avatar);

    result.fold(
      (failure) => emit(UpdateProfileFailure(error: failure.message)),
      (message) => emit(UpdateProfileSuccess(message: message)),
    );
  }
}
