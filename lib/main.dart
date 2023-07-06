import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:qr_original/views/home_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Qr Original',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Color.fromARGB(255, 37, 43, 214),
      )),
      home: HomeScreen(),
    );
  }
}
