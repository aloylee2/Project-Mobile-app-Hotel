import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/hotel.dart';
import 'package:project/screens/hoteldetail.dart';
import 'package:project/screens/showrecords_page.dart';
import 'package:project/screens/showrecordsroom.dart';
import 'package:project/services/firestore_servicehotel.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordsHotelPage extends StatefulWidget {
  @override
  _RecordsHotelPageState createState() => _RecordsHotelPageState();
}

class _RecordsHotelPageState extends State<RecordsHotelPage> {
  TextEditingController _searchController = TextEditingController();
  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }
  // ()async {
  //   var data = FirestoreService().hotelCollection.doc();
  
  //     .collection('hotels')
  //     .hotelName('name')
  //     .getDocuments();

_onSearchChanged() {
    //searchResultsList();
    print(_searchController.text);
  }

List<Hotel> hotelList = [];


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
         
          children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 0, right: 0, bottom: 0),
            child: TextField(
              
              controller: _searchController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.search)
              ),
            ),

          ),
          Expanded(
            
child:FutureBuilder<List<Hotel>>(
        future: FirestoreService().readHotelData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 5,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data[index].name,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].price,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            snapshot.data[index].location,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            snapshot.data[index].description,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          ),
                          Text(
                            snapshot.data[index].url,
                            style:
                                TextStyle(color: Colors.black, fontSize: 12.0),
                          )
                        ],
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          setState(() {
                            FirestoreService()
                                .deleteHotelData(snapshot.data[index].uid);
                          });
                          Fluttertoast.showToast(
                              msg: "Data deleted successfully",
                              gravity: ToastGravity.TOP);
                        },
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.add),
                        onPressed: () {
                          Get.to(() => HotelDetail(), arguments: [snapshot.data[index].uid,snapshot.data[index].name,snapshot.data[index].price,snapshot.data[index].location,snapshot.data[index].url,snapshot.data[index].description]);
                        },
                      ),
                    ],
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Container(
            alignment: AlignmentDirectional.center,
            child: CircularProgressIndicator(),
          );
        },
      ),
          ),
        ],
      ),
      )
    );
  }
} //_RecordsPageState
