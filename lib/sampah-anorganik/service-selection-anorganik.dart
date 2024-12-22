import 'package:flutter/material.dart';
import 'package:dpbo/models/ServiceModel.dart';
import 'package:flutter_svg/svg.dart';
import 'jemput_sampah.dart';
import 'antar_sampah.dart';

class AnorganikServiceSelection extends StatelessWidget {
  List <ServiceModel> service = [
    ServiceModel(
      'Jemput Sampah',
      'assets/icons/pickup.svg',
      (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => JemputSampahPage()),
        );
      },
    ),
    ServiceModel(
      'Antar Sampah',
      'assets/icons/deliver.svg',
      (context) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AntarSampahPage()),
        );
      },
    ),
  ];
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Pilih Layanan", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(102, 160, 116, 1)
      ),
      body: Container(
        height: 120,
        child: ListView.separated(
        scrollDirection: Axis.horizontal,
        // padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        padding: EdgeInsets.only(left: 20, right: 20),
        itemCount: service.length,
        separatorBuilder: (context, index) => SizedBox(width: 25,),
        itemBuilder: (context, index) {
          return service[index]; 
        }
       )
     )
    );
  }
}


