import 'package:cinetrack/core/error/exceptions.dart';
import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/statistic/data/datasources/statistic_remote_data_source.dart';
import 'package:cinetrack/features/statistic/domain/entities/statistic.dart';
import 'package:cinetrack/features/statistic/domain/repositories/statistic_repositoy.dart';
import 'package:dartz/dartz.dart';

class StatisticRepositoryImpl implements StatisticRepository {
  final StatisticRemoteDataSource remote;

  StatisticRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, List<String>>> getInsights() async {
    try {
      final response = await remote.getInsights();
      return Right(response.data);
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, Statistic>> getStatistics(String year) async {
    try {
      final response = await remote.getStatistics(year);
      return Right(response.data.toEntity());
    } on ConnectionException catch (e) {
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      return Left(UnauthorizedFailure(e.message));
    } catch (e) {
      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }
}
