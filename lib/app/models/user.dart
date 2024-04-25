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

  User.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    id = json['id'];
    lastname = json['lastname'];
    name = json['name'];
    profilePictureUrl = json['profilePictureUrl'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['email'] = email;
    data['id'] = id;
    data['lastname'] = lastname;
    data['name'] = name;
    data['profilePictureUrl'] = profilePictureUrl;
    return data;
  }
}
