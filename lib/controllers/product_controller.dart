import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_original/models/product.dart';
import 'package:qr_original/views/qr_generator_view.dart';
Future<Product> getProductDetails(String productId) async {
  try {
    DocumentSnapshot snapshot = await FirebaseFirestore.instance
        .collection('productos')
        .doc(productId)
        .get();
    if (snapshot.exists) {
      return Product(
        id: snapshot.id,
        name: snapshot['name'],
        price: snapshot['price'],
        createdAt: DateTime.parse(snapshot['createdAt']),
        expiredAt: DateTime.parse(snapshot['expiredAt']),
        description: snapshot['description'],
        isReported: snapshot['isReported'],
        companyName: snapshot['companyName'],
      );
    } else {
      throw Exception('No se encontró el producto en la base de datos');
    }
  } catch (e) {
    throw Exception('No se encontró el producto en la base de datos');
  }
}

void showProductQrCode(BuildContext context, String productId) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return QRCodePopup(
        data: productId,
      );
    },
  );
}

void reportProduct(Product product) {
  print(product.id);
  DocumentReference productRef =
      FirebaseFirestore.instance.collection('productos').doc(product.id);

  productRef.update({
    'isReported': true,
  }).then((_) {
    print('Producto actualizado correctamente');
  }).catchError((error) {
    throw Exception('Error al actualizar el producto: $error');
  });
}

void updateProduct(Product product) {
  // Obtén una referencia al documento del producto en Firestore
  DocumentReference productRef =
      FirebaseFirestore.instance.collection('productos').doc(product.id);

  // Actualiza los campos del producto en Firestore
  productRef.update({
    'name': product.name,
    'price': product.price,
    'description': product.description,
    'isReported': product.isReported,
    'expiredAt': product.expiredAt.toIso8601String(),
    'createdAt': product.createdAt.toIso8601String(),
  }).then((_) {
    print('Producto actualizado correctamente');
  }).catchError((error) {
    print('Error al actualizar el producto: $error');
  });
}
