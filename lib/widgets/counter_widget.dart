import 'package:carrot_app/cart/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

import '../mainPage/mainpage_module.dart';

class CounterVertical extends StatelessWidget {

  Items item;

  CounterVertical(this.item);
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Container(
      //height: 95,
      width: 40,
      margin: EdgeInsets.all(5),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: HexColor('#E0E0E0')),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: Column(
        children: [
          Container(
            child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon(
                  Icons.add,
                  color: Colors.green,
                ),
                onPressed: () {cart.increment(this.item);}),
            height: 30,
          ),
          Container(
            padding: EdgeInsets.only(top: 6),
            height: 35,
            width: MediaQuery.of(context).size.width,
            child: Text(
              cart.purchases[this.item].toString(),
              textAlign: TextAlign.center,
            ),
            decoration: BoxDecoration(
                color: Colors.green,
                border: Border(
                    bottom: BorderSide(color: HexColor('#E0E0E0')),
                    top: BorderSide(color: HexColor('#E0E0E0')))),
          ),
          Container(
              height: 30,
              child: IconButton(
                padding: EdgeInsets.zero,
                icon: Icon( (cart.purchases[this.item]==1) ? Icons.delete :
                  Icons.remove,
                  color: Colors.green,
                ),
                onPressed: () {
                  if(cart.purchases[this.item]==1){
                    cart.remove(this.item);
                  }else{
                    cart.decrement(this.item);
                  }
                },
              )),
        ],
      ),
    );
  }
}

class CounterHorizontal extends StatelessWidget {
  Items item;

  CounterHorizontal(this.item) ;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Container(
      margin: EdgeInsets.only(left: 90, right: 90),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: HexColor('#E0E0E0')),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: FittedBox(
        child: Row(children: [
          IconButton(
            padding: EdgeInsets.only(right: 15),
            onPressed: () {if(cart.purchases[this.item]==1){
              cart.remove(this.item);
            }else{
              cart.decrement(this.item);
            }},
            icon: Icon((cart.purchases[this.item]==1) ?
              Icons.delete : Icons.remove, color: Colors.green,),
            iconSize: 30,
          ),
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            width: 70,
            height: 49,
            child: Text(
              cart.purchases[this.item].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(left: 15),
            onPressed: () {cart.increment(this.item);},
            icon: Icon(Icons.add, color: Colors.green,),
            iconSize: 30,
          ),
        ]),
      ),
    );
  }
}

class CounterCart extends StatelessWidget {
  Items item;

  CounterCart(this.item) ;

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);
    return Container(
      height: 45,
      width: 100,
      //margin: EdgeInsets.only(left: 90, right: 90),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: HexColor('#E0E0E0')),
          borderRadius: BorderRadius.all(Radius.circular(5))),
      child: FittedBox(
        child: Row(children: [
          IconButton(
            //padding: EdgeInsets.only(right: 5),
            onPressed: () {if(cart.purchases[this.item]==1){
              cart.remove(this.item);
            }else{
              cart.decrement(this.item);
            }},
            icon: Icon((cart.purchases[this.item]==1) ?
              Icons.delete : Icons.remove, color: Colors.green,),
            //iconSize: 30,
          ),
          Container(
            padding: EdgeInsets.all(0),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            width: 40,
            height: 60,
            child: Text(
              cart.purchases[this.item].toString(),
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
          ),
          IconButton(
            padding: EdgeInsets.only(left: 5),
            onPressed: () {cart.increment(this.item);},
            icon: Icon(Icons.add, color: Colors.green,),
            //iconSize: 30,
          ),
        ]),
      ),
    );
  }
}
