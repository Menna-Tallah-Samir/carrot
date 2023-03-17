import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import '../mainPage/mainpage_module.dart';

class CartProvider with ChangeNotifier {
  final cart = FirebaseFirestore.instance
      .collection('Cart')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  final orders = FirebaseFirestore.instance
      .collection('Order')
      .doc(FirebaseAuth.instance.currentUser!.uid);
  Map<Items, int> purchases = Map();

  void addProduct(Items item) async {
    purchases[item] = 1;
    await cart.set(
      {
        'items': purchases.entries.map((e) {
          return {
            'id': e.key.id,
            'name': e.key.name,
            'weight': e.key.weight,
            'price': e.key.price,
            'image': e.key.image,
            'description': e.key.description,
            'quantity': e.value
          };
        }).toList(),
      },
    );
    notifyListeners();
  }

  void increment(Items item) async {
    purchases.update(item, ((value) => value + 1));
    await cart.set(
      {
        'items': purchases.entries.map((e) {
          return {
            'id': e.key.id,
            'name': e.key.name,
            'weight': e.key.weight,
            'price': e.key.price,
            'image': e.key.image,
            'description': e.key.description,
            'quantity': e.value
          };
        }).toList(),
      },
    );
    notifyListeners();
  }

  void decrement(Items item) async {
    purchases.update(item, (value) => value - 1);
    await cart.set(
      {
        'items': purchases.entries.map((e) {
          return {
            'id': e.key.id,
            'name': e.key.name,
            'weight': e.key.weight,
            'price': e.key.price,
            'image': e.key.image,
            'description': e.key.description,
            'quantity': e.value
          };
        }).toList(),
      },
    );
    notifyListeners();
  }

  void remove(Items item) async {
    purchases.remove(item);
    await cart.set(
      {
        'items': purchases.entries.map((e) {
          return {
            'id': e.key.id,
            'name': e.key.name,
            'weight': e.key.weight,
            'price': e.key.price,
            'image': e.key.image,
            'description': e.key.description,
            'quantity': e.value
          };
        }).toList(),
      },
    );
    notifyListeners();
  }

  void checkout() async {
    await orders.set(
      { 'TotalPrice': getTotalPrice(),
        'items': purchases.entries.map((e) {
          return {
            'id': e.key.id,
            'name': e.key.name,
            'weight': e.key.weight,
            'price': e.key.price,
            'image': e.key.image,
            'description': e.key.description,
            'quantity': e.value
          };
        }).toList(),
      },
    );
    purchases.clear();
    await cart.delete();
    notifyListeners();
  }

  double getTotalPrice(){
    double prices = 0.0;
    purchases.forEach((key, value) {prices = prices + key.price!*value;});
    return prices;
  }

  void clear() async{
    purchases.clear();
    await cart.delete();
    notifyListeners();
  }
}
