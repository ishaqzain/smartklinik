import 'package:flutter/material.dart';
import 'package:smartklinik/model/poli.dart';
import 'package:smartklinik/ui/poli/poli_detail.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;
  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}


class _PoliUpdateFormState extends State<PoliUpdateForm> {

  final _formKey = GlobalKey<FormState>();
  final _namPoliCtrl = TextEditingController();

  void iniSate() {
    super.initState();
    setState(() {
      _namPoliCtrl.text = widget.poli.namaPoli;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Ubah Poli'),),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              _fieldNamaPoli("Nama Poli", _namPoliCtrl),
              const SizedBox(height: 20,),
              _tombolSimpan()
            ],
          )
        ),
      ),
    );
  }
  // text field
  _fieldNamaPoli (String label, TextEditingController Ctrl) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: Ctrl,
    );
  }
  
  // tombol simpan
  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () {
        Poli poli = Poli(namaPoli: _namPoliCtrl.text);
        Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (context) => PoliDetail(poli: poli))
        );
      }, 
      child: const Text("Simpan Perubahan")
    );
  }
}