import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/user.dart';
import 'package:project/services/firestore_serviceuser.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Checkout extends StatefulWidget {

  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
 var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout Page'),
      )
    );
  }
}