import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_form.dart';
import 'package:smartklinik/ui/pegawai/pegawai_item.dart';
import 'package:smartklinik/widget/sidebar.dart';
import 'package:smartklinik/service/pegawai_service.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage ({super.key});
  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}
class _PegawaiPageState extends State<PegawaiPage> {

  Stream<List<Pegawai>> getList() async* {
    List<Pegawai> data = await PegawaiService().listData();
    yield data;
  }

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
                  return PegawaiItem(pegawai: snapshot.data[index]);
                }
            );
          }
      ),
    );
  }
}