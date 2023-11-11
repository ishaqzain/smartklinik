import 'package:flutter/material.dart';
import 'package:smartklinik/widget/sidebar.dart';

class Beranda extends StatelessWidget {
  const Beranda ({super.key});

  @override
  Widget build (BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Beranda"),),
      body: const Center(
        child: Text("Selamat Datang"),
      ),
    );
  }
}