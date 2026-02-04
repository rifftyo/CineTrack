// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserResponse _$UserResponseFromJson(Map<String, dynamic> json) => UserResponse(
  json['profile_photo'] as String,
  json['fullname'] as String,
  json['username'] as String,
  json['joined'] as String,
  (json['movies_watched'] as num).toInt(),
  (json['average_rating'] as num).toDouble(),
  json['favorite_genre'] as String,
);

Map<String, dynamic> _$UserResponseToJson(UserResponse instance) =>
    <String, dynamic>{
      'profile_photo': instance.profilePhoto,
      'fullname': instance.fullName,
      'username': instance.userName,
      'joined': instance.joined,
      'movies_watched': instance.moviesWatched,
      'average_rating': instance.averageRating,
      'favorite_genre': instance.favoriteGenre,
    };
