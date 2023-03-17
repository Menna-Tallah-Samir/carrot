import 'package:carrot_app/mainPage/mainpage_module.dart';
import 'package:carrot_app/mainPage/Product/product_component.dart';
import 'package:carrot_app/mainPage/Product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class CategoryProducts extends StatelessWidget {
  mainTypes category;

  CategoryProducts(this.category);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: GestureDetector(child: Icon(
          Icons.arrow_back_ios_new_rounded,
          color: Colors.black,
          size: 30,
        ),
        onTap: (() {
          Navigator.pop(context);
        })),
        title: Text(
          category.name,
          style: TextStyle(color: Colors.black, fontSize: 18),
        ),
      ),
      body: GridView.builder(
        padding: EdgeInsets.all(10),
        itemCount: category.items.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 3 / 4),
          itemBuilder: ((context, index) => GestureDetector(child:  ProductCard(category.items[index]),
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetials(category.items[index]))),)
             )),
    );
  }
}
