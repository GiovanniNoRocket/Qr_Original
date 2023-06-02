import 'package:flutter/material.dart';

class signUp extends StatefulWidget {
  const signUp({super.key});

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nombreController = new TextEditingController();
  final TextEditingController nitController = new TextEditingController();
  final TextEditingController dominioController = new TextEditingController();
  final TextEditingController direccionController = new TextEditingController();
  final TextEditingController telefonoController = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController passwordConfController =
      new TextEditingController();

  @override
  Widget build(BuildContext context) {
    final nombreField = TextFormField(
        autofocus: false,
        controller: nombreController,
        keyboardType: TextInputType.text,
        //validator: {} {}
        onSaved: (value) {
          nombreController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.apartment),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Company",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final nitField = TextFormField(
        autofocus: false,
        controller: nitController,
        keyboardType: TextInputType.number,
        //validator: {} {}
        onSaved: (value) {
          nitController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.numbers_rounded),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "NIT",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final dominioField = TextFormField(
        autofocus: false,
        controller: dominioController,
        keyboardType: TextInputType.text,
        //validator: {} {}
        onSaved: (value) {
          dominioController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.domain),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Domain",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final direccionField = TextFormField(
        autofocus: false,
        controller: direccionController,
        keyboardType: TextInputType.streetAddress,
        //validator: {} {}
        onSaved: (value) {
          direccionController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.home_work),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Address",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final telefonoField = TextFormField(
        autofocus: false,
        controller: telefonoController,
        keyboardType: TextInputType.phone,
        //validator: {} {}
        onSaved: (value) {
          telefonoController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.phone),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Phone",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final emailField = TextFormField(
        autofocus: false,
        controller: emailController,
        keyboardType: TextInputType.emailAddress,
        //validator: {} {}
        onSaved: (value) {
          emailController.text = value!;
        },
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.email),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Email",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordField = TextFormField(
        autofocus: false,
        controller: passwordController,
        obscureText: true,

        //validator: {} {}
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: "Password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final passwordConfField = TextFormField(
        autofocus: false,
        controller: passwordConfController,
        obscureText: true,

        //validator: {} {}
        onSaved: (value) {
          passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: const Icon(Icons.vpn_key),
          contentPadding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          hintText: " Confirm password",
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ));

    final signUpButton = Material(
        elevation: 5,
        borderRadius: BorderRadius.circular(7),
        color: Colors.blueAccent,
        child: MaterialButton(
          padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
          minWidth: MediaQuery.of(context).size.width * 0.4,
          onPressed: () {},
          child: const Text(
            "Register",
            textAlign: TextAlign.center,
            style: TextStyle(
                fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ));

    return Scaffold(
      appBar: AppBar(
        title: const Text("QR Original"),
      ),
      backgroundColor: Colors.grey[300],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            color: Colors.grey[300],
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      const SizedBox(height: 35),
                      Icon(
                        Icons.corporate_fare_rounded,
                        color: Color.fromARGB(255, 37, 43, 214),
                        size: 150,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const <Widget>[
                          Text(
                            'Sign up',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 25),
                      nombreField,
                      const SizedBox(height: 15),
                      nitField,
                      const SizedBox(height: 15),
                      dominioField,
                      const SizedBox(height: 15),
                      direccionField,
                      const SizedBox(height: 15),
                      telefonoField,
                      const SizedBox(height: 15),
                      emailField,
                      const SizedBox(height: 15),
                      passwordField,
                      const SizedBox(height: 15),
                      passwordConfField,
                      const SizedBox(height: 30),
                      signUpButton
                    ],
                  )),
            ),
          ),
        ),
      ),
    );
  }
}
