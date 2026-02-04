import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/home/domain/entities/home_data.dart';
import 'package:cinetrack/features/home/domain/repositories/home_repository.dart';
import 'package:dartz/dartz.dart';

class GetHomeData {
  final HomeRepository repository;

  GetHomeData(this.repository);

  Future<Either<Failure, HomeData>> execute(String year) async {
    return repository.getHomeData(year);
  }
}
