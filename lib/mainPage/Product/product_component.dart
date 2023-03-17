import 'package:carrot_app/cart/cart_provider.dart';
import 'package:carrot_app/mainPage/mainpage_module.dart';
import 'package:carrot_app/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  Items product;
  ProductCard(this.product);

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.topEnd,
              children: [
                Card(
                  margin: EdgeInsets.only(top: 20, left: 20, right: 20),
                  color: HexColor('#FCFCFC'),
                  shape: RoundedRectangleBorder(
                      side: BorderSide(color: HexColor('#E0E0E0')),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                      padding: EdgeInsets.all(40),
                      child: Image.network(product.image)),
                ),
                Consumer<CartProvider>(builder: ((context, value, child) {
                  if (value.purchases.containsKey(this.product)) {
                    return CounterVertical(this.product);
                  } else {
                    return FloatingActionButton.small(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: HexColor('#FCFCFC')),
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: () {
                        context.read<CartProvider>().addProduct(this.product);
                      },
                      child: Icon(
                        Icons.add,
                        color: Colors.green,
                      ),
                    );
                  }
                }))
              ],
            ),
            Padding(
                padding: EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$' + product.price.toString(),
                      style: TextStyle(
                          fontSize: 15,
                          color: Colors.green,
                          fontWeight: FontWeight.bold),
                    ),
                    Text(product.name,
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.bold)),
                    Text(product.weight, style: TextStyle(fontSize: 14)),
                  ],
                ))
          ],
        ));
  }
}
