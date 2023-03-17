import 'package:carrot_app/cart/cart_products.dart';
import 'package:carrot_app/cart/cart_provider.dart';
import 'package:carrot_app/cart/empty_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Cart extends StatelessWidget {
  static const routeName = '/cart';

  Cart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(icon:Icon(
          Icons.close,
          color: Colors.black,), onPressed: (){Navigator.of(context).pop();},
        ),
        title: Text(
          'Cart',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(child:Icon(
              Icons.delete_outline,
              color: Colors.black,
            ), onTap:() {
              cart.clear();
            }),
          ),
        ],
      ),
      body: (cart.purchases.isEmpty) ? EmptyCart() : CartPurchases(),
    );
  }
}
