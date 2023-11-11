import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_form.dart';
import 'package:smartklinik/ui/pasien/pasien_item.dart';
import 'package:smartklinik/widget/sidebar.dart';

class PasienPage extends StatefulWidget {
  const PasienPage ({super.key});
  @override
  State<PasienPage> createState() => _PasienPageState();
}
class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PasienForm())
                  );
                },
                child: const Icon(
                  Icons.add,
                ),
              )
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children:[
          PasienItem(pasien: Pasien(
            nomorRm:"203902",
            nama: "Asep Mulyana",
            tanggalLahir: "1 July 2000",
            nomorTelepon: "0819394893",
            alamat: "Tangerang - Banten",
          )),
          PasienItem(pasien: Pasien(
            nomorRm:"203992",
            nama: "Ayu Lestari",
            tanggalLahir: "15 October 2000",
            nomorTelepon: "0819394893",
            alamat: "Bandung - Jawa Barat",
          )),
        ],
      ),
    );
  }
}