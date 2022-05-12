import 'package:klik_daily/database/klik_daily_database.dart';

class FruitCart {
  int? id;
  String name;
  String image;
  int price;
  int ratting;

  FruitCart(
      {this.id,
      required this.name,
      required this.image,
      required this.price,
      required this.ratting});

  FruitCart copy({
    int? id,
    String? name,
    String? image,
    int? price,
    int? ratting,
  }) => FruitCart(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image ?? this.image,
        price: price ?? this.price,
        ratting: ratting ?? this.ratting,
      );

  static FruitCart fromJson(Map<String, Object?> json) => FruitCart(
    id: json[CartField.id] as int?,
    name: json[CartField.name] as String,
    image: json[CartField.image] as String,
    price: json[CartField.price] as int,
    ratting: json[CartField.rating] as int,
  );

  Map<String, Object?> toJson() => {
    CartField.id: id,
    CartField.name: name,
    CartField.image: image,
    CartField.price: price,
    CartField.rating: ratting
  };

}
