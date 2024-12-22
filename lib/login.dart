import 'package:dpbo/register.dart';
import 'package:flutter/material.dart';
import 'widget/CustomTextField.dart';
import 'widget/Button.dart';
import 'widget/LoginOrRegister.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  TextEditingController controller = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          children: [
            ListTile(
              title: Text('LOGIN AKUN', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),),
            CustomTextField('Username', controller),
            CustomTextField('Password', controller),
            const SizedBox(height: 10),
            Button('LOGIN', (){
              if(formKey.currentState!.validate()) {
                //login method
              }
            }),
            LoginOrRegister('Tidak punya akun?', 'Register', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
            })
          ],
        )
      )
    );
  }
}