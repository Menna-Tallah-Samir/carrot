import 'package:carrot_app/mainPage/home_screen.dart';
import 'package:carrot_app/widgets/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 180, bottom: 30),
          child: Image.asset(
            'assets/images/empty.jpg',
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(
            'Your Cart Is Empty',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            textAlign: TextAlign.center,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 5, bottom:15),
          child: Text(
            "Looks like you haven't made\nyour choice yet",
            style: TextStyle(fontSize: 16, color: HexColor('#7C7C7C')),
            textAlign: TextAlign.center,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: 75,
          padding: EdgeInsets.only(top: 25, right: 15,left:15),
          child: ElevatedButton(
            style: ButtonStyle(backgroundColor: MaterialStateColor.resolveWith((states) => Colors.green)),
            onPressed: () {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => mainPage()), (route) => false);
            }, child: Text('Start Shopping'),)),
      ],
    ));
  }
}
