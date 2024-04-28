// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'challenge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Challenge _$ChallengeFromJson(Map<String, dynamic> json) => Challenge(
      companyLogo: json['company_logo'] as String?,
      companyName: json['company_name'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      name: json['name'] as String?,
      requirements: json['requirements'] as String?,
      salary: json['salary'] as String?,
      video: json['video'] as String?,
    );

Map<String, dynamic> _$ChallengeToJson(Challenge instance) => <String, dynamic>{
      'company_logo': instance.companyLogo,
      'company_name': instance.companyName,
      'description': instance.description,
      'image': instance.image,
      'name': instance.name,
      'requirements': instance.requirements,
      'salary': instance.salary,
      'video': instance.video,
    };
