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
      drawer: const Sidebar(),
      appBar: AppBar(
        title: const Text("Data Poli"),
        actions: <Widget>[
          Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const PoliForm())
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