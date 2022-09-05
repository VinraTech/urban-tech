// To parse this JSON data, do
//
//     final profile = profileFromJson(jsonString);

import 'dart:convert';

Profile profileFromJson(String str) => Profile.fromJson(json.decode(str));

String profileToJson(Profile data) => json.encode(data.toJson());

class Profile {
  Profile({
    required this.user,
  });

  User user;

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
        user: User.fromJson(json["user"]),
      );

  Map<String, dynamic> toJson() => {
        "user": user.toJson(),
      };
}

class User {
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNo,
    required this.type,
    required this.address,
    required this.userOtp,
    required this.otpStatus,
    required this.emailVerifiedAt,
  });

  int? id;
  String? name;
  String email;
  String? phoneNo;
  String? type;
  dynamic? address;
  int? userOtp;
  int? otpStatus;
  dynamic? emailVerifiedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phoneNo: json["phone_no"],
        type: json["type"],
        address: json["address"],
        userOtp: json["user_otp"],
        otpStatus: json["otp_status"],
        emailVerifiedAt: json["email_verified_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "phone_no": phoneNo,
        "type": type,
        "address": address,
        "user_otp": userOtp,
        "otp_status": otpStatus,
        "email_verified_at": emailVerifiedAt,
      };
}
