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
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0), // Adjust the radius as needed
        ),
        child: ListTile(
          title: Text(pasien.nama),
          subtitle: Text(pasien.alamat),
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