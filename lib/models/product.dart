// product.dart

class Product {
  final String id;
  final String name;
  final double price;
  final DateTime createdAt;
  final DateTime expiredAt;
  final String description;
  final bool isReported;
  final String companyName;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.expiredAt,
    required this.description,
    required this.isReported,
    required this.companyName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      createdAt: DateTime.parse(json['createdAt']),
      expiredAt: DateTime.parse(json['expiredAt']),
      description: json['description'],
      isReported: json['isReported'],
      companyName: json['companyName'],
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'createdAt': createdAt.toIso8601String(),
        'expiredAt': expiredAt.toIso8601String(),
        'description': description,
        'isReported': isReported,
        'companyName': companyName,
      };
}
