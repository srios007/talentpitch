import 'package:json_annotation/json_annotation.dart';
part 'category.g.dart';

@JsonSerializable()
class Category {
  String? title;
  String? key;
  String? url;
  String? type;
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
}
