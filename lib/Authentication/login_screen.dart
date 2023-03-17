import 'package:carrot_app/Authentication/auth.dart';
import 'package:carrot_app/Authentication/signup_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class login extends StatelessWidget {
  static const routeName = '/login';

  login({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
        Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: <Widget>[
            Image.asset(
              'assets/images/login.png', width: double.infinity, fit: BoxFit.cover,
            ),
            const Positioned(
              left: 18,
              bottom: 25,
              child: Text(
              'Login',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 36,),
            ),
            )
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            controller: email,
            decoration: InputDecoration(
              labelText: 'Email',
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20, bottom: 0),
          child: TextField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              labelText: 'Password',
            ),
          ),
        ),
        Container(
          alignment: AlignmentDirectional.centerEnd,
          padding: const EdgeInsets.only(right: 16),
          child: TextButton(onPressed: () {}, 
            child: const Text('Forgot password?', style:  TextStyle (color: Colors.green),))
        ),
        Container(
          width: double.infinity,
          height: 50,
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: 
          ElevatedButton(onPressed: () {
            context.read<AuthService>().signIn(this.email.text.trim(), this.password.text.trim());
          },
            style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color>(Colors.green),),
            child: const Text('Login', style: TextStyle(color: Colors.white),),
          ),
        ),
        Padding(padding: EdgeInsets.only(top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          const Text('Dont have any account?'),
          TextButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp()));
          }, 
            child: const Text('Create One', style:  TextStyle (color: Colors.green),))
        ],)
        ,)
      ]),
    )
      ,);
  }
}
