import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:inventory/models/user.dart';

class FirestoreService {
  final String uid;
  FirestoreService({this.uid});

  final CollectionReference userCollection =
      Firestore.instance.collection('users');

  Future<void> updateUserData(String name, String email) async {
    return await userCollection.document(uid).setData({
      'name': name,
      'email': email,
    });
  }

  UserData _userDataFromSnapshot(DocumentSnapshot snapshot) {
    return UserData(
      uid: uid,
      name: snapshot.data['name'],
      email: snapshot.data['email'],
    );
  }

  Stream<UserData> get userData {
    return userCollection.document(uid).snapshots().map(_userDataFromSnapshot);
  }
}
