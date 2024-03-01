import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:project/model/hotelindex.dart';
import 'package:project/screens/addrecord_pagehotel.dart';
import 'package:project/screens/profile.dart';
import 'package:project/screens/showrecords_page.dart';
import 'package:project/screens/showrecordsbooking.dart';
import 'package:project/screens/showrecordshotel.dart';
import 'package:project/screens/showrecordsroom.dart';
import 'package:project/services/firebaseauth_service.dart';
import 'package:project/services/firestore_servicehotelindex.dart';
import 'about.dart';
import 'addrecord_page.dart';
import 'addrecord_pageroom.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome user",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Pick your hotel",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            //Now let's add some elevation to our text field
            //to do this we need to wrap it in a Material widget
            // Material(
            //   elevation: 10.0,
            //   borderRadius: BorderRadius.circular(30.0),
            //   shadowColor: Color(0x55434343),
            //   child: TextField(
            //     textAlign: TextAlign.start,
            //     textAlignVertical: TextAlignVertical.center,
            //     decoration: InputDecoration(
            //       hintText: "Search for Hotel...",
            //       prefixIcon: Icon(
            //         Icons.search,
            //         color: Colors.black54,
            //       ),
            //       border: InputBorder.none,
            //     ),
            //   ),
            // ),

            // SizedBox(height: 20.0),
            // Now let's Add a Tabulation bar
            DefaultTabController(
              length: 3,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      indicatorColor: Color(0xFFFE8C68),
                      unselectedLabelColor: Color(0xFF555555),
                      labelColor: Color(0xFFFE8C68),
                      labelPadding: EdgeInsets.symmetric(horizontal: 8.0),
                      tabs: [
                        Tab(
                          text: "Trending",
                        ),
                        Tab(
                          text: "Promotion",
                        ),
                        Tab(
                          text: "Favorites",
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      height: 385.0,
                      child: TabBarView(
                        children:<Widget>[
                          //Now let's create our first tab page
                          
                          Container(
                            
                            child: FutureBuilder<List<Hotelindex>>(
                            future: FirestoreService().readHotelindexData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                
                                return ListView.builder(
                                  itemCount: snapshot.data.length,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                            snapshot.data[index].location,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                                         
                     Container(
                       
                                                  height: 140,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(snapshot.data[index].imgurl),
                  fit: BoxFit.contain
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
              
                ]
                    )
                                      )
                                        ],
                                      )
                                      
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
                         Container(
                            
                            child: FutureBuilder<List<Hotelindex>>(
                            future: FirestoreService().readHotelindexData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                
                                return ListView.builder(
                                  itemCount: 2,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                            snapshot.data[index].location,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                                         
                     Container(
                       
                                                  height: 140,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(snapshot.data[index].imgurl),
                  fit: BoxFit.contain
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
              
                ]
                    )
                                      )
                                        ],
                                      )
                                      
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
                          Container(
                            
                            child: FutureBuilder<List<Hotelindex>>(
                            future: FirestoreService().readHotelindexData(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData) {
                                
                                return ListView.builder(
                                  itemCount: 1,
                                  itemBuilder: (context, index) {
                                    return Card(
                                      elevation: 5,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                            snapshot.data[index].location,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                                         
                     Container(
                       
                                                  height: 140,
              width: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(snapshot.data[index].imgurl),
                  fit: BoxFit.contain
                ),
                borderRadius: BorderRadius.circular(18),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 5,
                    blurRadius: 7,
                  ),
              
                ]
                    )
                                      )
                                        ],
                                      )
                                      
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
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.blue.shade200,
        //shape property must be set to NotchedShape
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.hotel),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RecordsHotelPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.history),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => RecordsBookingPage()));
              },
            ),
            IconButton(
              icon: Icon(Icons.support),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => About()));
              },
            ),
            IconButton(
              icon: Icon(Icons.person),
              color: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Profile()));
              },
            ),
            Divider(),
          ],
        ),
      ),
      //set the docked position- centerDocked or endDocked
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.logout),
        backgroundColor: Colors.blueAccent,
        tooltip: 'Sign Out',
        onPressed: () async {
          await FirebaseAuthService().signOut();
          Navigator.of(context).pushNamed('/login');
        },
      ),
    );
  }
}

