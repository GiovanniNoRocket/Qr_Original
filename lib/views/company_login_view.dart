import 'package:flutter/material.dart';
import 'package:qr_original/controllers/company_register_controller.dart';

class LoginView extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isEmailValid;
  final bool isPasswordValid;
  final VoidCallback loginPressed;

  const LoginView({
    required this.emailController,
    required this.passwordController,
    required this.isEmailValid,
    required this.isPasswordValid,
    required this.loginPressed,
  });

  @override
  Widget build(BuildContext context) {
    double widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Inicio de sesión empresas'),
      ),
      backgroundColor: Colors.grey[300],
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(36.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.017),
            const Icon(
              Icons.corporate_fare,
              color: Color.fromARGB(255, 37, 43, 214),
              size: 150,
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.065),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Sign in',
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
            SizedBox(height: 30, width: widthDevice),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.91,
              child: TextField(
                controller: passwordController,
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.vpn_key),
                    contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
                    labelText: 'Contraseña',
                    errorText: isPasswordValid ? null : 'Contraseña inválida',
                    border: const OutlineInputBorder()),
                obscureText: true,
              ),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.050),
            ElevatedButton(
              onPressed: loginPressed,
              child: const Text('Iniciar sesión'),
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.05),
            Row(
              mainAxisAlignment: MainAxisAlignment
                  .center, // Alineación de los botones y espacio entre ellos
              children: <Widget>[
                const Text("¿No tienes cuenta? "),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => RegisterController()));
                  },
                  child: const Text(
                    "Crear",
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
