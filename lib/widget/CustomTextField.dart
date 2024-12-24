import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String label;
  TextEditingController controller;
  CustomTextField(this.label, this.controller) {}

  @override
  Widget build(BuildContext context) {
    TextFormField formField = TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        border: OutlineInputBorder()
      ),
      validator: (value) {
        if(value == null || value.isEmpty) {
          return 'Field ini wajib diisi';
        } return null;
      }
    );
    return formField;
  }
}

// class CustomTextField extends StatelessWidget {
//   String label;
//   TextEditingController controller;
//   CustomTextField(this.label, this.controller) {}

//   @override
//   Widget build(BuildContext context) {
//     Container container = Container(
//           margin: EdgeInsets.all(8),
//           padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             color: Color.fromRGBO(175, 206, 183, 1)
//           ),
//           child: TextFormField(
//             controller: controller,
//             validator: (value) {
//               if(value!.isEmpty) {
//                 return 'Wajib diisi';
//               } return null;
//             },
//             decoration: InputDecoration(
//               border: InputBorder.none,
//               hintText: label
//             ),
//           ),
//     );
//     return container;
//   }
// }

