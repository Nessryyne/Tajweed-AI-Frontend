import 'package:equatable/equatable.dart';

class UserProfile extends Equatable {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String birthday;
  final String gender;
  final String bio;
  final String country;
  final String countryCode;
  final String nativeLanguage;
  final String nativeLanguageCode;
  final String phoneCountryCode;
  final String phoneNumber;

  const UserProfile({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.birthday,
    required this.gender,
    required this.bio,
    required this.country,
    required this.countryCode,
    required this.nativeLanguage,
    required this.nativeLanguageCode,
    required this.phoneCountryCode,
    required this.phoneNumber,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json['id'] as int,
    email: json['email'] as String,
    firstName: json['first_name'] as String,
    lastName: json['last_name'] as String,
    birthday: json['birthday'] as String,
    gender: json['gender'] as String,
    bio: json['bio'] as String,
    country: json['country'] as String,
    countryCode: json['country_code'] as String,
    nativeLanguage: json['native_language'] as String,
    nativeLanguageCode: json['native_language_code'] as String,
    phoneCountryCode: json['phone_country_code'] as String,
    phoneNumber: json['phone_number'] as String,
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'email': email,
    'first_name': firstName,
    'last_name': lastName,
    'birthday': birthday,
    'gender': gender,
    'bio': bio,
    'country': country,
    'country_code': countryCode,
    'native_language': nativeLanguage,
    'native_language_code': nativeLanguageCode,
    'phone_country_code': phoneCountryCode,
    'phone_number': phoneNumber,
  };

  UserProfile copyWith({
    int? id,
    String? email,
    String? firstName,
    String? lastName,
    String? birthday,
    String? gender,
    String? bio,
    String? country,
    String? countryCode,
    String? nativeLanguage,
    String? nativeLanguageCode,
    String? phoneCountryCode,
    String? phoneNumber,
  }) => UserProfile(
    id: id ?? this.id,
    email: email ?? this.email,
    firstName: firstName ?? this.firstName,
    lastName: lastName ?? this.lastName,
    birthday: birthday ?? this.birthday,
    gender: gender ?? this.gender,
    bio: bio ?? this.bio,
    country: country ?? this.country,
    countryCode: countryCode ?? this.countryCode,
    nativeLanguage: nativeLanguage ?? this.nativeLanguage,
    nativeLanguageCode: nativeLanguageCode ?? this.nativeLanguageCode,
    phoneCountryCode: phoneCountryCode ?? this.phoneCountryCode,
    phoneNumber: phoneNumber ?? this.phoneNumber,
  );

  factory UserProfile.empty() => const UserProfile(
    id: 0,
    email: '',
    firstName: '',
    lastName: '',
    birthday: '',
    gender: '',
    bio: '',
    country: '',
    countryCode: '',
    nativeLanguage: '',
    nativeLanguageCode: '',
    phoneCountryCode: '',
    phoneNumber: '',
  );

  @override
  List<Object?> get props => [
    id,
    email,
    firstName,
    lastName,
    birthday,
    gender,
    bio,
    country,
    countryCode,
    nativeLanguage,
    nativeLanguageCode,
    phoneCountryCode,
    phoneNumber,
  ];
}

class ProfileModelResponse extends Equatable {
  final UserProfile? data;
  final String? message;
  final bool success;

  const ProfileModelResponse({this.data, this.message, required this.success});

  factory ProfileModelResponse.fromJson(Map<String, dynamic> json) =>
      ProfileModelResponse(
        data: json['data'] != null ? UserProfile.fromJson(json['data']) : null,
        message: json['message'] as String?,
        success: json['success'] as bool,
      );

  Map<String, dynamic> toJson() => {
    'data': data?.toJson(),
    'message': message,
    'success': success,
  };

  @override
  List<Object?> get props => [data, message, success];
}
