import 'package:cinetrack/core/error/exceptions.dart';
import 'package:cinetrack/core/error/failures.dart';
import 'package:cinetrack/features/movie/data/datasources/movie_data_source.dart';
import 'package:cinetrack/features/movie/domain/entities/movie.dart';
import 'package:cinetrack/features/movie/domain/repositories/movie_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remote;

  MovieRepositoryImpl({required this.remote});

  @override
  Future<Either<Failure, Movie>> getDetailMovie(int id) async {
    try {
      final response = await remote.getDetailMovies(id);
      return Right(response.result.toEntity());
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
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    try {
      final response = await remote.getNowPlayingMovies();

      final movies = response.results.map((e) => e.toEntity()).toList();
      return Right(movies);
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
  Future<Either<Failure, List<Movie>>> getSearchMovie(
    String? query,
    int? minRating,
    int? genre,
  ) async {
    try {
      debugPrint("🔍 [Repository] SEARCH MOVIE");
      debugPrint("➡️ Query      : $query");
      debugPrint("➡️ Min Rating : $minRating");
      debugPrint("➡️ Genre      : $genre");

      final response = await remote.getSearchMovie(query, minRating, genre);

      // DEBUG RESPONSE
      debugPrint("✅ [Repository] RESPONSE RECEIVED");
      debugPrint("➡️ Results count: ${response.results.length}");

      final movies = response.results.map((e) => e.toEntity()).toList();

      return Right(movies);
    } on ConnectionException catch (e) {
      debugPrint("❌ [Repository] ConnectionException");
      debugPrint("➡️ Message: ${e.message}");
      return Left(ConnectionFailure(e.message ?? "No Internet Connection"));
    } on BadRequestException catch (e) {
      debugPrint("❌ [Repository] BadRequestException");
      debugPrint("➡️ Message: ${e.message}");
      return Left(BadFailure(e.message ?? "Data Tidak Valid"));
    } on ServerException catch (e) {
      debugPrint("❌ [Repository] ServerException");
      debugPrint("➡️ Message: ${e.message}");
      return Left(ServerFailure(e.message ?? "Server Error"));
    } on UnauthorizedException catch (e) {
      debugPrint("❌ [Repository] UnauthorizedException");
      debugPrint("➡️ Message: ${e.message}");
      return Left(UnauthorizedFailure(e.message));
    } catch (e, stackTrace) {
      debugPrint("🔥 [Repository] UNEXPECTED ERROR");
      debugPrint("➡️ Error: $e");
      debugPrint("➡️ StackTrace: $stackTrace");

      return Left(ServerFailure("Unexpected Error: $e"));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    try {
      final response = await remote.getTopRatedMovies();

      final movies = response.results.map((e) => e.toEntity()).toList();
      return Right(movies);
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
