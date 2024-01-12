import 'package:flutter/material.dart';
import 'package:smartklinik/ui/login.dart';
import 'package:smartklinik/ui/beranda.dart';
import 'package:smartklinik/helpers/user_info.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var token = await UserInfo().getToken();
  print(token);

  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;

  const MyApp({Key? key, required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Klinik App",
      debugShowCheckedModeBanner: false,
      home: token == null ? const Login() : const Beranda(),
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.teal, // Set the background color of the app bar
          elevation: 3, // Set the elevation (shadow) of the app bar
        ),
        textTheme: GoogleFonts.nunitoTextTheme().copyWith(
          titleLarge: GoogleFonts.nunito(
            textStyle: const TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              // Add other styling properties as needed
            ),
          ),
        ),
        canvasColor: Colors.grey[200],
      ),
    );
  }
}
