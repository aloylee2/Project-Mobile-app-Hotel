import 'package:flutter/material.dart';
import 'package:project/services/firestore_servicebooking.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecordBookingPage extends StatefulWidget {

  @override
  _AddRecordBookingPageState createState() => _AddRecordBookingPageState();
}

class _AddRecordBookingPageState extends State<AddRecordBookingPage> {
  String username;
 String namehotel;
 String typeroom;
 String price;
 final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(title: Text('Saving Hotel Record'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Username'),
                  validator: (val) =>
                      val.length == 0 ? "Enter username" : null,
                  onSaved: (val) => this.username = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Hotel Name'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Hotel Name' : null,
                  onSaved: (val) => this.namehotel = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Type of room'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter type of room' : null,
                  onSaved: (val) => this.typeroom = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Hotel price'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Hotel price' : null,
                  onSaved: (val) => this.price = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Save Booking Record'),
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
    FirestoreService().addBookingData(username,namehotel, typeroom,price);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState

