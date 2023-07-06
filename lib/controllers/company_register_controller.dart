import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:qr_original/models/company.dart';
import 'package:qr_original/views/alert.dart';
import 'package:qr_original/views/company_register_view.dart';
import 'package:qr_original/controllers/company_auxiliar_controller.dart';
import 'package:qr_original/controllers/alert_dialog.dart';

class RegisterController extends StatefulWidget {
  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _nitController = TextEditingController();
  final TextEditingController _dominioController = TextEditingController();
  final TextEditingController _direccionController = TextEditingController();
  final TextEditingController _telefonoController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordConfController = TextEditingController();

  final bool _isEmailValid = true;
  final bool _isPasswordValid = true;
  final bool _isPasswordConfValid = true;

  @override
  void dispose() {
    _nombreController.dispose();
    _nitController.dispose();
    _dominioController.dispose();
    _direccionController.dispose();
    _telefonoController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _passwordConfController.dispose();
    super.dispose();
  }

  void _register() async {
    try {
      String empresa = _nombreController.text;
      String nit = _nitController.text;
      String dominio = _dominioController.text;
      String direccion = _direccionController.text;
      String telefono = _telefonoController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String passwordConf = _passwordConfController.text;
      if (empresa.isEmpty ||
          nit.isEmpty ||
          dominio.isEmpty ||
          direccion.isEmpty ||
          telefono.isEmpty ||
          email.isEmpty ||
          password.isEmpty ||
          passwordConf.isEmpty) {
        showPersonalizateAlert(
          context,
          'Por favor, complete todos los campos',
          AlertMessageType.Warning,
        );
      } else {
        // Validar los campos y realizar el registro si son válidos
        bool isEmailValid = AuthController.validateEmail(email);
        bool isPasswordValid =
            AuthController.validatePasswords(password, passwordConf);

        if (isEmailValid && isPasswordValid) {
          UserCredential userCredential =
              await FirebaseAuth.instance.createUserWithEmailAndPassword(
            email: email,
            password: password,
          );

          Company company = Company(
            id: userCredential.user!.uid,
            name: empresa,
            nit: nit,
            domain: dominio,
            email: email,
            phone: telefono,
          );

          String userId = userCredential.user!.uid;
          await FirebaseFirestore.instance
              .collection('empresas')
              .doc(userId)
              .set(company.toJson())
              .then((value) => {
                    Navigator.pop(context),
                    showPersonalizateAlert(
                      context,
                      'Registro exitoso',
                      AlertMessageType.Notification,
                    ),
                  });
        }
      }
    } catch (e) {
      showPersonalizateAlert(
        context,
        'Error al registrar la empresa $e',
        AlertMessageType.Error,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return RegisterView(
      nombreController: _nombreController,
      nitController: _nitController,
      dominioController: _dominioController,
      direccionController: _direccionController,
      telefonoController: _telefonoController,
      emailController: _emailController,
      passwordController: _passwordController,
      passwordConfController: _passwordConfController,
      isEmailValid: _isEmailValid,
      isPasswordValid: _isPasswordValid,
      isPasswordConfValid: _isPasswordConfValid,
      registerPressed: _register,
    );
  }
}
