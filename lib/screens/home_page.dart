import 'package:flutter/material.dart';
import 'package:project/screens/addrecord_pageuser.dart';
import 'package:project/screens/index.dart';
import 'package:project/screens/showrecordshotelindex.dart';
import 'package:project/services/firebaseauth_service.dart';
import 'package:project/screens/addrecord_page.dart';
import 'package:project/screens/showrecords_page.dart';
import 'package:project/screens/addrecord_pagehotel.dart';
import 'package:project/screens/showrecordshotel.dart';

import 'addrecord_pagehotelindex.dart';
import 'addrecord_pageroom.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("WELCOME HOME", style: TextStyle(fontSize: 30)),
          SizedBox(height: 80),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                icon: Icon(Icons.add_box),
                iconSize: 40,
                tooltip: 'add record',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddRecordHotelindexpage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.list),
                iconSize: 40,
                tooltip: 'view records',
                onPressed: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => RecordsHotelindexpage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.add_box),
                iconSize: 40,
                tooltip: 'add record',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RecordsHotelindexpage()));
                },
              ),
              IconButton(
                icon: Icon(Icons.list),
                iconSize: 40,
                tooltip: 'view records',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => RecordsHotelPage()));
                },
              ),
            ],
          ),
          Padding(
                padding: const EdgeInsets.all(5.0),
                  child: ElevatedButton(
                      child: Text(
                        "Start Booking!",
                      ),
                      onPressed: () {
                         Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Index()));
                      }),
                ),
          ],
        ),
    ); 
  }
} //HomePageState