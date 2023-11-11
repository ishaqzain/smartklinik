import 'package:flutter/material.dart';
import 'package:smartklinik/model/poli.dart';
import 'package:smartklinik/ui/poli/poli_form.dart';
import 'package:smartklinik/ui/poli/poli_item.dart';
import 'package:smartklinik/widget/sidebar.dart';

class PoliPage extends StatefulWidget {
  const PoliPage ({super.key});
  @override
  State<PoliPage> createState() => _PoliPageState();
}
class _PoliPageState extends State<PoliPage> {
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children:[
            PoliItem(poli: Poli(namaPoli: "Poli Anak")),
            PoliItem(poli: Poli(namaPoli: "Poli Kandungan")),
            PoliItem(poli: Poli(namaPoli: "Poli Gigi")),
            PoliItem(poli: Poli(namaPoli: "Poli THT")),
          ],
        ),
      )
    );
  }
}