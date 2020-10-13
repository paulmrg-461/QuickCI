import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:quick_ci/Product/model/product.dart';
import 'package:quick_ci/Product/ui/widgets/card_product.dart';
import 'package:quick_ci/Product/ui/widgets/product_detail_content.dart';
import 'package:quick_ci/User/model/user.dart';

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

  List<ProductDetailContent> buildProductByBarcode(
      List<DocumentSnapshot> productByBarcodeSnapshot) {
    List<ProductDetailContent> productByBarcode = List<ProductDetailContent>();
    productByBarcodeSnapshot.forEach((pb) {
      productByBarcode.add(ProductDetailContent(Product(
          name: pb.data["name"],
          barcode: pb.data["barcode"].toString(),
          price: pb.data["price"],
          photoUrl: pb.data["name"],
          quantity: pb.data["quantity"].toString(),
          brand: pb.data["brand"],
          category: pb.data["category"],
          iva: pb.data["iva"])));
    });
    return productByBarcode;
  }
}
