import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class listComponent extends StatelessWidget {
  Widget first;
  String title;
  Widget last;
  listComponent(this.first,this.title, this.last);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: FittedBox(child:this.first),
      title: Text(this.title,style: TextStyle(color: HexColor('#828282'), fontSize: 16)),
      trailing: last
    );
  }
}