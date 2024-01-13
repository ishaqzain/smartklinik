import 'package:flutter/material.dart';
import 'package:smartklinik/model/obat.dart';
import 'package:smartklinik/ui/obat/obat_detail.dart';
import 'package:smartklinik/service/obat_service.dart';
import 'package:smartklinik/utils/snackbar_utils.dart';

class ObatUpdateForm extends StatefulWidget {
  final Obat obat;
  const ObatUpdateForm({Key? key, required this.obat}) : super(key: key);

  @override
  State<ObatUpdateForm> createState() => _ObatUpdateForm();
}

class _ObatUpdateForm extends State<ObatUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _merek = TextEditingController();
  final _harga = TextEditingController();
  final _stock = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    getData();
  }

  Future<void> getData() async {
    Obat data = await ObatService().getById(widget.obat.id.toString());
    setState(() {
      _merek.text = data.merek;
      _harga.text = data.harga;
      _stock.text = data.stock;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ubah Data Obat'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 330,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
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
                      _tombolSimpan(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // text field
  _fieldName(String label, TextEditingController Ctrl) {
    return TextField(
      decoration: InputDecoration(labelText: label),
      controller: Ctrl,
    );
  }

  // tombol simpan
  _tombolSimpan() {
    return ElevatedButton(
      onPressed: () async {
        Obat obat = Obat(
          merek: _merek.text,
          harga: _harga.text,
          stock: _stock.text,
        );
        String id = widget.obat.id.toString();
        await ObatService().ubah(obat, id).then((value) {
          Navigator.pop(context);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => ObatDetail(obat: value),
            ),
          );
          SnackbarUtils.showSnackbar(context, 'Data Obat berhasil diubah');
        });
      },
      child: const Text("Simpan Perubahan"),
    );
  }
}
