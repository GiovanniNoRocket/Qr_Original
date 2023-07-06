import 'package:flutter/material.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_original/views/qr_scanner_view.dart';

class QRScanScreenController extends StatefulWidget {
  const QRScanScreenController({super.key});

  @override
  _QRScanScreenControllerState createState() => _QRScanScreenControllerState();
}

class _QRScanScreenControllerState extends State<QRScanScreenController> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController? controller;
  Barcode? result;

  @override
  Widget build(BuildContext context) {
    return QRScanScreenView(
      qrKey: qrKey,
      onQRViewCreated: _onQRViewCreated,
      result: result,
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      controller.stopCamera();
      Navigator.pop(
        context,
        result!.code,
      ); // Regresar a la pantalla anterior y pasar el resultado del escaneo
    });
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}
