import 'package:carrot_app/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:carrot_app/Authentication/auth.dart';

class SignUp extends StatelessWidget {
  SignUp({Key? key}) : super(key: key);

  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController verpassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 60,
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(icon: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.black,
          ),
          onPressed: () => Navigator.pop(context),),
        ),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(left: 20, top: 50, bottom: 20),
              child: const Text(
                'Register',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 35),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
              child: TextField(
                controller: password,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20, bottom: 30),
              child: TextField(
                controller: verpassword,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Verify Password',
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 50,
              padding: const EdgeInsets.only(
                left: 20,
                right: 20,
              ),
              child: ElevatedButton(
                onPressed: () {
                  context.read<AuthService>().signUp(this.email.text.trim(), this.password.text.trim(), this.verpassword.text.trim(), context);
                  //Navigator.pop(context);
                  //auth.signUp(
                  //    this.email.text.trim(), this.password.text.trim(),this.verpassword.text.trim());
                  //if(auth.authStateChange!=null) {
                  //  Navigator.push(context,
                  //      MaterialPageRoute(builder: (context) => Profile()));
                  //}
                },
                style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.green),
                ),
                child: const Text(
                  'Register',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 20),
              child: const Text(
                'By creating an account, you are agreeing to our',
                style: TextStyle(fontSize: 12),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Terms of Service',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    )),
                const Text(
                  'and',
                  style: TextStyle(fontSize: 12),
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Privacy Policy',
                      style: TextStyle(color: Colors.green, fontSize: 12),
                    )),
              ],
            )
          ]),
        ));
  }
}
