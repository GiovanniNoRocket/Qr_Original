import 'package:flutter/material.dart';
import 'package:qr_original/models/product.dart';
import 'package:qr_original/controllers/product_controller.dart';
import 'package:qr_original/controllers/alert_dialog.dart';
import 'package:qr_original/views/alert.dart';

class ProductDetailsScreen extends StatelessWidget {
  final Product producto;

  ProductDetailsScreen({
    required this.producto,
  });

  @override
  Widget build(BuildContext context) {
    if (producto.isReported) {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        showPersonalizateAlert(
          context,
          'Este producto ha sido reportado. ¡Cuidado!',
          AlertMessageType.Warning,
        );
      });
    } else {
      WidgetsBinding.instance?.addPostFrameCallback((_) {
        showPersonalizateAlert(
          context,
          'Este producto no ha sido reportado.',
          AlertMessageType.Success,
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        title: Text('Detalles del Producto'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                producto.name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 32),
            Row(
              children: [
                Icon(Icons.attach_money),
                SizedBox(width: 8),
                Text(
                  'Precio: \$${producto.price.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text(
                  'Fecha de creación: ${formatDate(producto.createdAt)}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.calendar_today),
                SizedBox(width: 8),
                Text(
                  'Fecha de expiración: ${formatDate(producto.expiredAt)}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.description),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Descripción: ${producto.description}',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.report),
                SizedBox(width: 8),
                Text(
                  'Reportado: ${producto.isReported ? 'Sí' : 'No'}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.business),
                SizedBox(width: 8),
                Text(
                  'Empresa: ${producto.companyName}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Spacer(),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton.icon(
                onPressed: () {
                  reportProduct(producto);
                },
                icon: Icon(Icons.report, size: 25),
                label:
                    Text('Reportar Producto', style: TextStyle(fontSize: 18)),
                style: ElevatedButton.styleFrom(
                  primary: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String formatDate(DateTime date) {
    return '${date.year}-${_formatTwoDigits(date.month)}-${_formatTwoDigits(date.day)}';
  }

  String _formatTwoDigits(int value) {
    return value.toString().padLeft(2, '0');
  }
}
