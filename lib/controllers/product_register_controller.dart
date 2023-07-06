import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:qr_original/models/product.dart';
import 'package:qr_original/views/product_register_view.dart';
import 'package:qr_original/controllers/product_controller.dart';
import 'package:qr_original/models/company.dart';
import 'package:qr_original/controllers/alert_dialog.dart';
import 'package:qr_original/views/alert.dart';

class ProductRegisterController extends StatefulWidget {
  final Company company;
  ProductRegisterController({required this.company});
  @override
  _ProductRegisterControllerState createState() =>
      _ProductRegisterControllerState();
}

class _ProductRegisterControllerState extends State<ProductRegisterController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController expiredAtController = TextEditingController();
  final TextEditingController createdAtController = TextEditingController();

  String generateProductId() {
    var uuid = Uuid();
    return uuid.v4();
  }

  @override
  void initState() {
    super.initState();
    companyNameController.text = widget.company.name;
  }

  void _register() async {
    try {
      String name = nameController.text;
      String priceText = priceController.text;
      String description = descriptionController.text;
      String companyName = companyNameController.text;
      String expiredAtText = expiredAtController.text;
      String createdAtText = createdAtController.text;
      bool isReported = false;

      if (name.isEmpty ||
          priceText.isEmpty ||
          description.isEmpty ||
          companyName.isEmpty ||
          expiredAtText.isEmpty ||
          createdAtText.isEmpty) {
        showPersonalizateAlert(context, 'Por favor, llene todos los campos',
            AlertMessageType.Warning);
        return;
      }

      String productId = generateProductId();

      Product product = Product(
          id: productId,
          name: name,
          price: double.parse(priceText),
          description: description,
          companyName: companyName,
          expiredAt: DateTime.parse(expiredAtText),
          createdAt: DateTime.parse(createdAtText),
          isReported: isReported);

      await FirebaseFirestore.instance
          .collection('productos')
          .doc(productId)
          .set(product.toJson())
          .then((value) => {
                showProductQrCode(context, productId),
                nameController.clear(),
                priceController.clear(),
                descriptionController.clear(),
                expiredAtController.clear(),
                createdAtController.clear(),
              })
          .catchError((error) => {
                showPersonalizateAlert(context,
                    'Error al registrar el producto', AlertMessageType.Error)
              });
    } catch (e) {
      showPersonalizateAlert(
          context, 'Error al registrar el producto', AlertMessageType.Error);
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    companyNameController.dispose();
    expiredAtController.dispose();
    createdAtController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProductRegisterView(
      nameController: nameController,
      priceController: priceController,
      descriptionController: descriptionController,
      companyNameController: companyNameController,
      expiredAtController: expiredAtController,
      createdAtController: createdAtController,
      registerPressed: _register,
      company: widget.company,
    );
  }
}
