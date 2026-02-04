import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:dartz/dartz.dart';

abstract class StatisticRepository {
  Future<Either<Failure, Statistic>> getStatistics(String year);
  Future<Either<Failure, List<String>>> getInsights();
}
