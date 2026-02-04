import 'package:cinetrack/core/network/dio_client.dart';
import 'package:cinetrack/core/network/dio_error_handler.dart';
import 'package:cinetrack/features/watched/data/model/message_response.dart';
import 'package:cinetrack/features/watched/data/model/watched_data_response.dart';
import 'package:dio/dio.dart';

abstract class WatchedRemoteDataSource {
  Future<MessageResponse> postWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
    String watchedAt,
  );
  Future<WatchedDataResponse> getWatchedMovies();
  Future<MessageResponse> putWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
  );
}

class WatchedRemoteDataSourceImpl implements WatchedRemoteDataSource {
  final Dio dio;

  WatchedRemoteDataSourceImpl(DioClient client) : dio = client.dio;

  @override
  Future<WatchedDataResponse> getWatchedMovies() async {
    try {
      final response = await dio.get("/watched");
      return WatchedDataResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<MessageResponse> postWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
    String watchedAt,
  ) async {
    try {
      final response = await dio.post(
        "/watched",
        data: {
          "tmdb_id": tmdbId,
          "user_rating": userRating,
          "review": review,
          "watched_at": watchedAt,
        },
      );
      return MessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<MessageResponse> putWatchedMovie(
    int tmdbId,
    double userRating,
    String review,
  ) async {
    try {
      final response = await dio.put(
        "/watched/$tmdbId",
        data: {"user_rating": userRating, "review": review},
      );
      return MessageResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }
}
