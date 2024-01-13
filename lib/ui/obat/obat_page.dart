import 'package:flutter/material.dart';
import 'package:smartklinik/model/obat.dart';
import 'package:smartklinik/ui/obat/obat_form.dart';
import 'package:smartklinik/ui/obat/obat_item.dart';
import 'package:smartklinik/widget/sidebar.dart';
import 'package:smartklinik/service/obat_service.dart';

class ObatPage extends StatefulWidget {
  const ObatPage ({super.key});
  @override
  State<ObatPage> createState() => _ObatPageState();
}

class _ObatPageState extends State<ObatPage> {

  Stream<List<Obat>> getList() async* {
    List<Obat> data = await ObatService().listData();
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
              MaterialPageRoute(builder: (context) => const ObatForm())
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Data Obat'),
        extendedPadding: const EdgeInsets.all(20.0),
      ),
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Obat"),
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
                  return ObatItem(obat: snapshot.data[index]);
                }
            );
          }
      ),
    );
  }
}