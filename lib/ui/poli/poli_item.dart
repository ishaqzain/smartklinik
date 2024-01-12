import 'package:flutter/material.dart';
import 'package:smartklinik/model/poli.dart';
import 'package:smartklinik/ui/poli/poli_detail.dart';

class PoliItem extends StatelessWidget {
  final Poli poli;

  const PoliItem({super.key, required this.poli});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
        ),
        child: ListTile(
          title: Text(poli.namaPoli),
        ),
      ),
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => PoliDetail(poli: poli)));
      },
    );
  }
}
