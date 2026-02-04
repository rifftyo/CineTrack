import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/statistic/domain/repositories/statistic_repositoy.dart';
import 'package:dartz/dartz.dart';

class Insights {
  final StatisticRepository repositoy;

  Insights(this.repositoy);

  Future<Either<Failure, List<String>>> execute() {
    return repositoy.getInsights();
  }
}
