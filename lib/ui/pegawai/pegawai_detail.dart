import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_page.dart';
import 'package:smartklinik/ui/pegawai/pegawai_update_form.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai"),),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Text("NIP: ${widget.pegawai.nip}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Nama: ${widget.pegawai.nama}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Tanggal Lahir: ${widget.pegawai.tanggalLahir}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("No Telepon: ${widget.pegawai.nomorTelepon}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Email: ${widget.pegawai.email}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Password: ${widget.pegawai.password}",
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height:20 ,),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _tombolUbah(),
                _tombolHapus()
              ]
          )
        ],
      ),
    );
  }
  // tombol ubah
  _tombolUbah() {
    return ElevatedButton(
      onPressed: () {
        Navigator.push( context,
            MaterialPageRoute(builder: (context) =>
                PegawaiUpdateForm(pegawai: widget.pegawai)
            )
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green
      ),
      child: const Text("Ubah"),
    );
  }
  // tombol hapus
  _tombolHapus(){
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: const Text("Yakin ingin menghapus data ini?"),
          actions: [
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => const PegawaiPage())
                );
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red
              ),
              child: const Text("YA"),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green
              ),
              child: const Text("Tidak"),
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red
      ),
      child: const Text("Hapus"),
    );
  }
}