import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/home/domain/entities/home_data.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, HomeData>> getHomeData(String year);
}
