import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';

class CategoryContainer extends StatelessWidget {
  String title = '';
  String image = '';
  CategoryContainer(this.title, this.image);

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: HexColor('#000000'),
      child: GridTile(
        header: Padding(
            padding: EdgeInsets.all(8),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.bold),
            )),
        child: Padding(
            padding: EdgeInsets.only(top:30, right: 20, left:20),
            child: Image.network(
              image,
            )),
      ),
    );
  }
}
