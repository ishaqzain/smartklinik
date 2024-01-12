import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_detail.dart';
import 'package:smartklinik/service/pegawai_service.dart';

class PegawaiUpdateForm extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiUpdateForm({super.key, required this.pegawai});

  @override
  State<PegawaiUpdateForm> createState() => _PegawaiUpdateFormState();
}

class _PegawaiUpdateFormState extends State<PegawaiUpdateForm> {

  Future<Pegawai> getData() async {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    setState(() {
      _namaCtrl.text = data.nama;
    });
    return data;
  }

  final _formKey = GlobalKey<FormState>();
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _noTlpCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();

  void iniSate() {
    super.initState();
    setState(() {
      _nipCtrl.text = widget.pegawai.nip;
      _namaCtrl.text = widget.pegawai.nama;
      _tglLahirCtrl.text = widget.pegawai.tanggalLahir;
      _noTlpCtrl.text = widget.pegawai.nomorTelepon;
      _emailCtrl.text = widget.pegawai.email;
      _passCtrl.text = widget.pegawai.password;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Ubah Data Pegawai'),),
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
          String id = widget.pegawai.id.toString();
          await PegawaiService().ubah(pegawai, id).then((value) {
            Navigator.pop(context);
            Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                    builder: (context) => PegawaiDetail(pegawai: value)));
          });
        },
        child: const Text("Simpan Perubahan")
    );
  }
}