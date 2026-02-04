import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:cinetrack/features/statistic/domain/repositories/statistic_repositoy.dart';
import 'package:dartz/dartz.dart';

class Statistics {
  final StatisticRepository repositoy;

  Statistics(this.repositoy);

  Future<Either<Failure, Statistic>> execute(String year) {
    return repositoy.getStatistics(year);
  }
}
