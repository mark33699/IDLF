// To parse this JSON data, do
//
//     final store = storeFromJson(jsonString);

import 'dart:convert';

AngelAPI storeFromJson(String str) => AngelAPI.fromJson(json.decode(str));

String storeToJson(AngelAPI data) => json.encode(data.toJson());

class AngelAPI {
  AngelAPI({
    this.message,
    this.result,
    this.status,
  });

  String message;
  Store result;
  int status;

  factory AngelAPI.fromJson(Map<String, dynamic> json) => AngelAPI(
    message: json["message"],
    result: Store.fromJson(json["result"]),
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
    "result": result.toJson(),
    "status": status,
  };
}

class Store {
  Store({
    this.lineId,
    this.number,
    this.offDay,
    this.openTime,
    this.phone,
    this.products,
    this.storeType,
  });

  String lineId;
  String number;
  String offDay;
  String openTime;
  String phone;
  List<Product> products;
  String storeType;

  factory Store.fromJson(Map<String, dynamic> json) => Store(
    lineId: json["line_id"],
    number: json["number"],
    offDay: json["off_day"],
    openTime: json["open_time"],
    phone: json["phone"],
    products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
    storeType: json["store_type"],
  );

  Map<String, dynamic> toJson() => {
    "line_id": lineId,
    "number": number,
    "off_day": offDay,
    "open_time": openTime,
    "phone": phone,
    "products": List<dynamic>.from(products.map((x) => x.toJson())),
    "store_type": storeType,
  };
}

class Product {
  Product({
    this.id,
    this.imageUrl,
    this.price,
    this.title,
    this.unit,
  });

  int id;
  String imageUrl;
  int price;
  String title;
  String unit;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    imageUrl: json["image_url"],
    price: json["price"],
    title: json["title"],
    unit: json["unit"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "image_url": imageUrl,
    "price": price,
    "title": title,
    "unit": unit,
  };
}