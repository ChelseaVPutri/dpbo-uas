import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ServiceModel extends StatelessWidget {
  String name;
  String icon_path;
  Function(BuildContext) onPressed;
  ServiceModel(this.name, this.icon_path, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(context),
      child: Container(
        alignment: Alignment.center,
        width: 100,
        decoration: BoxDecoration(color: Color.fromRGBO(154, 182, 155, 1), borderRadius: BorderRadius.circular(16)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: Colors.white, shape: BoxShape.circle),
              child: Padding(
                padding: const EdgeInsets.all(8),
                child: SvgPicture.asset(icon_path),
              ),
            ),
            Text(name, textAlign: TextAlign.center,
            style: TextStyle(fontWeight: FontWeight.w400, color: Colors.black, fontSize: 14)
            )
          ],
        ) ,
      )
    );
  }
}

// class ServiceModel {
//   String name;
//   String iconPath;
//   Color boxColor;

//   ServiceModel({
//     required this.name,
//     required this.iconPath,
//     required this.boxColor
//   });

//   static List<ServiceModel> getService() {
//     List<ServiceModel> service = [];

//     service.add(
//       ServiceModel(
//         name: 'Jemput Sampah',
//         iconPath: 'assets/icons/pickup.svb',
//         boxColor: Color.fromRGBO(154, 182, 155, 1)
//         )
//     );

//     service.add(
//       ServiceModel(
//         name: 'Antar Sampah',
//         iconPath: 'assets/icons/deliver.svg',
//         boxColor: Color.fromRGBO(154, 182, 155, 1)
//         )
//     );

//     return service;
//   }
// }
