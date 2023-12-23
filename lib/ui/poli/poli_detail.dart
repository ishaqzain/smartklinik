import 'package:flutter/material.dart';
import 'package:smartklinik/model/poli.dart';
import 'package:smartklinik/ui/poli/poli_page.dart';
import 'package:smartklinik/ui/poli/poli_update_form.dart';
import 'package:smartklinik/service/poli_service.dart';

class PoliDetail extends StatefulWidget {
  final Poli poli;
  const PoliDetail({super.key, required this.poli});

  @override
  State<PoliDetail> createState() => _PoliDetailState();
}

class _PoliDetailState extends State<PoliDetail> {

  Stream<Poli> getData() async* {
    Poli data = await PoliService().getById(widget.poli.id.toString());
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Detail Poli"),),
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
                SizedBox(height: 20,),
                Text("Nama Poli : ${snapshot.data.namaPoli} ",
                  style: TextStyle(fontSize: 20),),
                SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _tombolUbah(),
                    _tombolHapus()
                  ],
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
                    PoliUpdateForm(poli: snapshot.data)));
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
                      await PoliService().hapus(snapshot.data).then((value){
                        Navigator.pop(context);
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: ( context ) => PoliPage()));
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
      child: const Text('Hapus'),
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.red),
    );
  }
}
