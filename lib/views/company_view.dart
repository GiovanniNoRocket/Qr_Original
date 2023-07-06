import 'package:flutter/material.dart';
import 'package:qr_original/models/company.dart';
import 'package:qr_original/models/product.dart';
import 'package:qr_original/controllers/product_register_controller.dart';
import 'package:qr_original/controllers/product_edit_controller.dart';
import 'package:qr_original/controllers/qr_scan_screen_controller.dart';
import 'package:qr_original/controllers/alert_dialog.dart';
import 'package:qr_original/views/alert.dart';
import 'package:qr_original/controllers/product_controller.dart';

class CompanyView extends StatelessWidget {
  final Company company;
  const CompanyView({required this.company});

  void _searchProduct(String? result, BuildContext context) async {
    try {
      Product product = await getProductDetails(result.toString());

      //Mostrando los detalles del producto
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ProductEditController(product: product),
        ),
      );
    } catch (e) {
      showPersonalizateAlert(context, "Error $e", AlertMessageType.Error);
    }
  }

  @override
  Widget build(BuildContext context) {
    BuildContext currentcontext = context;
    return Scaffold(
      appBar: AppBar(
        title: Text('Company'),
        //title: Text(company.name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(children: [
              SizedBox(width: 8),
              Icon(Icons.business, size: 32),
              SizedBox(width: 4),
              Text(
                "Nit: ${company.nit}",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ]),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.link, size: 32),
                SizedBox(width: 4),
                Text(
                  "Dominio: ${company.domain}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.phone, size: 32),
                SizedBox(width: 4),
                Text(
                  "Telefono: ${company.phone}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                SizedBox(width: 8),
                Icon(Icons.email, size: 32),
                SizedBox(width: 4),
                Text(
                  "Email: ${company.email}",
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        height: 80,
        padding: EdgeInsets.only(top: 0, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
                flex: 1,
                child: IconButton(
                  icon: Icon(Icons.home, size: 60),
                  padding: EdgeInsets.all(0),
                  alignment: Alignment.center,
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                CompanyView(company: company)));
                  },
                )),
            SizedBox(width: 60),
            Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.add_box_rounded, size: 60),
                padding: EdgeInsets.all(0),
                alignment: Alignment.center,
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ProductRegisterController(company: company)));
                },
              ),
            ),
            SizedBox(width: 60),
            Flexible(
              flex: 1,
              child: IconButton(
                icon: Icon(Icons.mode_edit_sharp, size: 60),
                padding: EdgeInsets.all(0),
                alignment: Alignment.center,
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return StatefulBuilder(
                        builder: (BuildContext context, StateSetter setState) {
                          return AlertDialog(
                            title: Text('QR Scan'),
                            content: Text('Scan QR Code'),
                            actions: [
                              ElevatedButton(
                                onPressed: () async {
                                  Navigator.pop(context); // Cerrar el diálogo
                                  var otra = Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          QRScanScreenController(),
                                    ),
                                  ).then((result) {
                                    if (result != null) {
                                      try {
                                        _searchProduct(result, currentcontext);
                                      } catch (e) {
                                        showPersonalizateAlert(context,
                                            "Error $e", AlertMessageType.Error);
                                      }
                                    }
                                  });
                                },
                                child: Text('Scan QR Code'),
                              ),
                            ],
                          );
                        },
                      );
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
