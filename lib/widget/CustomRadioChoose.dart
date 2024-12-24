import 'package:flutter/material.dart';

class CustomRadioChoose extends StatelessWidget {
  String label;
  String value;
  String? groupValue;
  ValueChanged<String?> onChanged;
  // VoidCallback onChanged;
  CustomRadioChoose(this.label, this.value, this.groupValue, this.onChanged) {}

  @override
  Widget build(BuildContext context) {
    ListTile choice = ListTile(
      title: Text(label),
      leading: Radio<String>(
        value: value,
        groupValue: groupValue,
        onChanged: onChanged,
      ),
    );
    return choice;
  }
}