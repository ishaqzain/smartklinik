import 'package:flutter/material.dart';
import 'package:smartklinik/model/poli.dart';
import 'package:smartklinik/ui/poli/poli_detail.dart';

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});
  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Tambah poli'),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
             _fieldNamePoli("Nama Poli", _namaPoliCtrl),
              const SizedBox(height: 20,),
              _tombolSimpan()
            ],
          ),
        ),
      )
    );
  }

  // text field
  _fieldNamePoli(String label, TextEditingController Ctrl){
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: Ctrl,
    );
  }

  // btn save
  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Poli poli = Poli(namaPoli: _namaPoliCtrl.text);
        Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context) => PoliDetail(poli: poli))
        );
      },
      child: const Text("Simpan")
    );
  }

}