// To parse this JSON data, do
//
//     final moodEntry = moodEntryFromJson(jsonString);

import 'dart:convert';

List<FoodEntry> foodEntryFromJson(String str) => List<FoodEntry>.from(json.decode(str).map((x) => FoodEntry.fromJson(x)));

String foodEntryToJson(List<FoodEntry> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));
  
class FoodEntry {
    String model;
    String pk;
    Fields fields;

    FoodEntry({
        required this.model,
        required this.pk,
        required this.fields,
    });

    factory FoodEntry.fromJson(Map<String, dynamic> json) => FoodEntry(
        model: json["model"],
        pk: json["pk"],
        fields: Fields.fromJson(json["fields"]),
    );

    Map<String, dynamic> toJson() => {
        "model": model,
        "pk": pk,
        "fields": fields.toJson(),
    };
}

class Fields {
    int user;
    String name;
    String description;
    int price;

    Fields({
        required this.user,
        required this.name,
        required this.description,
        required this.price,
    });

    factory Fields.fromJson(Map<String, dynamic> json) => Fields(
        user: json["user"],
        name: json["name"],
        description: json["description"],
        price: json["price"],
    );

    Map<String, dynamic> toJson() => {
        "user": user,
        "name": name,
        "description": description,
        "price": price,
    };
}
