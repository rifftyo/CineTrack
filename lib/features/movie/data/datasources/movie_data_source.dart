import 'package:cinetrack/core/network/dio_client.dart';
import 'package:cinetrack/core/network/dio_error_handler.dart';
import 'package:cinetrack/features/movie/data/model/detail_movie_response.dart';
import 'package:cinetrack/features/movie/data/model/movie_data_response.dart';
import 'package:dio/dio.dart';

abstract class MovieRemoteDataSource {
  Future<MovieDataResponse> getNowPlayingMovies();
  Future<MovieDataResponse> getTopRatedMovies();
  Future<DetailMovieResponse> getDetailMovies(int id);
  Future<MovieDataResponse> getSearchMovie(
    String? query,
    int? minRating,
    int? genre,
  );
}

class MovieRemoteDataSourceImpl implements MovieRemoteDataSource {
  final Dio dio;

  MovieRemoteDataSourceImpl(DioClient client) : dio = client.dio;

  @override
  Future<MovieDataResponse> getNowPlayingMovies() async {
    try {
      final response = await dio.get("/movies/now-playing");

      return MovieDataResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<DetailMovieResponse> getDetailMovies(int id) async {
    try {
      final response = await dio.get("/movies/$id");

      return DetailMovieResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<MovieDataResponse> getSearchMovie(
    String? query,
    int? minRating,
    int? genre,
  ) async {
    try {
      final response = await dio.get(
        "/movies/discover",
        queryParameters: {
          if (query != null && query.isNotEmpty) 'query': query,
          if (minRating != null) 'min_rating': minRating,
          if (genre != null) 'genre': genre,
        },
      );

      return MovieDataResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<MovieDataResponse> getTopRatedMovies() async {
    try {
      final response = await dio.get("/movies/top-rated");

      return MovieDataResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }
}
