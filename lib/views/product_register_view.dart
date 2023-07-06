import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:qr_original/models/company.dart';

class ProductRegisterView extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController priceController;
  final TextEditingController descriptionController;
  final TextEditingController companyNameController;
  final TextEditingController expiredAtController;
  final TextEditingController createdAtController;
  final VoidCallback registerPressed;
  final Company company;

  //final bool _isReported = false;

  const ProductRegisterView({
    required this.nameController,
    required this.priceController,
    required this.descriptionController,
    required this.companyNameController,
    required this.expiredAtController,
    required this.createdAtController,
    required this.registerPressed,
    required this.company,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Registrar Producto'),
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          child: Column(children: [
            Expanded(
              child: ListView(children: [
                SizedBox(height: 20),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre del Producto',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.drive_file_rename_outline),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el nombre del producto';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: priceController,
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.monetization_on),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el precio del producto';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: 'Descripción',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.description),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese la descripción del producto';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller: companyNameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre de la Empresa',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.apartment),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese el nombre de la empresa';
                    }
                    return null;
                  },
                  readOnly: true,
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller:
                      createdAtController, //editing controller of this TextField
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.calendar_today), //icon of text field
                      labelText: "Fecha de fabricación", //label text of field
                      border: OutlineInputBorder()),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      createdAtController.text = formattedDate;
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
                SizedBox(height: 16.0),
                TextFormField(
                  controller:
                      expiredAtController, //editing controller of this TextField
                  decoration: InputDecoration(
                      prefixIcon:
                          Icon(Icons.calendar_today), //icon of text field
                      labelText: "Fecha de vencimiento", //label text of field
                      border: OutlineInputBorder()),
                  readOnly:
                      true, //set it true, so that user will not able to edit text
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2101));

                    if (pickedDate != null) {
                      print(
                          pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                      String formattedDate =
                          DateFormat('yyyy-MM-dd').format(pickedDate);
                      expiredAtController.text = formattedDate;
                    } else {
                      print("Date is not selected");
                    }
                  },
                ),
              ]),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton.icon(
                onPressed: () {
                  registerPressed();
                },
                icon: Icon(Icons.save),
                label: Text(
                  'Registrar Producto',
                  style: TextStyle(fontSize: 18),
                ),
                style: ElevatedButton.styleFrom(
                  onPrimary: Colors.white,
                  minimumSize: Size(double.infinity, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
