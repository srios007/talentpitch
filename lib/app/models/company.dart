import 'package:json_annotation/json_annotation.dart';
part 'company.g.dart';

@JsonSerializable()
class Company {
  String? city;
  String? description;
  String? logo;
  String? name;
  String? video;

  Company({
    this.city,
    this.description,
    this.logo,
    this.name,
    this.video,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);

  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}
