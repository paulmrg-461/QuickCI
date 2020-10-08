import 'package:flutter/material.dart';
import 'package:quick_ci/Product/model/product.dart';

class User {
  String uid;
  String name;
  String email;
  String photoURL;
  final List<Product> myShoppingCart;

  User(
      {Key key,
      @required this.uid,
      @required this.name,
      @required this.email,
      @required this.photoURL,
      this.myShoppingCart});
}
