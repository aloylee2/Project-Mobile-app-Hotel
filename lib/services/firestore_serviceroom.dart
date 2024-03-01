import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/room.dart';

class FirestoreService {
  // Create a CollectionReference called roomCollection that references
  // the firestore collection
  final CollectionReference roomCollection =
      FirebaseFirestore.instance.collection('rooms');
  Future<void> addRoomData(String namehotel, String typeroom, String price,
      String description,String url) async {
    var docRef = FirestoreService().roomCollection.doc();
    print('add docRef: ' + docRef.id);
    await roomCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'namehotel': namehotel,
      'typeroom': typeroom,
      'price': price,
      'description': description,
      'url':url
    });
  } //addroomData

  Future<List<Room>> readRoomData() async {
    List<Room> roomList = [];
    QuerySnapshot snapshot = await roomCollection.get();
    snapshot.docs.forEach((document) {
      Room room = Room.fromMap(document.data());
      roomList.add(room);
    });
    print('roomlist: $roomList');
    return roomList;
  }

  Future<void> deleteRoomData(String docId) async {
    roomCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deleteroomData

  //for your reference
  Future<void> updateRoomData(String namehotel, String typeroom, String price,
      String description,String url) async {
    var docRef = FirestoreService().roomCollection.doc();
    print('update docRef: ' + docRef.id);
    await roomCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'namehotel': namehotel,
      'typeroom': typeroom,
      'price': price,
      'description': description,
      'url':url
    });
  } //updateroomData

  //for your reference
  Future<void> deleteRoomDoc() async {
    await roomCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
} //FirestoreService
