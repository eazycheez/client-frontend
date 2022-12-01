// / To parse this JSON data, do
//
//     final order = orderFromJson(jsonString);

import 'dart:convert';

Order orderFromJson(String str) => Order.fromJson(json.decode(str));

String orderToJson(Order data) => json.encode(data.toJson());

class Order {
    Order({
        required this.items ,
        required this.deliveryAddress,
        required this.totalPrice,
        required this.status,
    });

    List<OrderItem> items;
    String deliveryAddress;
    int totalPrice;
    String status;

    factory Order.fromJson(Map<String, dynamic> json) => Order(
        items: List<OrderItem>.from(json["items"].map((x) => OrderItem.fromJson(x))),
        deliveryAddress: json["deliveryAddress"],
        totalPrice: json["totalPrice"],
        status: json["status"],
    );

    Map<String, dynamic> toJson() => {
        "items": List<dynamic>.from(items.map((x) => x.toJson())),
        "deliveryAddress": deliveryAddress,
        "totalPrice": totalPrice,
        "status": status,
    };
}

class OrderItem {
    OrderItem({
      required this.itemId,
      required  this.name,
      required  this.count,
      required  this.price,
    });

    String itemId;
    String name;
    int count;
    int price;

    factory OrderItem.fromJson(Map<String, dynamic> json) => OrderItem(
        itemId: json["itemID"],
        name: json["name"],
        count: json["count"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "itemID": itemId,
        "name": name,
        "count": count,
        "price": price,
    };
}