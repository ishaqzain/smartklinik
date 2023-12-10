import 'package:flutter/material.dart';
import 'package:smartklinik/service/login_service.dart';
import 'package:smartklinik/ui/beranda.dart';

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
                const Text("Login Admin", style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                ),),
                const SizedBox(height: 50,),
                Center(
                  child: Form(
                    key: _formKey,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Column(
                        children: [
                          // user
                          _usernameTextField(),
                          const SizedBox(height: 20,),
                          // pass
                          _passwordTextField(),
                          const SizedBox(height: 40,),
                          // tombol
                          _tombolLogin()
                        ],
                      ),
                    )
                  ),
                )
              ],
            ),
          ),
        ),
      )
    );
  }
  // user
  Widget _usernameTextField(){
    return TextFormField(
    decoration: const InputDecoration(labelText: "Username"),
    controller: _usernameCtrl,
    );
  }
  // password
  Widget _passwordTextField(){
    return TextFormField(
      decoration: const InputDecoration(labelText: "Password"),
      controller: _passwordCtrl,
      obscureText: true,
    );
  }
  // button
  Widget _tombolLogin(){
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(child: const Text("Login"),
        onPressed: () async {
          String username = _usernameCtrl.text;
          String password = _passwordCtrl.text;
          await LoginService().login(username, password).then((value) {
            if (value == true){
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Beranda()));
            } else {
              AlertDialog alertDialog = AlertDialog(
                content: const Text('Username atau Password tidak valid'),
                actions: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.green
                    ),
                    child: const Text("OK"),
                  )
                ],
              );
              showDialog(context: context, builder: (context) => alertDialog);
            }
          } );
        },),
    );
  }
}