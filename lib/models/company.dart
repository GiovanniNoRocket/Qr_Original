// company.dart

class Company {
  final String id;
  final String name;
  final String nit;
  final String domain;
  final String email;
  final String phone;

  Company({
    required this.id,
    required this.name,
    required this.nit,
    required this.domain,
    required this.email,
    required this.phone,
  });

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      id: json['id'],
      name: json['name'],
      nit: json['nit'],
      domain: json['domain'],
      email: json['email'],
      phone: json['phone'],
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
    'nit': nit,
    'domain': domain,
    'email': email,
    'phone': phone,
  };
}
