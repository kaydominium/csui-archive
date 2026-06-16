import 'dart:convert';

List<ProductEntry> productEntryFromJson(String str) => List<ProductEntry>.from(
  json.decode(str).map((x) => ProductEntry.fromJson(x)),
);

String productEntryToJson(List<ProductEntry> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductEntry {
  String id;
  int user;
  String username;
  String name;
  int price;
  String description;
  String category;
  String thumbnail;
  bool isFeatured;

  ProductEntry({
    required this.id,
    required this.user,
    required this.username,
    required this.name,
    required this.price,
    required this.description,
    required this.category,
    required this.thumbnail,
    required this.isFeatured,
  });

  factory ProductEntry.fromJson(Map<String, dynamic> json) => ProductEntry(
    id: json["id"],
    user: json["user"],
    username: json["username"],
    name: json["name"],
    price: json["price"],
    description: json["description"],
    category: json["category"],
    thumbnail: json["thumbnail"],
    isFeatured: json["is_featured"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user": user,
    "username": username,
    "name": name,
    "price": price,
    "description": description,
    "category": category,
    "thumbnail": thumbnail,
    "is_featured": isFeatured,
  };
}
