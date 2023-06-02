import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_original/models/product.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: Color.fromARGB(255, 37, 43, 214),
        ),
      ),
      home: ProductDetailsScreen(
        Product(
          id: '1',
          name: 'Producto 1',
          price: 100,
          description: 'Descripción del producto 1',
          isReported: false,
          companyName: 'Empresa 1',
          createdAt: DateTime.now(),
          expiredAt: DateTime.now().add(Duration(days: 30)),
        ),
      ),
    );
  }
}

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product_details';

  final Product product;

  ProductDetailsScreen(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: Text(
                'Nombre del Producto',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                product.name,
                style: TextStyle(fontSize: 16),
              ),
            ),
            SizedBox(height: 200),
            Center(
              child: Text(
                'Descripción',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                product.description,
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Estado',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                product.isReported ? 'Reportado' : 'Vigente',
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Empresa Fabricante',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                product.companyName,
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Fecha de Fabricación',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                DateFormat('dd/MM/yyyy').format(product.createdAt),
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Fecha de Vencimiento',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Center(
              child: Text(
                DateFormat('dd/MM/yyyy').format(product.expiredAt),
                style: TextStyle(fontSize: 14),
              ),
            ),
            SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Lógica para reportar el producto
              },
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text(
                  'Reportar Producto',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              style: ElevatedButton.styleFrom(
                primary: Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
