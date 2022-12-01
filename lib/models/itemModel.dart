// To parse this JSON data, do
//
//     final item = itemFromJson(jsonString);

import 'dart:convert';

Item itemFromJson(String str) => Item.fromJson(json.decode(str));

String itemToJson(Item data) => json.encode(data.toJson());

class Item {
    Item({
        required this.category,
        required this.name,
        required this.price,
        required this.description,
        required this.unit,
    });

    String category;
    String name;
    int price;
    String description;
    String unit;

    factory Item.fromJson(Map<String, dynamic> json) => Item(
        category: json["category"],
        name: json["name"],
        price: json["price"],
        description: json["description"],
        unit: json["unit"],
    );

    Map<String, dynamic> toJson() => {
        "category": category,
        "name": name,
        "price": price,
        "description": description,
        "unit": unit,
    };
}
