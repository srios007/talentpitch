import 'package:json_annotation/json_annotation.dart';
part 'challenge.g.dart';

@JsonSerializable()
class Challenge {
  @JsonKey(name: 'company_logo')
  String? companyLogo;
  @JsonKey(name: 'company_name')
  String? companyName;
  String? description;
  String? image;
  String? name;
  String? requirements;
  String? salary;
  String? video;

  Challenge({
    this.companyLogo,
    this.companyName,
    this.description,
    this.image,
    this.name,
    this.requirements,
    this.salary,
    this.video,
  });
  
  factory Challenge.fromJson(Map<String, dynamic> json) =>
      _$ChallengeFromJson(json);

  Map<String, dynamic> toJson() => _$ChallengeToJson(this);
}
