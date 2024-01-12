import 'package:flutter/material.dart';
import 'package:smartklinik/helpers/user_info.dart';
import 'package:smartklinik/widget/sidebar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smartklinik/ui/poli/poli_page.dart';
import 'package:smartklinik/ui/pegawai/pegawai_page.dart';
import 'package:smartklinik/ui/pasien/pasien_page.dart';
import 'package:smartklinik/ui/obat/obat_page.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        onPressed: (){},
        icon: const Icon(Icons.chat_bubble),
        label: const Text('Bantuan'),
        extendedPadding: const EdgeInsets.all(20.0),
      ),
      drawer: const Sidebar(),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.teal,
        title: const Text(""),
      ),
      body: SafeArea(
        child: FutureBuilder(
          future: UserInfo().getUserName(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator(); // Show loading indicator while fetching data
            } else if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            } else {
              String username = snapshot.data ?? 'Unknown User'; // Default to 'Unknown User' if data is null
              return  SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // SECTION HEADER + SEARCH
                    Container(
                      width: double.infinity,
                      decoration: const BoxDecoration(
                          color: Colors.teal,
                          borderRadius:
                          BorderRadius.vertical(bottom: Radius.circular(0))),
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Welcome, $username!',
                            style: GoogleFonts.nunito(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                letterSpacing: .3,
                              ),
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(
                            height: 2,
                          ),
                          Text(
                            'Smart Klinik',
                            style: GoogleFonts.manrope(
                              textStyle: const TextStyle(
                                color: Colors.white,
                                letterSpacing: .5,
                              ),
                              fontSize: 30,
                              fontWeight: FontWeight.w800,
                            ),
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          Container(
                            height: 58,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: const Color.fromRGBO(244, 243, 243, .95),
                                borderRadius: BorderRadius.circular(8)),
                            child: TextField(
                              style: GoogleFonts.nunito(
                                textStyle: const TextStyle(
                                  color: Colors.black87,
                                  letterSpacing: .5,
                                ),
                                fontSize: 16,
                              ),
                              decoration: const InputDecoration(
                                  border: InputBorder.none,
                                  prefixIcon: Icon(
                                    Icons.search,
                                    color: Colors.black54,
                                  ),
                                  hintText: "Cari di Smart Klinik",
                                  hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  )),
                            ),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // SECTION MAIN MENU LIST
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            height: 350,
                            child: GridView.count(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16.0,
                              mainAxisSpacing: 16.0,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const PoliPage()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.teal.withOpacity(1),
                                            BlendMode.hue,
                                          ),
                                          image: const AssetImage(
                                              'assets/images/img-poli.png')),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            stops: const [
                                              0.1,
                                              1
                                            ],
                                            colors: [
                                              Colors.black.withOpacity(.5),
                                              Colors.black.withOpacity(.2)
                                            ]),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            'Data Poli',
                                            style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                letterSpacing: .5,
                                              ),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const PasienPage()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.teal.withOpacity(1),
                                            BlendMode.overlay,
                                          ),
                                          image: const AssetImage(
                                              'assets/images/img-pasien.png')),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            stops: const [
                                              0.1,
                                              1
                                            ],
                                            colors: [
                                              Colors.black.withOpacity(.5),
                                              Colors.black.withOpacity(.2)
                                            ]),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            'Data Pasien',
                                            style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                letterSpacing: .5,
                                              ),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const PegawaiPage()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.teal.withOpacity(.8),
                                            BlendMode.softLight,
                                          ),
                                          image: const AssetImage(
                                              'assets/images/img-pegawai.png')),
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: LinearGradient(
                                            begin: Alignment.bottomRight,
                                            stops: const [
                                              0.1,
                                              1
                                            ],
                                            colors: [
                                              Colors.black.withOpacity(.5),
                                              Colors.black.withOpacity(.2)
                                            ]),
                                      ),
                                      child: Align(
                                        alignment: Alignment.bottomLeft,
                                        child: Padding(
                                          padding: const EdgeInsets.all(15.0),
                                          child: Text(
                                            'Data Pegawai',
                                            style: GoogleFonts.nunito(
                                              textStyle: const TextStyle(
                                                color: Colors.white,
                                                letterSpacing: .5,
                                              ),
                                              fontSize: 14,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => const ObatPage()));
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          fit: BoxFit.cover,
                                          colorFilter: ColorFilter.mode(
                                            Colors.teal.withOpacity(1),
                                            BlendMode.hue,
                                          ),
                                          image: const AssetImage(
                                              'assets/images/img-obat.png')),
                                    ),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(8),
                                          gradient: LinearGradient(
                                              begin: Alignment.bottomRight,
                                              stops: const [
                                                0.1,
                                                1
                                              ],
                                              colors: [
                                                Colors.black.withOpacity(.5),
                                                Colors.black.withOpacity(.2)
                                              ]),
                                        ),
                                        child: Stack(
                                          children: [
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: Padding(
                                                padding: const EdgeInsets.all(15.0),
                                                child: Text(
                                                  'Data Obat',
                                                  style: GoogleFonts.nunito(
                                                    textStyle: const TextStyle(
                                                      color: Colors.white,
                                                      letterSpacing: .5,
                                                    ),
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Align(
                                              alignment: Alignment.topRight,
                                              child: Padding(
                                                padding: const EdgeInsets.all(12.0),
                                                child: Container(
                                                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red.withOpacity(0.8),
                                                    borderRadius: BorderRadius.circular(20), // Adjust the radius for capsule shape
                                                  ),
                                                  child: const Text(
                                                    "NEW",
                                                    style: TextStyle(
                                                        letterSpacing: .5,
                                                        fontSize: 10,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ),

      ),
    );
  }
}
