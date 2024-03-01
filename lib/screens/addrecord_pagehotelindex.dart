import 'package:flutter/material.dart';
import 'package:project/services/firestore_servicehotelindex.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecordHotelindexpage extends StatefulWidget {
  @override
  _AddRecordHotelindexpageState createState() =>
      _AddRecordHotelindexpageState();
}

class _AddRecordHotelindexpageState extends State<AddRecordHotelindexpage> {
  String imgurl;
  String hotelname;
  String location;
  int rating;
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: Text('Saving Hotel Index Record'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'imgurl'),
                  validator: (val) => val.length == 0 ? "imgurl" : null,
                  onSaved: (val) => this.imgurl = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'hotelname'),
                  validator: (val) => val.length == 0 ? 'hotelname' : null,
                  onSaved: (val) => this.hotelname = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'location'),
                  validator: (val) => val.length == 0 ? 'location' : null,
                  onSaved: (val) => this.location = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Save hotel index Record'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submit() {
    if (this.formKey.currentState.validate()) {
      formKey.currentState.save();
    } else {
      return null;
    }
    FirestoreService().addHotelindexData(imgurl, hotelname, location, rating);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState
