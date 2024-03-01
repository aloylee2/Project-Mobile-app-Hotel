import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:project/model/booking.dart';

class FirestoreService {
  // Create a CollectionReference called bookingCollection that references
  // the firestore collection
  final CollectionReference bookingCollection =
      FirebaseFirestore.instance.collection('bookings');
  Future<void> addBookingData(
      String username, String namehotel, String typeroom, String price) async {
    var docRef = FirestoreService().bookingCollection.doc();
    print('add docRef: ' + docRef.id);
    await bookingCollection.doc(docRef.id).set({
      'uid': docRef.id,
      'username': username,
      'namehotel': namehotel,
      'typeroom': typeroom,
      'price': price
    });
  } //addBookingData

  Future<List<Booking>> readBookingData() async {
    List<Booking> bookingList = [];
    QuerySnapshot snapshot = await bookingCollection.get();
    snapshot.docs.forEach((document) {
      Booking booking = Booking.fromMap(document.data());
      bookingList.add(booking);
    });
    print('bookinglist: $bookingList');
    return bookingList;
  } //readbookingData

  Future<void> deleteBookingData(String docId) async {
    bookingCollection.doc(docId).delete();
    print('deleting uid: ' + docId);
  } //deletebookingData

  //for your reference
  Future<void> updateBookingData(
      String username, String namehotel, String typeroom, String price) async {
    var docRef = FirestoreService().bookingCollection.doc();
    print('update docRef: ' + docRef.id);
    await bookingCollection.doc(docRef.id).update({
      'uid': docRef.id,
      'username': username,
      'namehotel': namehotel,
      'typeroom': typeroom,
      'price': price
    });
  } //updateroomData

  //for your reference
  Future<void> deleteBookingDoc() async {
    await bookingCollection.get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
  } //deleteBookDoc
} //FirestoreService
