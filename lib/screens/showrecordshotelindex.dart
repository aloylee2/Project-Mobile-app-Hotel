import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/model/hotelindex.dart';
import 'package:project/screens/hoteldetail.dart';
import 'package:project/screens/index.dart';
import 'package:project/screens/showrecords_page.dart';
import 'package:project/screens/showrecordsroom.dart';
import 'package:project/services/firestore_servicehotelindex.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordsHotelindexpage extends StatefulWidget {

  @override
  _RecordsHotelindexpageState createState() => _RecordsHotelindexpageState();
}

class _RecordsHotelindexpageState extends State<RecordsHotelindexpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Hotels'),
      ),
      body: FutureBuilder<List<Hotelindex>>(
        future: FirestoreService().readHotelindexData(),
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
                      // Text(
                      //   //snapshot.data[index].imgurl,
                      //   style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      // ),
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].hotelname,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            snapshot.data[index].location,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          
                        ],
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          setState(() {
                            FirestoreService()
                                .deleteHotelindexData(snapshot.data[index].uid);
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
                          Get.to(() => Index(), arguments: [snapshot.data[index].uid,snapshot.data[index].imgurl,snapshot.data[index].hotelname,snapshot.data[index].location]);
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
    );
  }
} //_RecordsPageState
