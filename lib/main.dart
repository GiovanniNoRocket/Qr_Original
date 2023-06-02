import 'package:flutter/material.dart';
import 'package:qr_original/views/home_page.dart';
import 'package:qr_original/views/product_new.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My App',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color.fromARGB(255, 37, 43, 214),
      )),
      home: registrarProducto(),
    );
  }
}
