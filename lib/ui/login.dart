import 'package:flutter/material.dart';
import 'package:smartklinik/service/login_service.dart';
import 'package:smartklinik/ui/beranda.dart';
import 'package:iconsax/iconsax.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  final _usernameCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(48),
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Smart Klinik',
                  style: GoogleFonts.manrope(
                    textStyle: const TextStyle(
                      color: Colors.teal,
                      letterSpacing: .5,
                    ),
                    fontSize: 30,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Login Admin",
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black54),
                ),
                const SizedBox(
                  height: 50,
                ),
                Center(
                  child: Form(
                      key: _formKey,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          children: [
                            // user
                            _usernameTextField(),
                            const SizedBox(
                              height: 16,
                            ),
                            // pass
                            _passwordTextField(),
                            const SizedBox(
                              height: 24,
                            ),
                            // tombol
                            _tombolLogin()
                          ],
                        ),
                      )),
                )
              ],
            ),
          ),
        ),
      )
    );
  }

  // user
  Widget _usernameTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Email",
        hintText: 'Type your e-mail',
        labelStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        prefixIcon: const Icon(
          Iconsax.user,
          color: Colors.teal,
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.teal,
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      controller: _usernameCtrl,
    );
  }

  // password
  Widget _passwordTextField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: "Password",
        hintText: 'Type your password',
        labelStyle: TextStyle(
          color: Colors.grey.shade600,
          fontSize: 14.0,
          fontWeight: FontWeight.w400,
        ),
        hintStyle: const TextStyle(
          color: Colors.grey,
          fontSize: 14.0,
        ),
        prefixIcon: const Icon(
          Iconsax.key4,
          color: Colors.teal,
          size: 18,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey.shade600, width: 1.5),
          borderRadius: BorderRadius.circular(10.0),
        ),
        floatingLabelStyle: const TextStyle(
          color: Colors.teal,
          fontSize: 18.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.teal, width: 2),
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      controller: _passwordCtrl,
      obscureText: true,
    );
  }

  // button
  Widget _tombolLogin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 3, // Elevation
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Rounded corners
          ),
        ),
        child: const SizedBox(
          width: 150.0, // Set the desired width
          height: 48.0, // Set the desired height
          child: Center(
            child: Text('Login'),
          ),
        ),
        onPressed: () async {
          String username = _usernameCtrl.text;
          String password = _passwordCtrl.text;
          await LoginService().login(username, password).then((value) {
            if (value == true) {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Beranda()));
            } else {
              AlertDialog alertDialog = AlertDialog(
                content: const Text('Username atau Password tidak valid'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text("OK"),
                  )
                ],
              );
              showDialog(context: context, builder: (context) => alertDialog);
            }
          });
        },
      ),
    );
  }
}
