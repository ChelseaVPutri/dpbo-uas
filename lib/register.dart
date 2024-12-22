import 'package:dpbo/login.dart';
import 'package:flutter/material.dart';
import 'widget/CustomTextField.dart';
import 'widget/Button.dart';
import 'widget/LoginOrRegister.dart';
import 'package:dpbo/models/user-controller.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<StatefulWidget> createState() => _RegisterScreen();
}

class _RegisterScreen extends State<RegisterScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  // final formKey = GlobalKey<FormState>();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  // @override
  // void dispose() {
  //   username_controller.dispose();
  //   password_controller.dispose();
  //   super.dispose();
  // }

  // Future<void> register() async {
  //   if(formKey.currentState!.validate()) {
  //     final username = username_controller.text;
  //     final password = password_controller.text;
      
  //     try {
  //       int user_id = await dbHelper.registerUser(username, password);
  //       if(user_id >0) {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register Berhasil')));
  //         Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginScreen()));
  //       } else {
  //         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register Gagal')));
  //       }
  //     } catch(e) {
  //       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: $e'), backgroundColor: Colors.red,));
  //     }
  //   }
  // }

  void _register() async {
    String username = _usernameController.text;
    String password = _usernameController.text;
    
    if(username.isNotEmpty && password.isNotEmpty) {
      await _dbHelper.registerUser(username, password);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register berhasil. Silakan login')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Register gagal. Mohon isi semua kolom')));
    }
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
        child: Column(
          children: [
            ListTile(
              title: Text('REGISTER AKUN BARU', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),),),
            // CustomTextField('Email', controller),
            CustomTextField('Username', _usernameController),
            CustomTextField('Password', _passwordController),
            Button('REGISTER', _register),
            LoginOrRegister('Sudah punya akun?', 'Login', (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
            })
          ],
        )
      )
    );
  }
}