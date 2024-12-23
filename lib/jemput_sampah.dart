
import 'package:dpbo/widget/JemputModel.dart';
import 'package:dpbo/widget/dropdown.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'confirm_page.dart';
import 'package:dpbo/widget/dropdown.dart';

class JemputSampahPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Jemput Sampah", style: TextStyle(color: Colors.white),),
        backgroundColor: Color.fromRGBO(102, 160, 116, 1)
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              // Address Container
              Container(
                color: Colors.blue[50], // Azure equivalent
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Address',
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    TextField( //AddressBox
                    onChanged: (text) {
                    print('First text field: $text');
                      },
                    ),  
                  ],
                ),
              ),

              SizedBox(height: 10),

              // Price Option
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Berat Sampah', style: TextStyle(fontSize: 16)),
                  SizedBox(
                    width: 100,
                    child: TextField(
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 10),

              // Courier Container
              Container(
              padding: const EdgeInsets.all(10.0),
              child: Column( // Use Column to properly stack the widgets vertically
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Courier Option',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Text('Blblb', style: TextStyle(fontSize: 16)),
                    ]
                  ),

                  SizedBox(height: 10), // Correctly specified height as a named argument
              
              // Summary Section
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Rincian',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ...List.generate(3, (index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Blblb', style: TextStyle(fontSize: 16)),
                        Text('Rp.--', style: TextStyle(fontSize: 16)),
                      ],
                    );
                  }),
                ],
              ),

              SizedBox(height: 20),

              // Button
              JemputModelButton(
              'Jemput', 
              (context) {
              Navigator.push(context,
              MaterialPageRoute(builder: (context) => ConfirmPage()),
                  );
                }
              ),
                ]
                )
              )
            ]
          )
        )
      )
    );
            
  }
}