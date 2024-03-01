class Hotelindex {
 String uid;
 String imgurl;
 String hotelname;
 String location;
 Hotelindex({this.uid, this.imgurl, this.hotelname, this.location});
 Hotelindex.fromMap(Map<String, dynamic> data) {
 uid = data['uid'];
 imgurl = data['imgurl'];
 hotelname = data['hotelname'];
 location = data['location'];
 }
 Map<String, dynamic> toMap() {
 return {
 'uid': uid,
 'imgurl': imgurl,
 'hotelname': hotelname,
 'location': location,
 };
 }
}