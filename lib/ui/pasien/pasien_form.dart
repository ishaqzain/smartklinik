import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/service/pasien_service.dart';
import 'package:smartklinik/ui/pasien/pasien_page.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});
  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _noTlpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tambah Data Pasien'),),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 490,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _fieldName("No RM", _noRmCtrl),
                        const SizedBox(height: 16,),
                        _fieldName("Nama", _namaCtrl),
                        const SizedBox(height: 16,),
                        _fieldName("Tanggal Lahir", _tglLahirCtrl),
                        const SizedBox(height: 16,),
                        _fieldName("No Telepon", _noTlpCtrl),
                        const SizedBox(height: 16,),
                        _fieldName("Alamat", _alamatCtrl),
                        const SizedBox(height: 16,),
                        _tombolSimpan()
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
  // text field
  _fieldName(String label, TextEditingController Ctrl){
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: Ctrl,
    );
  }

  // btn save
  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Pasien pasien = Pasien(
              nomorRm: _noRmCtrl.text,
              nama: _namaCtrl.text,
              tanggalLahir: _tglLahirCtrl.text,
              nomorTelepon: _noTlpCtrl.text,
              alamat: _alamatCtrl.text
          );
          await PasienService().simpan(pasien).then((value) {
            Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) =>
                const PasienPage())
            );
            print(value);
          });
        },
        child: const Text("Simpan")
    );
  }
}