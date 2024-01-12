import 'package:flutter/material.dart';
import 'package:smartklinik/model/obat.dart';
import 'package:smartklinik/ui/obat/obat_detail.dart';

class ObatItem extends StatelessWidget {
  final Obat obat;
  const ObatItem({super.key, required this.obat});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
        ),
        child: ListTile(
          title: Text(obat.merek),
          subtitle: Text(obat.stock),
        ),
      ),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder:
                (context) => ObatDetail(obat: obat)
            )
        );
      },
    );
  }
}