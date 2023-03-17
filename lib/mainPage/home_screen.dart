import 'dart:convert';
import 'package:carrot_app/Authentication/signup_screen.dart';
import 'package:carrot_app/mainPage/Category/category_products.dart';

import 'load.dart';
import 'package:carrot_app/mainPage/Category/category_widget.dart';
import 'package:carrot_app/mainPage/mainpage_module.dart';
import 'package:carrot_app/widgets/main_screen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatelessWidget {
  Load load = Load();

  static const routeName = '/';

  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        backgroundColor: Colors.white,
        //leading: Container(child: Image.asset('assets/images/logo.png'),),
        title: Row(
          children: [
          Container(padding: EdgeInsets.only(top:10,left: 10), child: Image.asset('assets/images/Logo1.png',),),
          Container(padding: EdgeInsets.all(0), child: Text(
          'Carrot',
          style: TextStyle(color: HexColor('#828282')),
        ),)
        ],),
        actions: [
          Icon(
            Icons.location_on,
            color: HexColor('#828282'),
          ),
          Padding(
            padding: EdgeInsets.only(top: 15, right: 15, left: 5),
            child: Text('Home',
                style: TextStyle(fontSize: 16, color: HexColor('#828282'))),
          ),
        ],
      ),
      body: 
      Column(
        children: [
          CarouselSlider(
              items: [Image.asset('assets/images/slider.png')],
              options: CarouselOptions(
                autoPlay: true,
                enlargeCenterPage: true,
              )),
          Flexible(
            child: FutureBuilder(
              builder: ((context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    List<mainTypes> res = snapshot.data as List<mainTypes>;
                    return GridView.builder(
                        padding: EdgeInsets.only(left: 10, right: 10),
                        itemCount: res.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 3 / 3.5),
                        itemBuilder: ((context, index) => GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryProducts(res[index])));
                          },
                            child: CategoryContainer(
                                res[index].name, res[index].image))));
                  }
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              }),
              future: load.getData(),
            ),
          ),
        ],
      ),
    );
  }
}
