import 'dart:convert';

Product productFromJson(String str) => Product.fromJson(json.decode(str));

String productToJson(Product product) => json.encode(product.toJson());

class Product {
  Product({
    required this.name,
    required this.image,
    required this.items,
    this.isFavourite = false,
    this.price = 50,
  });

  String name;
  String image;
  List<String> items;
  bool isFavourite;
  int price;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        name: json["name"],
        image: json["image"],
        items: List<String>.from(json["items"].map((x) => x)),
        isFavourite: json["isFavourite"],
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "items": List<dynamic>.from(items.map((x) => x)),
        "isFavourite": isFavourite,
        "price": price,
      };
}

List<Product> candles = [
  Product(
    name: 'Noom Candle Holders',
    image: 'assets/images/noom-candle-holder.jpeg',
    items: [
      'assets/images/noom-candle-holder.jpeg',
      'assets/images/noom-candle-holder2.jpg',
    ],
  ),
  Product(
    name: 'Noom Gabo Vase',
    image: 'assets/images/noom-gabo-vase-2.jpg',
    items: [
      'assets/images/noom-gabo-vase-3.jpg',
      'assets/images/noom-gabo-vase-2.jpg',
    ],
    isFavourite: true,
  ),
];
List<Product> chairs = [
  Product(
    name: 'Luxury Furniture Chair',
    image: 'assets/images/furniture-chair.jpeg',
    items: [
      'assets/images/furniture-chair-2.jpeg',
      'assets/images/furniture-chair.jpeg',
    ],
  ),
  Product(
    name: 'Luxury King\'s Chair',
    image: 'assets/images/luxury-king-chair.jpeg',
    items: [
      'assets/images/luxury-king-chair.jpeg',
      'assets/images/luxury-king-chair-3.jpeg',
    ],
    isFavourite: true,
  ),
];

List<Product> decors = [
  Product(
    name: 'Classic Interior Decor',
    image: 'assets/images/decor-2.jpeg',
    items: [
      'assets/images/decor-2.jpeg',
      'assets/images/decor-3.jpeg',
      'assets/images/decor.jpeg',
      'assets/images/decor-4.jpeg',
    ],
    isFavourite: true,
  ),
  Product(
    name: 'Party Firstclass Decor',
    image: 'assets/images/party-decor.jpeg',
    items: [
      'assets/images/party-decor.jpeg',
      'assets/images/party-decor.jpg',
    ],
  ),
];
