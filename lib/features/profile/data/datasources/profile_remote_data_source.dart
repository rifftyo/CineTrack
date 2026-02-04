import 'package:cinetrack/core/network/dio_client.dart';
import 'package:cinetrack/core/network/dio_error_handler.dart';
import 'package:http_parser/http_parser.dart';
import 'package:cinetrack/features/profile/data/model/profile_response.dart';
import 'package:cinetrack/features/profile/domain/entities/avatar.dart';
import 'package:dio/dio.dart';

abstract class ProfileRemoteDataSource {
  Future<ProfileResponse> getProfile();
  Future<ProfileResponse> putProfile(
    String? fullName,
    String? userName,
    Avatar? avatar,
  );
}

class ProfileRemoteDataSourceImpl implements ProfileRemoteDataSource {
  final Dio dio;

  ProfileRemoteDataSourceImpl(DioClient client) : dio = client.dio;

  @override
  Future<ProfileResponse> getProfile() async {
    try {
      final response = await dio.get("/user");
      return ProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }

  @override
  Future<ProfileResponse> putProfile(
    String? fullName,
    String? userName,
    Avatar? avatar,
  ) async {
    try {
      final formData = FormData.fromMap({
        if (fullName != null) 'fullname': fullName,
        if (userName != null) 'username': userName,
        if (avatar != null)
          'avatar': MultipartFile.fromBytes(
            avatar.bytes,
            filename: avatar.fileName,
            contentType: MediaType.parse(avatar.mimeType),
          ),
      });

      final response = await dio.post(
        "/user",
        data: formData,
        options: Options(contentType: 'multipart/form-data'),
      );

      return ProfileResponse.fromJson(response.data);
    } on DioException catch (e) {
      handleDioError(e);
    }
  }
}
