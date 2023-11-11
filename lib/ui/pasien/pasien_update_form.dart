import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_detail.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;
  const PasienUpdateForm({super.key, required this.pasien});
  @override
  State<PasienUpdateForm> createState() => _PasienUpdateForm();
}

class _PasienUpdateForm extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _noRmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _noTlpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  void iniSate() {
    super.initState();
    setState(() {
      _noRmCtrl.text = widget.pasien.nomorRm;
      _namaCtrl.text = widget.pasien.nama;
      _tglLahirCtrl.text = widget.pasien.tanggalLahir;
      _noTlpCtrl.text = widget.pasien.nomorTelepon;
      _alamatCtrl.text = widget.pasien.alamat;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ubah Data Pasien'),),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
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
        onPressed: () {
          Pasien pasien = Pasien(
            nomorRm: _noRmCtrl.text,
            nama: _namaCtrl.text,
            tanggalLahir: _tglLahirCtrl.text,
            nomorTelepon: _noTlpCtrl.text,
            alamat: _alamatCtrl.text,
          );
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => PasienDetail(pasien: pasien))
          );
        },
        child: const Text("Simpan Perubahan")
    );
  }
}