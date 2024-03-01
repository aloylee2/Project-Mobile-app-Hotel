class Booking {
 String uid;
 String username;
 String namehotel;
 String typeroom;
 String price;
 Booking({this.uid,this.username, this.namehotel, this.typeroom,this.price});
 Booking.fromMap(Map<String, dynamic> data) {
 uid = data['uid'];
 username = data['username'];
 namehotel = data['namehotel'];
 typeroom = data['typeroom'];
 price = data['price'];
 }
 Map<String, dynamic> toMap() {
 return {
 'uid': uid,
 'username': username,
 'namehotel':namehotel,
 'typeroom' : typeroom,
 'price':price,
 };
 }
}