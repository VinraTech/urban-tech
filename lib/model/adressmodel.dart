// To parse this JSON data, do
//
//     final adresService = adresServiceFromJson(jsonString);

import 'dart:convert';

AdresService adresServiceFromJson(String str) =>
    AdresService.fromJson(json.decode(str));

String adresServiceToJson(AdresService data) => json.encode(data.toJson());

class AdresService {
  AdresService({
    required this.status,
    required this.address,
  });

  String status;
  Address address;

  factory AdresService.fromJson(Map<String, dynamic> json) => AdresService(
        status: json["status"],
        address: Address.fromJson(json["address"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "address": address.toJson(),
      };
}

class Address {
  Address({
    required this.customerId,
    required this.firstName,
    required this.lastName,
    required this.addressEmail,
    required this.addressPhone,
    required this.area,
    required this.companyName,
    required this.city,
    required this.state,
    required this.country,
    required this.pincode,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });

  String customerId;
  String? firstName;
  String? lastName;
  String? addressEmail;
  String? addressPhone;
  String area;
  dynamic companyName;
  String city;
  String state;
  String? country;
  String pincode;
  DateTime updatedAt;
  DateTime createdAt;
  int id;

  factory Address.fromJson(Map<String, dynamic> json) => Address(
        customerId: json["customer_id"],
        firstName: json["first_name"],
        lastName: json["last_name"],
        addressEmail: json["address_email"],
        addressPhone: json["address_phone"],
        area: json["area"],
        companyName: json["company_name"],
        city: json["city"],
        state: json["state"],
        country: json["country"],
        pincode: json["pincode"],
        updatedAt: DateTime.parse(json["updated_at"]),
        createdAt: DateTime.parse(json["created_at"]),
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "first_name": firstName,
        "last_name": lastName,
        "address_email": addressEmail,
        "address_phone": addressPhone,
        "area": area,
        "company_name": companyName,
        "city": city,
        "state": state,
        "country": country,
        "pincode": pincode,
        "updated_at": updatedAt.toIso8601String(),
        "created_at": createdAt.toIso8601String(),
        "id": id,
      };
}
