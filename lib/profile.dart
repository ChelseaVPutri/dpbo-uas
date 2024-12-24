import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:dpbo/widget/profile_config.dart';
import 'package:dpbo/widget/Button.dart';

// class Profile extends StatefulWidget {
//   final String username;
//   Profile({required this.username});
//   // Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

class Profile extends StatelessWidget {
  // final String username;
  // Profile({required this.username});
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profil'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Text('Username: $username'),
            // SizedBox(height: 16,),
            Button('Logout', (){
              
            })
            
          ],
        ),
      ),
    );
  }

//   Column topContainer() {
//     return Column(
//       children: [
//         Container(
//           height: 330,
//           decoration:const BoxDecoration(
//           color: Color.fromRGBO(102, 160, 116, 1),
//           borderRadius: BorderRadius.vertical(bottom: Radius.circular(30))
//           ),
//           child: Row(
//             children: [
//               // Padding(
//               //   padding: const EdgeInsets.fromLTRB(35, 0, 25, 50),
//               //   child: ClipOval(
//               //     child: 
//               //     Image.network('https://via.placeholder.com/50',
//               //     height : 110,
//               //     width : 110,
//               //     fit: BoxFit.cover,
//               //     ),
//               //   ),
//               // ),
//               const Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [ //Profile Info
//                   Text("Gacor Gasgasgas", style: TextStyle(fontSize: 20)),
//                   Text("blablabbbla@gmail.com"), 
//                 ]
//               ),
//             ]
//           ),
//         )
//       ]
//     );
//  } 


  
}