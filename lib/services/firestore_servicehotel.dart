import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/hotel.dart';

class FirestoreService {
  // Create a CollectionReference called hotelCollection that references
  // the firestore collection
  final CollectionReference hotelCollection =
      FirebaseFirestore.instance.collection('hotels');
  Future<void> addHotelData(String hotelName, String hotelPrice,
      String hotelLocation, String hotelDescription, String url) async {
    var docRef = FirestoreService().hotelCollection.doc();
    print('add docRef: ' + docRef.id);
    await hotelCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'name': hotelName,
      'price': hotelPrice,
      'location': hotelLocation,
      'description': hotelDescription,
      'url':url
    });
  } //addhotelData

  Future<List<Hotel>> readHotelData() async {
    List<Hotel> hotelList = [];
    QuerySnapshot snapshot = await hotelCollection.get();
    snapshot.docs.forEach((document) {
      Hotel hotel = Hotel.fromMap(document.data());
      hotelList.add(hotel);
    });
    print('Hotellist: $hotelList');
    return hotelList;
  } //readhotelData

  Future<void> deleteHotelData(String docId) async {
    hotelCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deletehotelData

  //for your reference
  Future<void> updateHotelData(String hotelName, String hotelPrice,
      String hotelLocation, String hotelDescription, String url) async {
    var docRef = FirestoreService().hotelCollection.doc();
    print('update docRef: ' + docRef.id);
    await hotelCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'name': hotelName,
      'price': hotelPrice,
      'location': hotelLocation,
      'description': hotelDescription,
      'url':url
    });
  } //updateHotelData

  //for your reference
  Future<void> deleteHotelDoc() async {
    await hotelCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
} //FirestoreService
