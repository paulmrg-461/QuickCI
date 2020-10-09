import 'package:flutter/material.dart';

class Product {
  String name;
  String barcode;
  String price;
  String photoUrl;
  String quantity;

  Product({
    Key key,
    @required this.name,
    @required this.barcode,
    @required this.price,
    @required this.photoUrl,
    @required this.quantity,
  });
}
