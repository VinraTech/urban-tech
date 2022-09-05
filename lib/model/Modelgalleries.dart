// To parse this JSON data, do
//
//     final gallery = galleryFromJson(jsonString);

import 'dart:convert';

Gallery galleryFromJson(String str) => Gallery.fromJson(json.decode(str));

String galleryToJson(Gallery data) => json.encode(data.toJson());

class Gallery {
  Gallery({
    required this.gallory,
  });

  List<Gallory> gallory;

  factory Gallery.fromJson(Map<String, dynamic> json) => Gallery(
        gallory:
            List<Gallory>.from(json["gallory"].map((x) => Gallory.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "gallory": List<dynamic>.from(gallory.map((x) => x.toJson())),
      };
}

class Gallory {
  Gallory({
    required this.id,
    required this.image,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String image;

  DateTime createdAt;
  DateTime updatedAt;

  factory Gallory.fromJson(Map<String, dynamic> json) => Gallory(
        id: json["id"],
        image: json["image"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
