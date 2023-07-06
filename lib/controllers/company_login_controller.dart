// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:qr_original/views/company_login_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:qr_original/controllers/company_auxiliar_controller.dart';
import 'package:qr_original/models/company.dart';
import 'package:qr_original/views/company_view.dart';
import 'package:qr_original/controllers/alert_dialog.dart';
import 'package:qr_original/views/alert.dart';

class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  void signInWithEmailAndPassword(String email, String password) async {
    try {
      final FirebaseAuth auth = FirebaseAuth.instance;
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      // Extrayendo la información de la compañía autenticada desde la base de datos
      User? user = userCredential.user;
      String userId = user!.uid;
      CompanyController companyController = CompanyController();
      Company company = await companyController.getCompanyDetails(userId);
      // Navegando a la vista de compañias
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CompanyView(company: company)));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showPersonalizateAlert(
            context, 'Usuario no encontrado', AlertMessageType.Warning);
      } else if (e.code == 'wrong-password') {
        showPersonalizateAlert(
            context, 'Contraseña incorrecta', AlertMessageType.Warning);
      }
    }
  }

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    // Validando que el email y la contraseña no estén vacíos
    if (email.isEmpty || password.isEmpty) {
      showPersonalizateAlert(context, 'Por favor ingrese su email y contraseña',
          AlertMessageType.Error);
      return;
    }

    signInWithEmailAndPassword(email, password);
  }

  @override
  Widget build(BuildContext context) {
    return LoginView(
      emailController: _emailController,
      passwordController: _passwordController,
      isEmailValid: _isEmailValid,
      isPasswordValid: _isPasswordValid,
      loginPressed: _login,
    );
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
