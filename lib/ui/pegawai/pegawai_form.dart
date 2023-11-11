import 'package:flutter/material.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});
  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tambah Data Pegawai'),),
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const TextField(
                  decoration: InputDecoration(labelText: "NIP"),
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
                  decoration: InputDecoration(labelText: "Email"),
                ),
                const SizedBox(height: 16,),
                const TextField(
                  decoration: InputDecoration(labelText: "Password"),
                ),
                const SizedBox(height: 16,),
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