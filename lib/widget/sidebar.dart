import 'package:flutter/material.dart';
import 'package:smartklinik/ui/beranda.dart';
import 'package:smartklinik/ui/login.dart';
import 'package:smartklinik/ui/pasien/pasien_page.dart';
import 'package:smartklinik/ui/pegawai/pegawai_page.dart';
import 'package:smartklinik/ui/poli/poli_page.dart';
import 'package:smartklinik/ui/obat/obat_page.dart';
import 'package:smartklinik/helpers/user_info.dart';
import 'package:google_fonts/google_fonts.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // logo user
          UserAccountsDrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.teal, // Set the background color here
            ),
            accountName: FutureBuilder(
              future: UserInfo().getUserName(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  String username = snapshot.data ?? 'Unknown User';
                  return Text(
                    username,
                    style: GoogleFonts.manrope(
                      textStyle: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold
                      ),
                      fontSize: 20,
                    ),
                  );
                }
              },
            ),
            accountEmail: FutureBuilder(
              future: UserInfo().getEmail(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  String email = snapshot.data ?? 'Unknown Email';
                  return Text(
                      email,
                      style: GoogleFonts.nunito(
                      textStyle: const TextStyle(
                        color: Colors.white,
                      ),
                      fontSize: 14,),
                  );
                }
              },
            ),
          ),
          // home
          ListTile(
            leading: const Icon(Icons.home) ,
            title: const Text('Beranda'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => const Beranda()));
            },
          ),
          // poli
          ListTile(
            leading: const Icon(Icons.accessible) ,
            title: const Text('Poli'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => const PoliPage()
                )
              );
            },
          ),
          // pasien
          ListTile(
            leading: const Icon(Icons.account_box_sharp) ,
            title: const Text('Pasien'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => const PasienPage()
                )
              );
            },
          ),
          // pegawai
          ListTile(
            leading: const Icon(Icons.people) ,
            title: const Text('Pegawai'),
            onTap: () {
              Navigator.push(
                context, MaterialPageRoute(
                  builder:(context) => const PegawaiPage()
                )
              );
            },
          ),
          // Obat
          ListTile(
            leading: const Icon(Icons.medical_information) ,
            title: const Text('Obat'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(
                  builder:(context) => const ObatPage()
              )
              );
            },
          ),
          // keluar
          ListTile(
            leading: const Icon(Icons.logout_rounded) ,
            title: const Text('Keluar'),
            onTap: () {
              Navigator.pushAndRemoveUntil(context,
                  MaterialPageRoute(builder: (context) =>
                      const Login()),
                      (Route<dynamic>route) => false);
            },
          ),
        ],
      ),
    );
  }
}