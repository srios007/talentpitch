import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User {
  String? email;
  String? id;
  String? lastname;
  String? name;
  String? profilePictureUrl;

  User({
    this.email,
    this.id,
    this.lastname,
    this.name,
    this.profilePictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
// flutter pub run build_runner watch --delete-conflicting-outputs