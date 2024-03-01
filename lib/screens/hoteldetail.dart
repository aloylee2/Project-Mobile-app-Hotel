//TODO Implement this library.
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/user.dart';
import 'package:project/screens/showrecordsroom.dart';
import 'package:project/services/firestore_serviceuser.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'checkout.dart';


class HotelDetail extends StatefulWidget {

  @override
  _HotelDetailState createState() => _HotelDetailState();
}

class _HotelDetailState extends State<HotelDetail> {
  var data = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotel Details Page'),
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
             
                        "Hotel name: ${data[1]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),Text(
                        "Location:${data[3]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),Text(
                        "Price: ${data[2]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),Text(
                        "Des: ${data[4]}",
                        
                        style: TextStyle(fontSize: 14.0),
                      ),
                      Padding(
                padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      child: Text(
                        "Check the room!",
                      ),
                      onPressed: () {
                        Get.to(() => RecordsRoomPage(), arguments: [data[0],data[1],data[2],data[3],data[4]]);
                      }),
                ),
                Padding(
                padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      child: Text(
                        "Location!",
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