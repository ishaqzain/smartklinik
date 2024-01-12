import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_form.dart';
import 'package:smartklinik/ui/pasien/pasien_item.dart';
import 'package:smartklinik/widget/sidebar.dart';
import 'package:smartklinik/service/pasien_service.dart';

class PasienPage extends StatefulWidget {
  const PasienPage ({super.key});
  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {

  Stream<List<Pasien>> getList() async* {
    List<Pasien> data = await PasienService().listData();
    yield data;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: (){
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const PasienForm())
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Data Pasien'),
        extendedPadding: const EdgeInsets.all(20.0),
      ),
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Pasien"),
        // actions: <Widget>[
        //   Padding(
        //       padding: const EdgeInsets.only(right: 16.0),
        //       child: GestureDetector(
        //         onTap: (){
        //           Navigator.push(context,
        //               MaterialPageRoute(builder: (context) => const PasienForm())
        //           );
        //         },
        //         child: const Icon(
        //           Icons.add,
        //         ),
        //       )
        //   ),
        // ],
      ),
      body: StreamBuilder(
          stream: getList(),
          builder: (context, AsyncSnapshot snapshot) {
            print(getList());
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            if (snapshot.connectionState != ConnectionState.done) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (!snapshot.hasData && snapshot.connectionState ==
                ConnectionState.done) {
              return const Text('Data Kosong');
            }
            return ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: snapshot.data.length,
                itemBuilder: (context, index){
                  return PasienItem(pasien: snapshot.data[index]);
                }
            );
          }
      ),
    );
  }
}