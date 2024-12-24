import 'package:flutter/material.dart';

// class ProfilePicture {
//   String imagePath = 'https://via.placeholder.com/50';
//   ProfilePicture.network(imagePath); 
//   dynamic height = 50;
//   dynamic width = 50;
// }

class ProfileInfo {
  String username;
  String email;

  ProfileInfo({
    required this.username,
    required this.email,
  });
  
  static List<ProfileInfo> getInfo() {
    List<ProfileInfo> accInfo = [];

    accInfo.add(
      ProfileInfo(
        email: "blablaba@gmail.com",
        username: "Gacor Gasgasgas" 
      )
    );
    return accInfo;
  }
}