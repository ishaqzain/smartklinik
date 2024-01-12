import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/service/pegawai_service.dart';
import 'package:smartklinik/ui/pegawai/pegawai_page.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});
  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _noTlpCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tambah Data Pegawai'),),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 560,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _fieldNamePoli("NIP", _nipCtrl),
                        const SizedBox(height: 16,),
                        _fieldNamePoli("Nama", _namaCtrl),
                        const SizedBox(height: 16,),
                        _fieldNamePoli("Tanggal Lahir", _tglLahirCtrl),
                        const SizedBox(height: 16,),
                        _fieldNamePoli("No Telepon", _noTlpCtrl),
                        const SizedBox(height: 16,),
                        _fieldNamePoli("Email", _emailCtrl),
                        const SizedBox(height: 16,),
                        _fieldNamePoli("Password", _passCtrl),
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
  _fieldNamePoli(String label, TextEditingController Ctrl){
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: Ctrl,
    );
  }

  // btn save
  _tombolSimpan() {
    return ElevatedButton(
        onPressed: () async {
          Pegawai pegawai = Pegawai(
            nip: _nipCtrl.text,
            nama: _namaCtrl.text,
            tanggalLahir: _tglLahirCtrl.text,
            nomorTelepon: _noTlpCtrl.text,
            email: _emailCtrl.text,
            password: _passCtrl.text
          );
          // await PegawaiService().simpan(pegawai).then((value) {
          //   Navigator.pushReplacement(context,
          //       MaterialPageRoute(builder: (context) =>
          //           PegawaiDetail(pegawai: value)));
          //   print(value);
          // });
          await PegawaiService().simpan(pegawai).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>
                const PegawaiPage())
            );
            print(value);
          });
        },
        child: const Text("Simpan")
    );
  }
}