// TODO Implement this library.//TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/user.dart';
import 'package:project/services/firestore_serviceuser.dart';
import 'package:fluttertoast/fluttertoast.dart';

class About extends StatefulWidget {

  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
 var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About Page'),
      )
    );
  }
} 