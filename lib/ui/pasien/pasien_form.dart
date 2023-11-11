import 'package:flutter/material.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});
  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tambah Data Pasien'),),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: "No RM"),
                ),
                const SizedBox(height: 16,),
                const TextField(
                  decoration: InputDecoration(labelText: "Nama"),
                ),
                const SizedBox(height: 16,),
                const TextField(
                  decoration: InputDecoration(labelText: "Tanggal Lahir"),
                ),
                const SizedBox(height: 16,),
                const TextField(
                  decoration: InputDecoration(labelText: "No Telepon"),
                ),
                const SizedBox(height: 16,),
                const TextField(
                  decoration: InputDecoration(labelText: "Alamat"),
                ),
                ElevatedButton(
                    onPressed: () {},
                    child: const Text("Simpan")
                ),
              ],
            ),
          ),
        )
    );
  }
}