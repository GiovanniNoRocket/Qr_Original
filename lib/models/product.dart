// product.dart

class Product {
  final String id;
  final String name;
  final double price;
  final DateTime createdAt;
  final String description;
  final String status;
  final String idEmpresa;
  final String idQrInteger;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.createdAt,
    required this.description,
    required this.status,
    required this.idEmpresa,
    required this.idQrInteger,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      price: json['price'],
      createdAt: DateTime.parse(json['createdAt']),
      description: json['description'],
      status: json['status'],
      idEmpresa: json['idEmpresa'],
      idQrInteger: json['idQrInteger'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'price': price,
    'createdAt': createdAt.toIso8601String(),
    'description': description,
    'status': status,
    'idEmpresa': idEmpresa,
    'idQrInteger': idQrInteger,
  };
}
