import 'dart:convert';

class UserLocationModel {
  final String street;
  final String city;
  final String state;
  final String country;
  final String timezone;
  UserLocationModel({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.timezone,
  });

  UserLocationModel copyWith({
    String? street,
    String? city,
    String? state,
    String? country,
    String? timezone,
  }) {
    return UserLocationModel(
      street: street ?? this.street,
      city: city ?? this.city,
      state: state ?? this.state,
      country: country ?? this.country,
      timezone: timezone ?? this.timezone,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'street': street,
      'city': city,
      'state': state,
      'country': country,
      'timezone': timezone,
    };
  }

  factory UserLocationModel.fromMap(Map<String, dynamic> map) {
    return UserLocationModel(
      street: map['street'] as String,
      city: map['city'] as String,
      state: map['state'] as String,
      country: map['country'] as String,
      timezone: map['timezone'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserLocationModel.fromJson(String source) =>
      UserLocationModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Location(street: $street, city: $city, state: $state, country: $country, timezone: $timezone)';
  }

  @override
  bool operator ==(covariant UserLocationModel other) {
    if (identical(this, other)) return true;

    return other.street == street &&
        other.city == city &&
        other.state == state &&
        other.country == country &&
        other.timezone == timezone;
  }

  @override
  int get hashCode {
    return street.hashCode ^
        city.hashCode ^
        state.hashCode ^
        country.hashCode ^
        timezone.hashCode;
  }
}
