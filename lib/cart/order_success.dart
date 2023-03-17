import 'package:carrot_app/mainPage/home_screen.dart';
import 'package:carrot_app/widgets/main_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class OrderAccepted extends StatelessWidget {
  const OrderAccepted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(right: 42, top: 10),
              child: Image.asset(
                'assets/images/success.png',
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 5, right: 5, bottom: 5, top: 10),
              child: Text(
                'Your Order Has Been Accepted',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
                padding: EdgeInsets.all(5),
                child: Text(
                  "We have accepted your order, and we're\ngetting it ready.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                  textAlign: TextAlign.center,
                )),
            Container(
              height: 62,
              padding: EdgeInsets.only(left:15, right:15, top:15,),
              width: MediaQuery.of(context).size.width,
              child:
                  ElevatedButton(onPressed: () {}, child: Text('Track Order', style: TextStyle(fontSize: 15, fontWeight:FontWeight.bold)), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.green)),),
            ),
            Padding(padding: EdgeInsets.only(top:8), child:TextButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => mainPage()), (route) => false);
                },
                child: Text('Back Home',
                    style: TextStyle(fontSize: 15, color: Colors.black,fontWeight: FontWeight.bold))))
            
          ],
        ),
      ),
    );
  }
}
