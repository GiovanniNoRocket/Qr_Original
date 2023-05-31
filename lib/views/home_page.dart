import 'package:flutter/material.dart';
import 'package:qr_original/controllers/company_login_controller.dart';
import 'package:qr_original/controllers/qr_scan_screen_controller.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? qrResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Qr Original')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => QRScanScreenController()),
                );
              },
              icon: Icon(Icons.qr_code_scanner,
                  color: Color.fromARGB(255, 37, 43, 214)),
              iconSize: 200,
            ),
            SizedBox(height: 20),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => LoginController()),
                  );
                },
                child: Text('Iniciar Sesión'),
                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 37, 43, 214),
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                  textStyle:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                )),
            SizedBox(height: 60),
            Text(
              'Resultado del escaneo: ${qrResult ?? 'No se ha escaneado nada'}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
