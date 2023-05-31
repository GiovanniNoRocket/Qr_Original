import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/product.dart';
import '../models/company.dart';

class ProductInfo extends StatelessWidget {
  final Product product;
  final List<Company> companies;

  ProductInfo({required this.product, required this.companies});

  @override
  Widget build(BuildContext context) {
    // Buscamos la empresa correspondiente al ID de la empresa del producto
    final company = companies.firstWhere((c) => c.id == product.idEmpresa);

    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            style: Theme.of(context).textTheme.headline6,
          ),
          SizedBox(height: 8.0),
          Text(
            'Precio: \$${product.price}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 8.0),
          Text(
            'Descripción:',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          Text(product.description),
          SizedBox(height: 8.0),
          Text(
            'Estado: ${product.status}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 8.0),
          Text(
            'Fecha de creación: ${DateFormat.yMMMd().format(product.createdAt)}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(height: 8.0),
          Text(
            'Empresa: ${company.name}',
            style: Theme.of(context).textTheme.subtitle1,
          ),
        ],
      ),
    );
  }
}
