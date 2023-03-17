import 'package:carrot_app/widgets/counter_widget.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import '../mainPage/mainpage_module.dart';

class CartProductComponent extends StatelessWidget {
  Items item;

  CartProductComponent(this.item);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.only(top:5, left: 15,right:15),
      visualDensity: VisualDensity(vertical: VisualDensity.maximumDensity),
      leading: Image.network(this.item.image),
      title: Padding(padding: EdgeInsets.only(top:10), child:
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
        Text(this.item.name, style: TextStyle(fontSize: 16, fontWeight:FontWeight.bold)),
        Text(this.item.weight, style: TextStyle(fontSize: 14, color: HexColor('#7C7C7C'))),
          Text('\$'+this.item.price.toString(), style: TextStyle(fontSize: 18, fontWeight:FontWeight.bold, color: Colors.green))
      ])),
      trailing:  Padding(child:CounterCart(this.item),padding: EdgeInsets.only(top:10),)
    );
  }
}