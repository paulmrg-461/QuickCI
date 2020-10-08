import 'package:quick_ci/User/model/user.dart';
import 'cloud_firestore_API.dart';

class CloudFirestoreRepository {
  final _cloudFirestoreAPI = CloudFirestoreAPI();
  void updateUserDataFirestore(User user) =>
      _cloudFirestoreAPI.updateUserData(user);
}
