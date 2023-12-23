import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_page.dart';
import 'package:smartklinik/ui/pegawai/pegawai_update_form.dart';
import 'package:smartklinik/service/pegawai_service.dart';

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;
  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {

  Stream<Pegawai> getData() async* {
    Pegawai data = await PegawaiService().getById(widget.pegawai.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Pegawai"),),
      body: StreamBuilder(
          stream: getData(),
          builder: (context, AsyncSnapshot snapshot) {
            if(snapshot.hasError){
              return Text(snapshot.error.toString());
            }
            if(snapshot.connectionState != ConnectionState.done){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if(!snapshot.hasData && snapshot.connectionState == ConnectionState.done ){
              return  Text('Data Tidak Ditemukan');
            }
            return Column(
              children: [
                const SizedBox(height: 20,),
                Text("NIP: ${snapshot.data.nip}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text("Nama: ${snapshot.data.nama}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text("Tanggal Lahir: ${snapshot.data.tanggalLahir}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text("No Telepon: ${snapshot.data.nomorTelepon}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text("Email: ${snapshot.data.email}",
                  style: const TextStyle(fontSize: 20),
                ),
                Text("Password: ${snapshot.data.password}",
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
            );
          }
      ),
    );
  }
  // tombol ubah
  _tombolUbah(){
    return StreamBuilder(
        stream: getData(),
        builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) =>
                    PegawaiUpdateForm(pegawai: snapshot.data)));
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green),
          child: const Text('Ubah'),
        )
    );
  }
  // tombol hapus
  _tombolHapus(){
    return ElevatedButton(
      onPressed: () {
        AlertDialog alertDialog = AlertDialog(
          content: Text("Yakin ingin menghapus data ini?"),
          actions: [
            StreamBuilder(
                stream: getData(),
                builder: (context, AsyncSnapshot snapshot) => ElevatedButton(
                    onPressed: () async {
                      print(snapshot.data);
                      await PegawaiService().hapus(snapshot.data).then((value){
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: ( context ) => PegawaiPage()));
                      });
                    },
                    child: Text("YA"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red)
                )
            ),
            ElevatedButton(
                onPressed: (){
                  Navigator.pop(context);
                },
                child: Text("Tidak"),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green)
            )
          ],
        );
        showDialog(context: context, builder: (context) => alertDialog);
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red),
      child: const Text('Hapus'),
    );
  }
}