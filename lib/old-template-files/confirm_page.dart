// // import 'package:dpbo/home.dart';
// // import 'package:dpbo/sampah-anorganik/antar_sampah.dart';
// import 'package:flutter/material.dart';
// import '../widget/JemputModel.dart';

// class ConfirmPage extends StatelessWidget {
//   const ConfirmPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color.fromRGBO(102, 160, 116, 1)
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Text('Pesanan Sudah diterima! Mohon menunggu, Terima Kasih'
//             , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold), textAlign: TextAlign.center,
//             ),
//             SizedBox(height: 50), // Space between text and button
//             JemputModelButton(
//              'Lihat Riwayat Pesanan' , 
//              (context) {
//               Navigator.push(context,
//               MaterialPageRoute(builder: (context) => AntarSampahPage()),
//               );
//              }
//            )
//         ]
//       )
//      )
//     );
//   }
// }