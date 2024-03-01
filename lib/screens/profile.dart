//TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/user.dart';
import 'package:project/services/firestore_serviceuser.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Profile extends StatefulWidget {
  

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      )
    );
  }
}