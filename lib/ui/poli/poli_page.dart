import 'package:flutter/material.dart';
import 'package:smartklinik/model/poli.dart';
import 'package:smartklinik/ui/poli/poli_form.dart';
import 'package:smartklinik/ui/poli/poli_item.dart';
import 'package:smartklinik/widget/sidebar.dart';
import 'package:smartklinik/service/poli_service.dart';

class PoliPage extends StatefulWidget {
  const PoliPage ({super.key});
  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {

  Stream<List<Poli>> getList() async* {
    List<Poli> data = await PoliService().listData();
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
              MaterialPageRoute(builder: (context) => const PoliForm())
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Data Poli'),
        extendedPadding: const EdgeInsets.all(20.0),
      ),
      drawer: const Sidebar(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: const Text("Data Poli"),
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
                  return PoliItem(poli: snapshot.data[index]);
                }
            );
          }
      ),
    );
  }
}