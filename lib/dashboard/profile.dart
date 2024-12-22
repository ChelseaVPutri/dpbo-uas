import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dpbo/models/profile_config.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<ProfileInfo> accInfo = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            topContainer(),
          ],
        ), 
      )    
    );  
  }

  Column topContainer() {
    return Column(
      children: [
        Container(
          height: 330,
          decoration:const BoxDecoration(
          color: Color.fromRGBO(102, 160, 116, 1),
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(35, 0, 25, 50),
                child: ClipOval(
                  child: 
                  Image.network('https://via.placeholder.com/50',
                  height : 110,
                  width : 110,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
              const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [ //Profile Info
                  Text("Gacor Gasgasgas", style: TextStyle(fontSize: 20)),
                  Text("blablabbbla@gmail.com"), 
                ]
              ),
            ]
          ),
        )
      ]
    );
 } 

  Column midMenu() {
    return Column(
      children: [
      //   Padding(
      //   padding: const EdgeInsets.symmetric(vertical: 10.0),
      //   child: GridView.count(
      //     crossAxisCount: 4,
      //     shrinkWrap: true,
      //     physics: NeverScrollableScrollPhysics(),
      //     children: List.generate(4, (index) {
      //       return ElevatedButton(
      //         onPressed: () {
                
      //         },
      //         child: Text('[GoTo]'),
      //       );
      //     }),
      //   ),
      // ),
      ]
    );
  }
  
}