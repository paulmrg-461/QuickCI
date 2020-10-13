import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:quick_ci/Product/ui/widgets/card_product.dart';
import 'package:quick_ci/Product/ui/widgets/product_detail_content.dart';
import 'package:quick_ci/User/model/user.dart';
import 'cloud_firestore_API.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);

  List<CardProduct> buildProducts(
          List<DocumentSnapshot> productsListSnapshot) =>
      _cloudFirestoreAPI.buildProducts(productsListSnapshot);

  List<ProductDetailContent> buildProductByBarcode(
          List<DocumentSnapshot> productByBarcodeSnapshot) =>
      _cloudFirestoreAPI.buildProductByBarcode(productByBarcodeSnapshot);
}
