import 'package:flutter/material.dart';

Row recNewsletter() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Text(
            textAlign: TextAlign.center,
            'Rekomendasi Newsletter',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.w600
            ),
          ),
        ),
        Container(
          child: Image.asset('assets/images/placeholder.jpeg', height: 20, width: 20, fit: BoxFit.cover)
        )
      ],
    );
  }