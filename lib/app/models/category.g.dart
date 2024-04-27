// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      title: json['title'] as String?,
      key: json['key'] as String?,
      url: json['url'] as String?,
      type: $enumDecodeNullable(_$CategoryTypeEnumMap, json['type']),
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'title': instance.title,
      'key': instance.key,
      'url': instance.url,
      'type': _$CategoryTypeEnumMap[instance.type],
      'image': instance.image,
    };

const _$CategoryTypeEnumMap = {
  CategoryType.talentees: 'talentees',
  CategoryType.challenges: 'challenges',
  CategoryType.companies: 'companies',
};
