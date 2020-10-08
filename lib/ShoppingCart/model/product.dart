import 'package:flutter/material.dart';
import 'package:quick_ci/Product/model/product.dart';

class ShoppingCart {
  String total;
  String subtotal;
  List<Product> listItem;

  ShoppingCart({Key key, @required this.listItem, this.total, this.subtotal});
}
