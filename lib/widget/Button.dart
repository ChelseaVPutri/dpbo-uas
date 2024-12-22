import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  String label;
  VoidCallback onpressed;
  Button(this.label, this.onpressed){}

  @override
  Widget build(BuildContext context) {
    ElevatedButton button = ElevatedButton(onPressed: onpressed, child: Text(label));
    return button;

    // Container container = Container(
    //   height: 55,
    //   width: MediaQuery.of(context).size.width * 0.9,
    //   decoration: BoxDecoration(
    //     borderRadius: BorderRadius.circular(8),
    //     color: Color.fromRGBO(100, 156, 113, 1)
    //   ),
    //   child: TextButton(
    //     onPressed: onpressed,
    //     child: Text(label, style: TextStyle(color: Colors.white)))
    // );
    // return container;
  }
}