import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/user_model.dart';




class DatabaseHelper {
  static const String collectionUser = 'User';
  static const String collectionMyConnections = 'MyConnections';
  static const String collectionProduct = 'Product';
  static const String collectionNotification = 'Notifications';
  static const String collectionConnections = 'Connections';
  static const String collectionCategory = 'Category';
  static const String collectionUniversity = 'University';
  static const String collectionHall = 'Hall';

  static final FirebaseFirestore _db = FirebaseFirestore.instance;

  static Future<void> addUser(UserModel userModel) {
    return _db.collection(collectionUser)
        .doc(userModel.uid).set(userModel.toMap());
  }

  static Stream<DocumentSnapshot<Map<String, dynamic>>> getUserById(String uid) =>
      _db.collection(collectionUser).doc(uid).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getSingleUserData(
      {required String uid}) =>
      _db.collection(collectionUser).where('uid', isEqualTo: uid).snapshots();

  static Stream<QuerySnapshot<Map<String, dynamic>>> getCurrentUserData(
      {required String uid}) =>
      _db.collection(collectionUser).where('uid', isEqualTo: uid).snapshots();

  static Future<void> updateUser(String uid, Map<String, dynamic> map) async {
    return await _db.collection(collectionUser)
        .doc(uid)
        .update(map);
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> getAllUsers() =>
      _db.collection(collectionUser).snapshots();


}