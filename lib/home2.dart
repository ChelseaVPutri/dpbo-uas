import 'package:dpbo/profile.dart';
import 'package:dpbo/jemput-sampah.dart';
import 'package:dpbo/riwayat.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class Homepage2 extends StatefulWidget {
  // final String username;
  // Homepage2({required this.username});
  Homepage2({super.key});

  @override
  State<Homepage2> createState() => _Homepage2();
}

class _Homepage2 extends State<Homepage2> {
  int selected_index = 0;

  void onNavbarTapped(int index) {
    setState(() {
      selected_index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
      title: Text('EcoWaste', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
      backgroundColor: Color.fromRGBO(102, 160, 116, 1),
      elevation: 0.0
    ),
    bottomNavigationBar: BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          navbar(CupertinoIcons.home, 'Beranda', 0),
          navbar(CupertinoIcons.list_bullet, 'Riwayat', 1),
          navbar(Icons.person, 'Profile', 2),
        ],
      ),
      color: Colors.white,
      elevation: 10.0,
    ),
    backgroundColor: Colors.white,
    body: screens[selected_index], 
    );
  }

  List<Widget> get screens => [
    JemputSampahForm(), //untuk halaman beranda
    RiwayatJemputSampah(), //untuk halaman riwayat
    Profile(),
  ];

  Widget navbar(IconData icon, String label, int index) {
    return InkWell(
      onTap: () => onNavbarTapped(index),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: selected_index == index ? Color.fromRGBO(102, 160, 116, 1) : Colors.black87),
          Text(label, style: TextStyle(color: selected_index == index ? Color.fromRGBO(102, 160, 116, 1) : Colors.black87),)
        ],
      )
    );
  }
}