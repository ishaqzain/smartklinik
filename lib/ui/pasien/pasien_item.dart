import 'package:flutter/material.dart';
import 'package:smartklinik/model/pasien.dart';
import 'package:smartklinik/ui/pasien/pasien_detail.dart';

class PasienItem extends StatelessWidget {
  final Pasien pasien;
  const PasienItem({super.key, required this.pasien});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(pasien.nama),
        ),
      ),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder:
                (context) => PasienDetail(pasien: pasien)
            )
        );
      },
    );
  }
}