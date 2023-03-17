import 'package:flutter/foundation.dart';

class mainTypes{
  String name = '';
  String image = '';
  List<Items> items = [];

  mainTypes({required this.name, required this.image, required this.items});

  mainTypes.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    if (json['items'] != null) {
      json['items'].forEach((v) {
        items.add(new Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['image'] = this.image;
    if (this.items != null) {
      data['items'] = this.items.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String name = '';
  String weight = '';
  double? price;
  String image = '';
  String description = '';

  Items(
      {required this.id,
      required this.name,
      required this.weight,
      required this.price,
      required this.image,
      required this.description});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    weight = json['weight'];
    price = json['price'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['weight'] = this.weight;
    data['price'] = this.price;
    data['image'] = this.image;
    data['description'] = this.description;
    return data;
  }
}