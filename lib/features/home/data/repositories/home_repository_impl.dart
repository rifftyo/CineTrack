import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/home/domain/entities/home_data.dart';
import 'package:cinetrack/features/home/domain/repositories/home_repository.dart';
import 'package:cinetrack/features/movie/domain/repositories/movie_repository.dart';
import 'package:cinetrack/features/profile/domain/repositories/profile_repository.dart';
import 'package:cinetrack/features/statistic/domain/repositories/statistic_repositoy.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final MovieRepository movieRepository;
  final ProfileRepository profileRepository;
  final StatisticRepository statisticRepositoy;

  HomeRepositoryImpl(
    this.movieRepository,
    this.profileRepository,
    this.statisticRepositoy,
  );

  @override
  Future<Either<Failure, HomeData>> getHomeData(String year) async {
    final results = await Future.wait([
      movieRepository.getNowPlayingMovies(),
      movieRepository.getTopRatedMovies(),
      profileRepository.getProfile(),
      statisticRepositoy.getStatistics(year),
    ]);

    for (final result in results) {
      if (result.isLeft()) {
        return Left((result as Left).value);
      }
    }

    return Right(
      HomeData(
        (results[0] as Right).value,
        (results[1] as Right).value,
        (results[2] as Right).value,
        (results[3] as Right).value,
      ),
    );
  }
}
