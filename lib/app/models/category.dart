import 'package:json_annotation/json_annotation.dart';
import 'package:talentpitch/app/utils/utils.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  String? title;
  String? key;
  String? url;
  CategoryType? type;
  String? image;

  Category({
    this.title,
    this.key,
    this.url,
    this.type,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryToJson(this);

  String translateCategory( ) {
    switch (type) {
      case CategoryType.talentees:
        return 'Talentos';
      case CategoryType.challenges:
        return 'Retos';
      case CategoryType.companies:
        return 'Empresas';
      default:
        return '';
    }
  }
}
