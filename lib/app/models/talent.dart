import 'package:json_annotation/json_annotation.dart';
part 'talent.g.dart';

@JsonSerializable()
class Talent {
  String? about;
  String? avatar;
  String? career;
  String? city;
  @JsonKey(name: 'desired_role')
  String? desiredRole;
  String? email;
  int? id;
  String? name;
  @JsonKey(name: 'video_url')
  String? videoUrl;
  Talent({
    this.about,
    this.avatar,
    this.career,
    this.city,
    this.desiredRole,
    this.email,
    this.id,
    this.name,
    this.videoUrl,
  });
  factory Talent.fromJson(Map<String, dynamic> json) => _$TalentFromJson(json);

  Map<String, dynamic> toJson() => _$TalentToJson(this);
}
