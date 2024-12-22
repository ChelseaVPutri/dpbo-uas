import 'package:flutter/material.dart';

class LoginOrRegister extends StatelessWidget {
  String text;
  String login_or_register;
  VoidCallback onpressed;
  LoginOrRegister(this.text, this.login_or_register, this.onpressed) {}

  @override
  Widget build(BuildContext context) {
    Row row = Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text),
        TextButton(
          onPressed: onpressed,
          child: Text(login_or_register))
      ],
    );
    return row;
  }
}