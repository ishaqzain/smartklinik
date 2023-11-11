import 'package:flutter/material.dart';
import 'package:smartklinik/ui/beranda.dart';
import 'package:smartklinik/ui/login.dart';
import 'package:smartklinik/ui/poli/poli_page.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // logo user
          const UserAccountsDrawerHeader(
              accountName: Text('Admin'),
              accountEmail: Text('admin@admin.com')),
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
              Navigator.push(context,
                  MaterialPageRoute(builder:
                      (context) => const PoliPage()));
            },
          ),
          // pasien
          ListTile(
            leading: const Icon(Icons.account_box_sharp) ,
            title: const Text('Pasien'),
            onTap: () {},
          ),
          // pegawai
          ListTile(
            leading: const Icon(Icons.people) ,
            title: const Text('Pegawai'),
            onTap: () {},
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