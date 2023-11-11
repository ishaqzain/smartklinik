import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:smartklinik/ui/pasien/pasien_page.dart';
import 'package:smartklinik/ui/poli/poli_page.dart';
import 'package:smartklinik/ui/pegawai/pegawai_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Klinik',
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: "Smart Klinik",),
      routes: {
        '/poli_page': (context) => const PoliPage(),
        '/pegawai_page': (context) => const PegawaiPage(),
        '/pasien_page': (context) => const PasienPage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body:ListView(
        children: [
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text('Data Poli'),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/poli_page');
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text('Data Pegawai'),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/pegawai_page');
            },
          ),
          GestureDetector(
            child: const Card(
              child: ListTile(
                title: Text('Data Pasien'),
              ),
            ),
            onTap: (){
              Navigator.pushNamed(context, '/pasien_page');
            },
          ),
        ],
      ),
    );
  }
}
