import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:quick_ci/Product/model/product.dart';
import 'package:quick_ci/Product/ui/screens/product_list_screen.dart';
import 'package:quick_ci/Product/ui/widgets/card_product.dart';
import 'package:quick_ci/Product/ui/widgets/product_detail_content.dart';
import 'package:quick_ci/User/model/user.dart';
import 'package:quick_ci/widgets/alert_dialog.dart';
import 'package:toast/toast.dart';

class CloudFirestoreAPI {
  final String USERS = "users";
  final String PRODUCTS = "products";
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;

  void updateUserData(User user) async {
    DocumentReference ref = _db.collection(USERS).document(user.uid);
    return await ref.setData({
      'uid': user.uid,
      'name': user.name,
      'email': user.email,
      'photoURL': user.photoURL,
      'myPlaces': user.myShoppingCart,
      'lastSignIn': DateTime.now()
    }, merge: true);
  }

  List<CardProduct> buildProducts(List<DocumentSnapshot> productsListSnapshot) {
    List<CardProduct> cardProducts = List<CardProduct>();
    productsListSnapshot.forEach((p) {
      cardProducts.add(CardProduct(Product(
          name: p.data["name"],
          barcode: p.data["barcode"].toString(),
          price: p.data["price"],
          photoUrl: p.data["category"],
          quantity: p.data["quantity"].toString())));
    });
    return cardProducts;
  }

  buildProductById(String barcode, BuildContext context) {
    Product product;
    _db
        .collection("products")
        .document(barcode)
        .get()
        .then((DocumentSnapshot snapshot) {
      try {
        product = Product(
            name: snapshot.data["name"],
            brand: snapshot.data["brand"],
            photoUrl: snapshot.data["name"],
            category: snapshot.data["category"],
            iva: snapshot.data["iva"],
            barcode: snapshot.data["barcode"].toString(),
            price: snapshot.data["price"]);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetailContent(product)));
      } catch (e) {
        Toast.show(
            "Lo sentimos, el producto aún no ha sido registrado en la base de datos. Por favor intenta más tarde.",
            context,
            duration: Toast.LENGTH_LONG,
            gravity: Toast.BOTTOM);
        /* showAlertDialog(context, "Aceptar", "El producto no existe",
            "Lo sentimos, el producto aún no ha sido registrado en la base de datos. Por favor intenta más tarde."); */

        print("Ha ocurrido un error en la lectura del producto. $e");
      }
    });
  }
}
