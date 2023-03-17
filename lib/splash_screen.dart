import 'package:carrot_app/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class splashPage extends StatefulWidget {
  const splashPage({Key? key}) : super(key: key);

  @override
  State<splashPage> createState() => _splashPageState();
}

class _splashPageState extends State<splashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Future.delayed(Duration(seconds: 5)).then((value) => {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthWrapper()))
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
      child: Expanded(
        child: 
          Image.asset('assets/images/launch_image.png')
        ,
      ),
    ),
    );
  }
}