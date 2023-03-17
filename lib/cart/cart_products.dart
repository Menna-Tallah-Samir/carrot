import 'package:carrot_app/cart/cart_component.dart';
import 'package:carrot_app/cart/cart_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import 'order_success.dart';

class CartPurchases extends StatelessWidget {
  const CartPurchases({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    final product = cart.purchases.keys;
    return Column(children: [
      Expanded(
          child: ListView.builder(
              itemCount: cart.purchases.length,
              itemBuilder: (context, index) {
                return CartProductComponent(product.elementAt(index));
              })),
      Container(
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: HexColor('#E0E0E0')),
              borderRadius: BorderRadius.all(Radius.circular(10))),
          margin: EdgeInsets.only(bottom: 25, left: 15, right: 15),
          child: Row(children: [
            Container(
                alignment: Alignment.center,
                height: 50,
                child: Consumer<CartProvider>(builder: (context, value, child) => Text(
                  '\$'+value.getTotalPrice().toStringAsFixed(2),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),),
                width: 90),
            Expanded(
                child: Container(
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  cart.checkout();
                Navigator.push(context, MaterialPageRoute(builder: (context) => OrderAccepted()));},
                child: Text(
                  'Checkout',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(10),
                            bottomRight: Radius.circular(10))))),
              ),
            ))
          ])),
    ]);
  }
}
