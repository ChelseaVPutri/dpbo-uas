import 'package:flutter/material.dart';
import 'package:dpbo/models/JemputSampahModel.dart';
import 'package:dpbo/models/controller.dart';

// class RiwayatJemputSampah extends StatefulWidget {
//   @override
//   _RiwayatJemputSampah createState() => _RiwayatJemputSampah();
// }

// class _RiwayatJemputSampah extends State<RiwayatJemputSampah> {
//   final DatabaseHelper _dbHelper = DatabaseHelper();
//   List<JemputSampah> _riwayatJemput = [];

//   @override
//   void initState() {
//     super.initState();
//     _loadJemputSampahData();
//   }

//   _loadJemputSampahData() async {
//     final List<JemputSampah> jemputSampahList = await _dbHelper.getJemputSampah();
//     setState(() {
//       _riwayatJemput = jemputSampahList;
//     });

// }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Riwayat Jemput Sampah'),
//         centerTitle: true,
//       ),
//       body: _riwayatJemput.isEmpty
//           ? Center(child: Text('Tidak ada riwayat jemput sampah'))
//           : ListView.builder(
//               itemCount: _riwayatJemput.length,
//               itemBuilder: (context, index) {
//                 final JemputSampah = _riwayatJemput[index];
//                 String order_number = JemputSampah.order_number;
//                 return Card(
//                   child: ListTile(
//                     title: Text('Nomor Order: $order_number'),
//                     subtitle: Text('Status: $_riwayatJemput[index].status'),
//                   ),
//                 );
//               },
//             ),
//     );
//   }
// }

class RiwayatJemputSampah extends StatefulWidget {
  RiwayatJemputSampah({super.key});

  @override
  State<RiwayatJemputSampah> createState() => _RiwayatJemputSampahPageState();
}

class _RiwayatJemputSampahPageState extends State<RiwayatJemputSampah> {
  late Future<List<JemputSampah>> jemputSampahList;
  late DatabaseHelper handler;

  @override
  void initState() {
    handler = DatabaseHelper();
    jemputSampahList = handler.getJemputSampah();
    handler.initDB().whenComplete(() {
      jemputSampahList = getAllJemputSampah();
    });
    super.initState();
  }

  Future<List<JemputSampah>> getAllJemputSampah() {
    return handler.getJemputSampah();
  }

  Future<void> _refresh() async {
    setState(() {
      jemputSampahList = getAllJemputSampah();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Riwayat Jemput Sampah'),
        centerTitle: true,
      ),
      body: FutureBuilder<List<JemputSampah>>(
        future: jemputSampahList,
        builder: (BuildContext context, AsyncSnapshot <List<JemputSampah>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isEmpty) {
            return Center(child: Text('Tidak ada riwayat penjemputan sampah'));
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else {
            final order = snapshot.data ?? <JemputSampah>[];
            return ListView.builder(
              itemCount: order.length,
              itemBuilder: (context, index) {
                // final jemputSampah = snapshot.data![index];
                return ListTile(
                  title: Text('Order Number: ${order[index].jemput_id}'),
                  subtitle: Text('Alamat: ${order[index].alamat}'),
                );
              },
            );
          }
        },
      ),
    );
  }
}