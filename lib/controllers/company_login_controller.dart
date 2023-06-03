import 'package:flutter/material.dart';
import 'package:qr_original/views/company_login_view.dart';


class LoginController extends StatefulWidget {
  @override
  _LoginControllerState createState() => _LoginControllerState();
}

class _LoginControllerState extends State<LoginController> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _isEmailValid = true;
  bool _isPasswordValid = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool _validateEmail(String email) {
    // Expresión regular para verificar el formato del correo electrónico
    String emailPattern =
        r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$';
    RegExp regex = RegExp(emailPattern);
    return regex.hasMatch(email);
  }

  bool _validatePassword(String password) {
    // Expresión regular para verificar la fortaleza de la contraseña
    // La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una minúscula y un número.
    String passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(passwordPattern);
    return regex.hasMatch(password);
  }

  void _login() {
    String email = _emailController.text;
    String password = _passwordController.text;

    bool isEmailValid = _validateEmail(email);
    bool isPasswordValid = _validatePassword(password);

    setState(() {
      _isEmailValid = isEmailValid;
      _isPasswordValid = isPasswordValid;
    });

    if (isEmailValid && isPasswordValid) {
      // Realizar la lógica de inicio de sesión aquí
      print('Inicio de sesión exitoso');
    }
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
}
