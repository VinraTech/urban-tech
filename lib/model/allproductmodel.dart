// To parse this JSON data, do
//
//     final products = productsFromJson(jsonString);

import 'dart:convert';

Products productsFromJson(String str) => Products.fromJson(json.decode(str));

String productsToJson(Products data) => json.encode(data.toJson());

class Products {
  Products({
    required this.product,
  });

  List<Product> product;

  factory Products.fromJson(Map<String, dynamic> json) => Products(
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product(
      {required this.id,
      required this.name,
      required this.price,
      required this.image,
      required this.description,
      required this.metaDescription,
      required this.quentity,
      this.totalitemprice,
      required this.updatedAt,
      this.count});

  int id;
  String? name;
  String price;
  String? image;
  String description;
  String? metaDescription;
  String quentity;
  int? count;

  double? totalitemprice;

  DateTime updatedAt;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        name: json["name"],
        price: json["price"],
        image: json["image"],
        description: json["description"],
        metaDescription: json["meta_description"],
        quentity: json["quentity"],
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "price": price,
        "image": image,
        "description": description,
        "meta_description": metaDescription,
        "quentity": quentity,
        "updated_at": updatedAt.toIso8601String(),
      };

  Product copywith({
    int? id,
    String? name,
    String? price,
    String? image,
    String? description,
    String? metaDescription,
    String? quentity,
    int? count,
    double? totalitemprice,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Product(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        image: image ?? this.image,
        quentity: quentity ?? this.quentity,
        description: description ?? this.description,
        metaDescription: metaDescription ?? this.metaDescription,
        count: count ?? this.count,
        totalitemprice: totalitemprice ?? this.totalitemprice,
        updatedAt: updatedAt ?? this.updatedAt);
  }
}
