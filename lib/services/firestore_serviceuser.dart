import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/user.dart';

class FirestoreService {
  // Create a CollectionReference called userCollection that references
  // the firestore collection
  final CollectionReference userCollection =
      FirebaseFirestore.instance.collection('users');
  Future<void> addUserData( String name, String email,
      String phonenumber, String url) async {
    var docRef = FirestoreService().userCollection.doc();
    print('add docRef: ' + docRef.id);
    await userCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': name,
      'email': email,
      'phonenumber': phonenumber,
      'url': url
    });
  } //adduserData

  Future<List<User>> readUserData() async {
    List<User> userList = [];
    QuerySnapshot snapshot = await userCollection.get();
    snapshot.docs.forEach((document) {
      User user = User.fromMap(document.data());
      userList.add(user);
    });
    print('userlist: $userList');
    return userList;
  } //readuserData

  Future<void> deleteUserData(String docId) async {
    userCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deleteuserData

  //for your reference
  Future<void> updateUserData(String uid, String name, String email,
      String phonenumber, String url) async {
    var docRef = FirestoreService().userCollection.doc();
    print('update docRef: ' + docRef.id);
    await userCollection.doc(docRef.id).update({
      'uid': docRef.id,
       'name': name,
      'email': email,
      'phonenumber': phonenumber,
      'url': url
    });
  } //updateuserData

  //for your reference
  Future<void> deleteUserDoc() async {
    await userCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
} //FirestoreService
