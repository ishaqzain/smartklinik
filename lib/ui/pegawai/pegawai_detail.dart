import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_page.dart';
import 'package:smartklinik/ui/pegawai/pegawai_update_form.dart';
import 'package:smartklinik/service/pegawai_service.dart';
import 'package:google_fonts/google_fonts.dart';

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
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 480,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        // NO RM
                        const Text("NIP",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.nip}",
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _devider(),
                        // NAMA
                        const Text("Nama",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.nama}",
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _devider(),
                        // TANGGAL LAHIR
                        const Text("Tanggal Lahir",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.tanggalLahir}",
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _devider(),
                        // TELEPON
                        const Text("No Telepon",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.nomorTelepon}",
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _devider(),
                        // EMAIL
                        const Text("Email",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.email}",
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _devider(),
                        // Password
                        const Text("Password",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.password}",
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        const SizedBox(height: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _tombolUbah(),
                            _tombolHapus()
                          ],
                        )
                      ],
                    ),
                  ),
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
            backgroundColor: Colors.teal.shade600,
            minimumSize: const Size(100.0, 40.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
            ),
          ),
          child: const Text('Edit'),
        )
    );
  }
  // devider
  _devider(){
    return Divider(
      height: 20,
      thickness: 1,
      color: Colors.grey.shade300,
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
      child: const Text('Delete'),
      style: ElevatedButton.styleFrom(
          minimumSize: const Size(100.0, 40.0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
          ),
          backgroundColor: Colors.red.shade900
      ),
    );
  }
}