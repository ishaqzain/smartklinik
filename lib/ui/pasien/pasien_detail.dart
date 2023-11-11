import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_page.dart';
import 'package:smartklinik/ui/pasien/pasien_update_form.dart';

class PasienDetail extends StatefulWidget {
  final Pasien pasien;
  const PasienDetail({super.key, required this.pasien});

  @override
  State<PasienDetail> createState() => _PasienDetailState();
}

class _PasienDetailState extends State<PasienDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pasien"),),
      body: Column(
        children: [
          const SizedBox(height: 20,),
          Text("No RM: ${widget.pasien.nomorRm}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Nama: ${widget.pasien.nama}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Tanggal Lahir: ${widget.pasien.tanggalLahir}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("No Telepon: ${widget.pasien.nomorTelepon}",
            style: const TextStyle(fontSize: 20),
          ),
          Text("Alamat: ${widget.pasien.alamat}",
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
                PasienUpdateForm(pasien: widget.pasien)
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
                    MaterialPageRoute(builder: (context) => const PasienPage())
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