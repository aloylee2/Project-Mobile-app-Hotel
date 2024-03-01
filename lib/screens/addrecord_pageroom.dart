import 'package:flutter/material.dart';
import 'package:project/services/firestore_serviceroom.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecordRoomPage extends StatefulWidget {

  @override
  _AddRecordRoomPageState createState() => _AddRecordRoomPageState();
}

class _AddRecordRoomPageState extends State<AddRecordRoomPage> {
String namehotel;
 String typeroom;
 String price;
 String description;
 String url;
 final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Saving Room Record'), actions: <Widget>[]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Hotel Name'),
                  validator: (val) =>
                      val.length == 0 ? "Enter Hotel Name" : null,
                  onSaved: (val) => this.namehotel = val,
                ),
                 TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'typeroom'),
                  validator: (val) =>
                      val.length == 0 ? "Enter type room" : null,
                  onSaved: (val) => this.typeroom = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'price'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter room Price' : null,
                  onSaved: (val) => this.price = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'Hotel Description'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Hotel Description' : null,
                  onSaved: (val) => this.description = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'room url'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter Room Image url' : null,
                  onSaved: (val) => this.url = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Save Room Record'),
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
    FirestoreService().addRoomData(namehotel,typeroom,price,description,url);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState

