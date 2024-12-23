import 'package:flutter/material.dart';

class ConfirmPage extends StatelessWidget {
  const ConfirmPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(102, 160, 116, 1)
      ),
      body: Center(
        child: Column(
          children: [
            Text('Pesanan Sudah diterima! Mohon Menunggu, Terima Kasih'
            , style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
          ],
        ),
      ),
    );
  }
}