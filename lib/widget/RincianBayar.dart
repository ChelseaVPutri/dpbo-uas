import 'package:flutter/material.dart';

class RincianBayar extends StatelessWidget {
  String label;
  String biaya;
  RincianBayar(this.label, this.biaya) {}

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(label),
      trailing: Text(biaya),
    );
  }
}