import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:quick_ci/Product/model/product.dart';
import 'package:quick_ci/Product/ui/widgets/card_product.dart';
import 'package:quick_ci/Product/ui/widgets/product_detail_content.dart';
import 'package:quick_ci/User/model/user.dart';
import 'package:quick_ci/User/repository/auth_repository.dart';
import 'package:quick_ci/User/repository/cloud_firestore_API.dart';
import 'package:quick_ci/User/repository/cloud_firestore_repository.dart';

class UserBloc implements Bloc {
  final _auth_repository = AuthRepository();
  Stream<FirebaseUser> streamFirebase =
      FirebaseAuth.instance.onAuthStateChanged;

  Stream<FirebaseUser> get authStatus => streamFirebase;
  Future<FirebaseUser> get currentUser => FirebaseAuth.instance.currentUser();
  Future<FirebaseUser> signIn() => _auth_repository.signInFirebase();
  final _cloudFirestoreRepository = CloudFirestoreRepository();
  void updateUserData(User user) =>
      _cloudFirestoreRepository.updateUserDataFirestore(user);

  Stream<QuerySnapshot> productsListStream = Firestore.instance
      .collection(CloudFirestoreAPI().PRODUCTS)
      .orderBy("name")
      .snapshots();
  Stream<QuerySnapshot> get productsStream => productsListStream;
  List<CardProduct> buildProducts(
          List<DocumentSnapshot> productsListSnapshot) =>
      _cloudFirestoreRepository.buildProducts(productsListSnapshot);

  /*  Stream<QuerySnapshot> productByBarcode(String barcode) => Firestore.instance
      .collection("products")
      .where("barcode",
          isEqualTo: Firestore.instance.document("products/${barcode}"))
      .snapshots(); */

  Stream<QuerySnapshot> productByBarcode(String barcode) => Firestore.instance
      .collection("products")
      .where("barcode", isEqualTo: barcode)
      .snapshots();

  List<ProductDetailContent> buildProductByBarcode(
          List<DocumentSnapshot> productByBarcodeSnapshot) =>
      _cloudFirestoreRepository.buildProductByBarcode(productByBarcodeSnapshot);
  /* Stream<QuerySnapshot> get productByBarcodeStream => productByBarcode(barcode);
  
 */
  StreamController<Product> productSelectedStreamController =
      StreamController<Product>();
  Stream get productSelectedStream => productSelectedStreamController.stream;
  StreamSink get productSelectedSink => productSelectedStreamController.sink;

  signOut() {
    _auth_repository.signOut();
  }

  @override
  void dispose() {
    productSelectedStreamController.close();
  }
}
