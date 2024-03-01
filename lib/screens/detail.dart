//TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/user.dart';
import 'package:project/services/firestore_serviceuser.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'checkout.dart';


class Detail extends StatefulWidget {

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details Page'),
        //input cart widget
        
      ),
      body:Container(
        child:Column(
           crossAxisAlignment: CrossAxisAlignment.center,
           children: <Widget>[
             Hero(
              tag: "$data",
              child: Container(
                padding: const EdgeInsets.all(35.0),
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("${data[4]}"), fit: BoxFit.fitHeight),
                  ),
                ),
              ),
            ),
             Text(
             
                        "Hotel name: ${data[5]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),Text(
                        "Name of the room:${data[1]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),Text(
                        "Type room: ${data[2]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),Text(
                        "Price: ${data[3]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),Text(
                        "Des: ${data[4]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Padding(
                padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      child: Text(
                        "Book!",
                      ),
                      onPressed: () {
                        Get.to(() => Checkout(), arguments: [data[0],data[1],data[2],data[3],data[4]]);
                      }),
                ),
],
                
        ),
       padding: const EdgeInsets.all(5.0),
       
      )
    );
  }
}