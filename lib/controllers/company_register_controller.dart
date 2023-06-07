import 'package:flutter/material.dart';
import 'package:qr_original/views/company_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RegisterController extends StatefulWidget {
  @override
  _RegisterControllerState createState() => _RegisterControllerState();
}

class _RegisterControllerState extends State<RegisterController> {
  final TextEditingController _nombreController = new TextEditingController();
  final TextEditingController _nitController = new TextEditingController();
  final TextEditingController _dominioController = new TextEditingController();
  final TextEditingController _direccionController = new TextEditingController();
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

  void _register() async {
   /* try {
      String empresa = _nombreController.text;
      String nit = _nitController.text;
      String dominio = _dominioController.text;
      String direccion = _direccionController.text;
      String telefono = _telefonoController.text;
      String email = _emailController.text;
      String password = _passwordController.text;
      String passwordConf = _passwordConfController.text;

      if (empresa.isEmpty || nit.isEmpty ||
          dominio.isEmpty || direccion.isEmpty ||
          telefono.isEmpty || email.isEmpty ||
          password.isEmpty || passwordConf.isEmpty) {
        print('Por favor, complete todos los campos');
        return;
      }

      // Validar los campos y realizar el registro si son válidos
      bool isEmailValid = _validateEmail(email);
      bool isPasswordValid = _validatePassword(password);

      setState(() {
        _isEmailValid = isEmailValid;
        _isPasswordValid = isPasswordValid;
      });

      if (isEmailValid && isPasswordValid) {
        // Validar que las contraseñas coincidan
        if (password != passwordConf) {
          print('Las contraseñas no coinciden');
          return;
        }

        // Crear el usuario en Firebase Authentication
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password,
        );

        // Obtener el ID del usuario registrado
        String userId = userCredential.user!.uid;

        // Guardar los datos del usuario en Firestore
        await FirebaseFirestore.instance
            .collection('usuarios')
            .doc(userId)
            .set({
          'nombre': empresa,
          'nit': nit,
          'dominio': dominio,
          'direccion': direccion,
          'telefono': telefono,
          'email': email,
        });

        // Registro exitoso, redirigir al siguiente paso o mostrar mensaje de éxito
        print('Registro exitoso');
      }
    } catch (e) {
      // Mostrar mensaje de error o realizar acciones en caso de fallo en el registro
      print('Error en el registro: $e');
    }*/
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
