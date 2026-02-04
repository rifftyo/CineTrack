import 'package:cinetrack/features/home/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cinetrack/features/home/domain/usecases/get_home_data.dart';

class HomeBloc extends Cubit<HomeState> {
  final GetHomeData getHomeData;

  HomeBloc(this.getHomeData) : super(HomeInitial());

  Future<void> loadHome() async {
    emit(HomeLoading());

    final currentYear = DateTime.now().year.toString();

    final result = await getHomeData.execute(currentYear);

    result.fold(
      (failure) => emit(HomeFailure(failure.message)),
      (data) => emit(HomeSuccess(data)),
    );
  }
}
