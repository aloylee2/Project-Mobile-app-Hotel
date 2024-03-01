class Hotel {
 String uid;
 String name;
 String price;
 String location;
 String description;
 String url;
 Hotel({this.uid, this.name, this.price, this.location, this.description,this.url});
 Hotel.fromMap(Map<String, dynamic> data) {
 uid = data['uid'];
 name = data['name'];
 price = data['price'];
 location = data['location'];
 description = data['description'];
 url = data['url'];
 }
 Map<String, dynamic> toMap() {
 return {
 'uid': uid,
 'name': name,
 'price': price,
 'location': location,
 'description': description,
 'url':url
 };
 }
}