import 'package:flutter/material.dart';

class RegisterView extends StatelessWidget {
  final TextEditingController nombreController;
  final TextEditingController nitController;
  final TextEditingController dominioController;
  final TextEditingController direccionController;
  final TextEditingController telefonoController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController passwordConfController;
  final bool isEmailValid;
  final bool isPasswordValid;
  final bool isPasswordConfValid;
  final VoidCallback registerPressed;

  const RegisterView(
      {required this.registerPressed,
      required this.isEmailValid,
      required this.isPasswordValid,
      required this.isPasswordConfValid,
      required this.nombreController,
      required this.nitController,
      required this.dominioController,
      required this.direccionController,
      required this.telefonoController,
      required this.emailController,
      required this.passwordController,
      required this.passwordConfController});

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro empresas'),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.005),
            const Icon(
              Icons.corporate_fare,
              color: Color.fromARGB(255, 37, 43, 214),
              size: 150,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.035),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.apartment),
                  contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                  labelText: 'Empresa',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 15, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: nitController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers_rounded),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'NIT',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 15, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: dominioController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.domain),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Dominio',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 15, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: direccionController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.home_work),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Direccion',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 15, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: telefonoController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Telefono',
                    border: OutlineInputBorder()),
              ),
            ),
            SizedBox(height: 15, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: emailController,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email),
                  contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                  labelText: 'Correo electrónico',
                  border: const OutlineInputBorder(),
                  errorText:
                      isEmailValid ? null : 'Correo electrónico inválido',
                ),
              ),
            ),
            SizedBox(height: 15, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: passwordController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Contraseña',
                    //errorText: isPasswordValid ? null : 'Contraseña inválida',
                    border: OutlineInputBorder()),
                obscureText: true,
              ),
            ),
            SizedBox(height: 15, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: passwordConfController,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.vpn_key),
                    contentPadding: EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Confirmar contraseña',
                    //errorText:
                    //isPasswordConfValid ? null : 'Contraseña inválida',
                    border: OutlineInputBorder()),
                obscureText: true,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.040),
            ElevatedButton(
              onPressed: registerPressed,
              child: const Text('Registrarse'),
            ),
          ],
        ),
      ),
    );
  }
}
