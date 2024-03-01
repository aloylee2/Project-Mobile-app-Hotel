class User {
 String uid;
 String name;
 String email;
 String phonenumber;
 String url;
 User({this.uid, this.name, this.email,this.phonenumber, this.url});
 User.fromMap(Map<String, dynamic> data) {
 uid = data['uid'];
 name = data['name'];
 email = data['email'];
 phonenumber = data['phonenumber'];
 url = data['url'];
 }
 Map<String, dynamic> toMap() {
 return {
 'uid': uid,
 'name':name,
 'email' : email,
 'phonenumber':phonenumber,
 'url': url
 };
 }
}