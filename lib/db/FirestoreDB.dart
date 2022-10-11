import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'model/user_data.dart';

class FirestorePath{

  static const String userData = "Users";
  static const String cashbook = "Cashbook";
  static const String cashbookMembers = "Cashbook Members";

}

class DB {
  static DB? _instance;
  FirebaseFirestore fireStore;

  DB._({required this.fireStore});

  factory DB() {
    _instance ??= DB._(fireStore: FirebaseFirestore.instance);
    return _instance!;
  }

  static Future<UserData?> getUserData() async {
    User user = FirebaseAuth.instance.currentUser!;

    try{
      Map<String, dynamic> userData = {};
      await DB().fireStore.collection(FirestorePath.userData).doc(user.uid).get().then(
              (DocumentSnapshot doc) {
                userData = doc.data() as Map<String, dynamic>; }
      );
      return UserData.fromJson(userData);
    }catch(e){
      print(e);
      return null;
    }
  }

  static Future<String> updateUserData(Map<String,dynamic> data) async {
    User user = FirebaseAuth.instance.currentUser!;
    try{
      await DB().fireStore.collection(FirestorePath.userData).doc(user.uid).update(data).then(
              (value){return "success";});
      return "success";
    }catch(e){
      return e.toString();
    }
  }

  static Future<void> setUpProfile(
      User user,
      String firstName,
      String lastName,
      String currency,
      String locale) async {

    var userData = {
      "id": user.uid,
      "first_name": firstName,
      "last_name": lastName,
      "picture": user.photoURL,
      "email": user.email,
      "mobile_number": user.phoneNumber,
      "locale": locale,
      "default_currency": currency,
    };

    await DB().fireStore.collection(FirestorePath.userData).doc(user.uid).set(userData);
  }
}