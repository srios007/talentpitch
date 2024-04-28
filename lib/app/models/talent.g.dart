// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'talent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Talent _$TalentFromJson(Map<String, dynamic> json) => Talent(
      about: json['about'] as String?,
      avatar: json['avatar'] as String?,
      career: json['career'] as String?,
      city: json['city'] as String?,
      desiredRole: json['desired_role'] as String?,
      email: json['email'] as String?,
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      videoUrl: json['video_url'] as String?,
    );

Map<String, dynamic> _$TalentToJson(Talent instance) => <String, dynamic>{
      'about': instance.about,
      'avatar': instance.avatar,
      'career': instance.career,
      'city': instance.city,
      'desired_role': instance.desiredRole,
      'email': instance.email,
      'id': instance.id,
      'name': instance.name,
      'video_url': instance.videoUrl,
    };
