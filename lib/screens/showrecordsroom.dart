import 'package:flutter/material.dart';
import 'package:project/model/room.dart';
import 'package:get/get.dart';
import 'package:project/screens/detail.dart';
import 'package:project/screens/profile.dart';
import 'package:project/services/firestore_serviceroom.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RecordsRoomPage extends StatefulWidget {
  @override
  _RecordsRoomPageState createState() => _RecordsRoomPageState();
}

class _RecordsRoomPageState extends State<RecordsRoomPage> {
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rooms'),
      ),
      body: FutureBuilder<List<Room>>(
        future: FirestoreService().readRoomData(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Card(
                  elevation: 9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        snapshot.data[index].namehotel,
                        style: TextStyle(color: Colors.blue, fontSize: 16.0),
                      ),
                      Column(
                        children: [
                          Text(
                            snapshot.data[index].typeroom,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                          Text(
                            snapshot.data[index].price,
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
                          ),
                        ],
                      ),
                      IconButton(
                        color: Colors.blue,
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          setState(() {
                            FirestoreService()
                                .deleteRoomData(snapshot.data[index].uid);
                          });
                          Fluttertoast.showToast(
                              msg: "Data deleted successfully",
                              gravity: ToastGravity.TOP);
                        },
                      ),
                      InkWell(
            child: Container(
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
              
                      child: Icon(
                        Icons.add_circle,
                      ),
                    
                  ),
                ],
              ),
            ),
            onTap: (){
              Get.to(() => Detail(), arguments: [snapshot.data[index].uid,snapshot.data[index].namehotel,snapshot.data[index].typeroom,snapshot.data[index].price,snapshot.data[index].url,snapshot.data[index].description,data[1]]);
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
