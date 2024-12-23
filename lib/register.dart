import 'package:dpbo/login.dart';
import 'package:flutter/material.dart';
import 'widget/CustomTextField.dart';
import 'widget/Button.dart';
import 'widget/LoginOrRegister.dart';
import 'package:dpbo/models/controller.dart';
import 'package:dpbo/models/UserModel.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  register() {
    final db = DatabaseHelper();
    db.register(Users(username: _usernameController.text, password: _passwordController.text)).whenComplete(() {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register berhasil. Silakan login')));
      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // TextEditingController _controller = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Register'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child:Form(
          key: formKey,
          child: Column(
            children: [
              ListTile(title: Text('REGISTER AKUN BARU', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),),
              // CustomTextField('Email', controller),
              CustomTextField('Username', _usernameController),
              CustomTextField('Password', _passwordController),
              Button('REGISTER', (){if(formKey.currentState!.validate()) register();}),
              LoginOrRegister('Sudah punya akun?', 'Login', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            })
            ],
          )
        )         
      )
    );
  }
}