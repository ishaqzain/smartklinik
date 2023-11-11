import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_form.dart';
import 'package:smartklinik/ui/pasien/pasien_item.dart';

class PasienPage extends StatefulWidget {
  const PasienPage ({super.key});
  @override
  State<PasienPage> createState() => _PasienPageState();
}
class _PasienPageState extends State<PasienPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Data Pasien"),
        actions: [
          GestureDetector(
            child: const Icon(Icons.add),
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const PasienForm())
              );
            },
          )
        ],
      ),
      body: ListView(
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