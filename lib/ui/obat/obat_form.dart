import 'package:flutter/material.dart';
import 'package:smartklinik/model/obat.dart';
import 'package:smartklinik/service/obat_service.dart';
import 'package:smartklinik/ui/obat/obat_detail.dart';

class ObatForm extends StatefulWidget {
  const ObatForm({super.key});
  @override
  State<ObatForm> createState() => _ObatFormState();
}

class _ObatFormState extends State<ObatForm> {
  final _formKey = GlobalKey<FormState>();
  final _merek = TextEditingController();
  final _harga = TextEditingController();
  final _stock = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Tambah Data Obat'),),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 330,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        _fieldName("Merek", _merek),
                        const SizedBox(height: 16,),
                        _fieldName("Harga", _harga),
                        const SizedBox(height: 16,),
                        _fieldName("Stock", _stock),
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
          Obat obat = Obat(
              merek: _merek.text,
              harga: _harga.text,
              stock: _stock.text,
          );
          await ObatService().simpan(obat).then((value) {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) =>
                    ObatDetail(obat: value)));
            print(value);
          });
        },
        child: const Text("Simpan")
    );
  }
}