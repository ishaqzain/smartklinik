import 'package:flutter/material.dart';
import 'package:smartklinik/ui/login.dart';
import 'package:smartklinik/ui/beranda.dart';
import 'package:smartklinik/helpers/user_info.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);
  runApp(MaterialApp(
    title: "Klinik App",
    debugShowCheckedModeBanner: false,
    home: token == null ? const Login() : const Beranda(),
    theme: ThemeData(
      appBarTheme: const AppBarTheme(
        color: Colors.teal, // Set the background color of the app bar
        elevation: 0, // Set the elevation (shadow) of the app bar
      ),
    ),
  ));
}

//
// void main() {
//   runApp(const MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   // This widget is the root of your application
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Smart Klinik",
//       debugShowCheckedModeBanner: false,
//       home: Login(),
//     );
//   }
// }