import 'package:dpbo/login.dart';
import 'package:flutter/material.dart';
import 'widget/CustomTextField.dart';
import 'widget/Button.dart';
import 'widget/LoginOrRegister.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            ListTile(
              title: Text('REGISTER AKUN BARU', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),),
            // CustomTextField('Email', controller),
            CustomTextField('Username', controller),
            CustomTextField('Password', controller),
            const SizedBox(height: 10),
            Button('REGISTER', (){
              if(formKey.currentState!.validate()) {
                //login method
              }
            }),
            LoginOrRegister('Sudah punya akun?', 'Login', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            })
          ],
        )
      )
    );
  }
}