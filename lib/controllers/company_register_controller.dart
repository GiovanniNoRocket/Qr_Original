import 'package:flutter/material.dart';
import 'package:qr_original/views/company_register.dart';

class RegisterController extends StatefulWidget {
  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  final TextEditingController _nombreController = new TextEditingController();
  final TextEditingController _nitController = new TextEditingController();
  final TextEditingController _dominioController = new TextEditingController();
  final TextEditingController _direccionController =
      new TextEditingController();
  final TextEditingController _telefonoController = new TextEditingController();
  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passwordController = new TextEditingController();
  final TextEditingController _passwordConfController =
      new TextEditingController();

  //bool _isNitValid=true;
  //bool _isDireccionValid=true;
  //bool _isTelefonoValid=true;
  bool _isEmailValid = true;
  bool _isPasswordValid = true;
  bool _isPasswordConfValid = true;

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

  bool _validatePasswordConf(String passwordConf) {
    // Expresión regular para verificar la fortaleza de la contraseña
    // La contraseña debe contener al menos 8 caracteres, incluyendo al menos una letra mayúscula, una minúscula y un número.
    String passwordPattern = r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{8,}$';
    RegExp regex = RegExp(passwordPattern);
    return regex.hasMatch(passwordConf);
  }

  void _register() {
    String email = _emailController.text;
    String password = _passwordController.text;
    String passwordConf = _passwordConfController.text;

    bool isEmailValid = _validateEmail(email);
    bool isPasswordValid = _validatePassword(password);
    bool isPasswordConfValid = _validatePasswordConf(passwordConf);

    setState(() {
      _isEmailValid = isEmailValid;
      _isPasswordValid = isPasswordValid;
      _isPasswordConfValid = isPasswordConfValid;
    });

    if (isEmailValid && isPasswordValid && isPasswordConfValid) {
      // Realizar la lógica de inicio de sesión aquí
      print('Registro exitoso');
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
