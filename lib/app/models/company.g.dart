// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      city: json['city'] as String?,
      description: json['description'] as String?,
      logo: json['logo'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'city': instance.city,
      'description': instance.description,
      'logo': instance.logo,
      'name': instance.name,
    };
