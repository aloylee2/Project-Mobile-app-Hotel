import 'package:flutter/material.dart';
import 'package:project/screens/index.dart';
import 'package:project/services/firestore_serviceuser.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddRecordUserPage extends StatefulWidget {

  @override
  _AddRecordUserPageState createState() => _AddRecordUserPageState();
}

class _AddRecordUserPageState extends State<AddRecordUserPage> {
  String name;
 String email;
 String phonenumber;
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
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (val) =>
                      val.length == 0 ? "Enter UserName" : null,
                  onSaved: (val) => this.name = val,
                ),
                 TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (val) =>
                      val.length == 0 ? "Enter email" : null,
                  onSaved: (val) => this.email = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Phonenumber'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter phone number' : null,
                  onSaved: (val) => this.phonenumber = val,
                ),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(labelText: 'url'),
                  validator: (val) =>
                      val.length == 0 ? 'Enter a picture' : null,
                  onSaved: (val) => this.url = val,
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: RaisedButton(
                    onPressed: _submit,
                    child: Text('Save User Record'),
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
      Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Index()));
    } else {
      return null;
    }
    FirestoreService().addUserData(name,email,phonenumber,url);
    Fluttertoast.showToast(
        msg: "Data saved successfully", gravity: ToastGravity.TOP);
  } //_submit
} //_AddRecordPageState


