import 'package:dpbo/home.dart';
import 'package:dpbo/register.dart';
import 'package:flutter/material.dart';
import 'widget/CustomTextField.dart';
import 'widget/Button.dart';
import 'widget/LoginOrRegister.dart';
import 'package:dpbo/models/controller.dart';
import 'package:dpbo/models/UserModel.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final DatabaseHelper db = DatabaseHelper();
  bool isLogin = false;

  login() async {
    var response = await db.login(Users(username: _usernameController.text, password: _passwordController.text));
    if(response == true) {
      if(!mounted) return;
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
    } else {
      setState(() {
        isLogin = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              ListTile(title: Text('LOGIN AKUN', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),),
              CustomTextField('Username', _usernameController),
              CustomTextField('Password', _passwordController),
              const SizedBox(height: 10),
              Button('LOGIN', (){if(formKey.currentState!.validate()) login();}),
              LoginOrRegister('Tidak punya akun?', 'Register', (){Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));}),
              isLogin? Text('Username atau password salah', style: TextStyle(color: Colors.red),) : SizedBox()
            ],
          )
        )
        
      )
    );
  }
}