import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
}
