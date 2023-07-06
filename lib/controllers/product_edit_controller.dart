import 'package:flutter/material.dart';
import 'package:qr_original/models/product.dart';
import 'package:qr_original/views/product_edit_view.dart';
import 'package:qr_original/controllers/product_controller.dart';
import 'package:qr_original/controllers/alert_dialog.dart';
import 'package:qr_original/views/alert.dart';
import 'package:intl/intl.dart';

class ProductEditController extends StatefulWidget {
  final Product product;
  ProductEditController({required this.product});
  @override
  _ProductEditControllerState createState() => _ProductEditControllerState();
}

class _ProductEditControllerState extends State<ProductEditController> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController expiredAtController = TextEditingController();
  final TextEditingController createdAtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    nameController.text = widget.product.name;
    priceController.text = widget.product.price.toString();
    descriptionController.text = widget.product.description;
    companyNameController.text = widget.product.companyName;
    expiredAtController.text =
        DateFormat('yyyy-MM-dd').format(widget.product.expiredAt);
    createdAtController.text =
        DateFormat('yyyy-MM-dd').format(widget.product.createdAt);
  }

  void _update() async {
    try {
      String name = nameController.text;
      String priceText = priceController.text;
      String description = descriptionController.text;
      String companyName = companyNameController.text;
      String expiredAtText = expiredAtController.text;
      String createdAtText = createdAtController.text;

      //En caso de que un campo quede vacio no se actualiza
      name.isEmpty ? name = widget.product.name : name = nameController.text;
      priceText.isEmpty
          ? priceText = widget.product.price.toString()
          : priceText = priceController.text;
      description.isEmpty
          ? description = widget.product.description
          : description = descriptionController.text;
      companyName.isEmpty
          ? companyName = widget.product.companyName
          : companyName = companyNameController.text;
      expiredAtText.isEmpty
          ? expiredAtText = widget.product.expiredAt.toString()
          : expiredAtText = expiredAtController.text;
      createdAtText.isEmpty
          ? createdAtText = widget.product.createdAt.toString()
          : createdAtText = createdAtController.text;

      Product product = Product(
          id: widget.product.id,
          name: name,
          price: double.parse(priceText),
          description: description,
          companyName: companyName,
          expiredAt: DateTime.parse(expiredAtText),
          createdAt: DateTime.parse(createdAtText),
          isReported: widget.product.isReported);

      Navigator.pop(context);
      updateProduct(product);
      showPersonalizateAlert(context, 'Producto actualizado correctamente',
          AlertMessageType.Success);
    } catch (e) {
      showPersonalizateAlert(
          context, 'Error al actualizar el producto', AlertMessageType.Error);
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
    return EditarProductoScreen(
      nameController: nameController,
      priceController: priceController,
      descriptionController: descriptionController,
      companyNameController: companyNameController,
      expiredAtController: expiredAtController,
      createdAtController: createdAtController,
      actualizarPressed: _update,
    );
  }
}
