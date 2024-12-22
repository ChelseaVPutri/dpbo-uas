import 'package:dpbo/home.dart';
import 'package:dpbo/register.dart';
import 'package:flutter/material.dart';
import 'widget/CustomTextField.dart';
import 'widget/Button.dart';
import 'widget/LoginOrRegister.dart';
import 'package:dpbo/models/user-controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() => _LoginScreen();
}

class _LoginScreen extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // @override
  // void dispose() {
  //   username_controller.dispose();
  //   password_controller.dispose();
  //   super.dispose();
  // }

  // Future<void> login() async {
  //   if(formKey.currentState!.validate()) {
  //     final username = username_controller.text;
  //     final password = password_controller.text;

  //     try {
  //       final user = await dbHelper.loginUser(username, password);
  //       if(user != null) {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Berhasil')));
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage()));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Gagal')));
  //       }
  //     } catch(e) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red,));
  //     }
  //   }
  // }

  void _login() async {
    String username = _usernameController.text;
    String password = _passwordController.text;
    final user = await _dbHelper.loginUser(username, password);
    if(user != null) {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Homepage(username: username,)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Login Gagal')));
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
        padding: EdgeInsets.all(12),
        child: Column(
          children: [
            ListTile(
              title: Text('LOGIN AKUN', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),),
            CustomTextField('Username', _usernameController),
            CustomTextField('Password', _passwordController),
            const SizedBox(height: 10),
            Button('LOGIN', _login),
            LoginOrRegister('Tidak punya akun?', 'Register', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterScreen()));
            })
          ],
        )
      )
    );
  }
}