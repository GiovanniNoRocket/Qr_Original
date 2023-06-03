import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRScanScreenView extends StatelessWidget {
  final GlobalKey qrKey;
  final Function(QRViewController) onQRViewCreated;
  final Barcode? result;

  QRScanScreenView({
    required this.qrKey,
    required this.onQRViewCreated,
    required this.result,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Qr Original'),
      ),
      body: Stack(
        children: [
          QRView(
            key: qrKey,
            onQRViewCreated: onQRViewCreated,
            overlay: QrScannerOverlayShape(
              borderRadius: 16, // Radio de las esquinas del área de lectura
              borderWidth: 10, // Ancho del borde del área de lectura
            ),
          ),
        ],
      ),
    );
  }
}
