import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/hotelindex.dart';

class FirestoreService {
  // Create a CollectionReference called hotelCollection that references
  // the firestore collection
  final CollectionReference hotelCollection =
      FirebaseFirestore.instance.collection('hotelsindex');
  Future<void> addHotelindexData(
      String imgurl, String hotelname, String location, int rating) async {
    var docRef = FirestoreService().hotelCollection.doc();
    print('add docRef: ' + docRef.id);
    await hotelCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'imgurl': imgurl,
      'hotelname': hotelname,
      'location': location,
    });
  } //addhotelData

  Future<List<Hotelindex>> readHotelindexData() async {
    List<Hotelindex> hotelList = [];
    QuerySnapshot snapshot = await hotelCollection.get();
    snapshot.docs.forEach((document) {
      Hotelindex hotel = Hotelindex.fromMap(document.data());
      hotelList.add(hotel);
    });
    print('Hotellist: $hotelList');
    return hotelList;
  } //readhotelData

  Future<void> deleteHotelindexData(String docId) async {
    hotelCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deletehotelData


} //FirestoreService
