import 'package:carrot_app/cart/cart_provider.dart';
import 'package:carrot_app/widgets/counter_widget.dart';
import 'package:carrot_app/mainPage/mainpage_module.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';

class ProductDetials extends StatelessWidget {
  Items product;

  ProductDetials(this.product);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 30,
        ),
        onTap: () {
          Navigator.pop(context);
        },),
        title: Text(
          'Product Details',
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 5),
            child: Icon(
              Icons.favorite_border_outlined,
              color: Colors.black,
              size: 25,
            ),
          ),
        ],
      ),
      body: Column(children: [
        Container(
          child: Expanded(
              child: Column(children: [
            Container(
              child: Image.network(this.product.image),
              margin: EdgeInsets.only(left: 90, right: 90),
              padding: EdgeInsets.all(50),
            ),
            Container(
              padding: EdgeInsets.only(top: 10, bottom: 30),
              child: Column(
                children: [
                  Text(
                    '\$' + this.product.price.toString(),
                    style: TextStyle(
                        fontSize: 24,
                        color: Colors.green,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(this.product.name,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.only(top: 5),
                    child: Text(this.product.weight.toString(),
                        style: TextStyle(
                            fontSize: 16, color: HexColor('#7C7C7C'))),
                  ),
                ],
              ),
            ),
            Container(
                padding: EdgeInsets.only(top: 5, left: 10, right: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Product Details',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold)),
                    Padding(
                      padding: EdgeInsets.only(top: 5),
                      child: Text(this.product.description,
                          style: TextStyle(
                              fontSize: 13, color: HexColor('#7C7C7C'))),
                    )
                  ],
                ))
          ])),
        ),
        SizedBox(
            height: 80,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
              child: Consumer<CartProvider>(
                builder: (context, value, child) {
                  if (!value.purchases.containsKey(this.product)) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.green),
                      ),
                      child:
                          Text('Add To Cart', style: TextStyle(fontSize: 18)),
                      onPressed: () {value.addProduct(this.product);},
                    );
                  } else {
                    return Expanded(child: CounterHorizontal(this.product));
                  }
                },
              ),
            ))
      ]),
    );
  }
}
