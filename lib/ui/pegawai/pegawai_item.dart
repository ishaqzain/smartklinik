import 'package:flutter/material.dart';
import 'package:smartklinik/model/pegawai.dart';
import 'package:smartklinik/ui/pegawai/pegawai_detail.dart';

class PegawaiItem extends StatelessWidget {
  final Pegawai pegawai;
  const PegawaiItem({super.key, required this.pegawai});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Card(
        child: ListTile(
          title: Text(pegawai.nama),
        ),
      ),
      onTap: (){
        Navigator.push(context,
          MaterialPageRoute(builder:
            (context) => PegawaiDetail(pegawai: pegawai)
          )
        );
      },
    );
  }
}