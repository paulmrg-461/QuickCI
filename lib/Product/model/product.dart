import 'package:flutter/material.dart';

class Product {
  String name;
  String barcode;
  int price;
  String photoUrl;
  String quantity;
  String brand;
  String category;
  String iva;

  Product(
      {Key key,
      @required this.name,
      @required this.barcode,
      @required this.price,
      this.photoUrl,
      this.quantity,
      this.brand,
      this.category,
      this.iva});
}
