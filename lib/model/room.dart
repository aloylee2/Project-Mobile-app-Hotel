class Room {
 String uid;
 String namehotel;
 String typeroom;
 String price;
 String description;
 String url;
 Room({this.uid, this.namehotel, this.typeroom,this.price, this.description,this.url});
 Room.fromMap(Map<String, dynamic> data) {
 uid = data['uid'];
 namehotel = data['namehotel'];
 typeroom = data['typeroom'];
 price = data['price'];
 description = data['description'];
 url = data['url'];
 }
 Map<String, dynamic> toMap() {
 return {
 'uid': uid,
 'namehotel':namehotel,
 'typeroom' : typeroom,
 'price':price,
 'description': description,
 'url': url
 };
 }
}