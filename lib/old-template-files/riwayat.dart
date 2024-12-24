import 'package:flutter/material.dart';
import 'riwayat-model.dart';

class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<HistoryModel> history = HistoryModel.getHistory();

    return Scaffold(
      appBar: AppBar(
        title: Text("Riwayat"),
        backgroundColor: Colors.green,
      ),
      body: history.isEmpty
          ? Center(
              child: Text(
                "Tidak ada riwayat.",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            )
          : ListView.builder(
              itemCount: history.length,
              itemBuilder: (context, index) {
                var item = history[index];
                return Card(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: ListTile(
                    leading: Icon(Icons.history, color: Colors.green),
                    title: Text(item.serviceType),
                    subtitle:
                        Text("Tanggal: ${item.date}\nBerat: ${item.weight} kg"),
                    trailing: Text("Rp ${item.cost}",
                        style: TextStyle(color: Colors.green)),
                  ),
                );
              },
            ),
    );
  }
}
