import 'dart:convert';

class UserModel {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;

  UserModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
  });

  static List<UserModel> getModelFromList(List list) {
    return list.map((e) => UserModel.fromMap(e)).toList();
  }

  UserModel copyWith({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
  }) {
    return UserModel(
      id: id ?? this.id,
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      picture: picture ?? this.picture,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      title: map['title'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      picture: map['picture'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserModel(id: $id, title: $title, firstName: $firstName, lastName: $lastName, picture: $picture)';
  }

  @override
  bool operator ==(covariant UserModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.picture == picture;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        picture.hashCode;
  }
}
