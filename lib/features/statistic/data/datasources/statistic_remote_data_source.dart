import 'package:cinetrack/core/network/dio_client.dart';
import 'package:cinetrack/core/network/dio_error_handler.dart';
import 'package:cinetrack/features/statistic/data/model/insight_response.dart';
import 'package:cinetrack/features/statistic/data/model/statistic_data_response.dart';
import 'package:dio/dio.dart';

abstract class StatisticRemoteDataSource {
  Future<StatisticDataResponse> getStatistics(String year);
  Future<InsightResponse> getInsights();
}

class StatisticRemoteDataSourceImpl implements StatisticRemoteDataSource {
  final Dio dio;

  StatisticRemoteDataSourceImpl(DioClient client) : dio = client.dio;

  @override
  Future<InsightResponse> getInsights() async {
    try {
      final response = await dio.get("/statistics/insights");
      return InsightResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<StatisticDataResponse> getStatistics(String year) async {
    try {
      final response = await dio.get(
        "/statistics",
        queryParameters: {'year': year},
      );
      return StatisticDataResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }
}
