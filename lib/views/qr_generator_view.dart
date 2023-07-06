import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodePopup extends StatelessWidget {
  final String data;

  const QRCodePopup({required this.data});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('QR Code'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 200.0,
              height: 200.0,
              child: QrImageView(
                data: data,
                version: QrVersions.auto,
              ),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () async {
            Navigator.of(context).pop();
          },
          child: Text('Guardar'),
        ),
      ],
    );
  }
}
