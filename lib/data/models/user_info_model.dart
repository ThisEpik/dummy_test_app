import 'dart:convert';

import 'package:dummy_app/data/models/user_location_model.dart';

class UserInfoModel {
  final String id;
  final String title;
  final String firstName;
  final String lastName;
  final String picture;
  final String gender;
  final String email;
  final String dateOfBirth;
  final String phone;
  final UserLocationModel location;
  final String registerDate;
  final String updatedDate;

  UserInfoModel({
    required this.id,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.picture,
    required this.gender,
    required this.email,
    required this.dateOfBirth,
    required this.phone,
    required this.location,
    required this.registerDate,
    required this.updatedDate,
  });

  UserInfoModel copyWith({
    String? id,
    String? title,
    String? firstName,
    String? lastName,
    String? picture,
    String? gender,
    String? email,
    String? dateOfBirth,
    String? phone,
    UserLocationModel? location,
    String? registerDate,
    String? updatedDate,
  }) {
    return UserInfoModel(
      id: id ?? this.id,
      title: title ?? this.title,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      picture: picture ?? this.picture,
      gender: gender ?? this.gender,
      email: email ?? this.email,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      phone: phone ?? this.phone,
      location: location ?? this.location,
      registerDate: registerDate ?? this.registerDate,
      updatedDate: updatedDate ?? this.updatedDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
      'gender': gender,
      'email': email,
      'dateOfBirth': dateOfBirth,
      'phone': phone,
      'location': location.toMap(),
      'registerDate': registerDate,
      'updatedDate': updatedDate,
    };
  }

  factory UserInfoModel.fromMap(Map<String, dynamic> map) {
    return UserInfoModel(
      id: map['id'] as String,
      title: map['title'] as String,
      firstName: map['firstName'] as String,
      lastName: map['lastName'] as String,
      picture: map['picture'] as String,
      gender: map['gender'] as String,
      email: map['email'] as String,
      dateOfBirth: map['dateOfBirth'] as String,
      phone: map['phone'] as String,
      location:
          UserLocationModel.fromMap(map['location'] as Map<String, dynamic>),
      registerDate: map['registerDate'] as String,
      updatedDate: map['updatedDate'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserInfoModel.fromJson(String source) =>
      UserInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'UserInfoModel(id: $id, title: $title, firstName: $firstName, lastName: $lastName, picture: $picture, gender: $gender, email: $email, dateOfBirth: $dateOfBirth, phone: $phone, location: $location, registerDate: $registerDate, updatedDate: $updatedDate)';
  }

  @override
  bool operator ==(covariant UserInfoModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.firstName == firstName &&
        other.lastName == lastName &&
        other.picture == picture &&
        other.gender == gender &&
        other.email == email &&
        other.dateOfBirth == dateOfBirth &&
        other.phone == phone &&
        other.location == location &&
        other.registerDate == registerDate &&
        other.updatedDate == updatedDate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        firstName.hashCode ^
        lastName.hashCode ^
        picture.hashCode ^
        gender.hashCode ^
        email.hashCode ^
        dateOfBirth.hashCode ^
        phone.hashCode ^
        location.hashCode ^
        registerDate.hashCode ^
        updatedDate.hashCode;
  }
}
