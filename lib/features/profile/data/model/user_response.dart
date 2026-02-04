import 'package:cinetrack/features/profile/domain/entities/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_response.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'profile_photo')
  final String profilePhoto;
  @JsonKey(name: 'fullname')
  final String fullName;
  @JsonKey(name: 'username')
  final String userName;
  final String joined;
  @JsonKey(name: 'movies_watched')
  final int moviesWatched;
  @JsonKey(name: 'average_rating')
  final double averageRating;
  @JsonKey(name: 'favorite_genre')
  final String favoriteGenre;

  const UserResponse(
    this.profilePhoto,
    this.fullName,
    this.userName,
    this.joined,
    this.moviesWatched,
    this.averageRating,
    this.favoriteGenre,
  );

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseToJson(this);

  User toEntity() {
    return User(
      profilePhoto,
      fullName,
      userName,
      joined,
      moviesWatched,
      averageRating,
      favoriteGenre,
    );
  }
}
