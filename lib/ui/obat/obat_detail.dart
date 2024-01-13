import 'package:flutter/material.dart';
import 'package:smartklinik/model/obat.dart';
import 'package:smartklinik/ui/obat/obat_page.dart';
import 'package:smartklinik/ui/obat/obat_update_form.dart';
import 'package:smartklinik/service/obat_service.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartklinik/utils/snackbar_utils.dart';

class ObatDetail extends StatefulWidget {
  final Obat obat;
  const ObatDetail({super.key, required this.obat});

  @override
  State<ObatDetail> createState() => _ObatDetailState();
}

class _ObatDetailState extends State<ObatDetail> {

  Stream<Obat> getData() async* {
    Obat data = await ObatService().getById(widget.obat.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Obat"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back), // You can use any icon you prefer
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const ObatPage()),
            );
          },
        ),
      ),
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
              return Text('Data Tidak Ditemukan');
            }
            return Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  height: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
                    ),
                    child: ListView(
                      padding: const EdgeInsets.all(16),
                      children: [
                        // MEREK
                        const Text("Merek",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.merek}",
                          style: GoogleFonts.manrope(
                            textStyle: const TextStyle(
                              letterSpacing: .5,
                            ),
                            fontSize: 16,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        _devider(),
                        // HARGA
                        const Text("Harga",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.harga}",
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
                        const Text("Stock",
                          style: TextStyle(fontSize: 12),
                        ),
                        Text(
                          "${snapshot.data.stock}",
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
                ),
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
                    ObatUpdateForm(obat: snapshot.data)));
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
                      await ObatService().hapus(snapshot.data).then((value){
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: ( context ) => const ObatPage()));
                        SnackbarUtils.showSnackbar(context, 'Data Obat ${snapshot.data.merek} berhasil dihapus');
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