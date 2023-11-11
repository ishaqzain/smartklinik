import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_form.dart';
import 'package:smartklinik/ui/pegawai/pegawai_item.dart';
import 'package:smartklinik/widget/sidebar.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage ({super.key});
  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}
class _PegawaiPageState extends State<PegawaiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pegawai"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PegawaiForm())
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
          PegawaiItem(pegawai: Pegawai(
            nip:"09209390293",
            nama: "Budi Sudarsono",
            tanggalLahir: "1 July 2000",
            nomorTelepon: "0819394893",
            email: "budi@gmail.com",
            password: "9930393124abc",
          )),
          PegawaiItem(pegawai: Pegawai(
            nip:"09209390293",
            nama: "Susi Susanti",
            tanggalLahir: "3 September 1988",
            nomorTelepon: "08291992920",
            email: "susi.susanti@gmail.com",
            password: "abcd123",
          )),
        ],
      ),
    );
  }
}