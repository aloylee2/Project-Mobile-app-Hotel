// import 'package:flutter/material.dart';
// import 'package:project/services/firestore_servicehotel.dart';
// import 'package:fluttertoast/fluttertoast.dart';


// class AddRecordHotelPAge extends StatefulWidget {

//   @override
//   _AddRecordHotelPAgeState createState() => _AddRecordHotelPAgeState();
// }

// class _AddRecordHotelPAgeState extends State<AddRecordHotelPAge> {
//   String hotelName;
//   String hotelPrice;
//   String hotelLocation;
//   String hotelDescription;
//   String url;
//   final formKey = GlobalKey<FormState>();
//    Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Saving Hotel Record'), actions: <Widget>[]),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(16.0),
//           child: Form(
//             key: formKey,
//             child: Column(
//               children: [
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(labelText: 'Hotel Name'),
//                   validator: (val) =>
//                       val.length == 0 ? "Enter Hotel Name" : null,
//                   onSaved: (val) => this.hotelName = val,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(labelText: 'Hotel Price'),
//                   validator: (val) =>
//                       val.length == 0 ? 'Enter Hotel Price' : null,
//                   onSaved: (val) => this.hotelPrice = val,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.text,
//                   decoration: InputDecoration(labelText: 'Hotel Location'),
//                   validator: (val) =>
//                       val.length == 0 ? 'Enter Hotel Location' : null,
//                   onSaved: (val) => this.hotelLocation = val,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(labelText: 'Hotel Description'),
//                   validator: (val) =>
//                       val.length == 0 ? 'Enter Hotel Description' : null,
//                   onSaved: (val) => this.hotelDescription = val,
//                 ),
//                 TextFormField(
//                   keyboardType: TextInputType.phone,
//                   decoration: InputDecoration(labelText: 'Hotel url'),
//                   validator: (val) =>
//                       val.length == 0 ? 'Enter Hotel image url' : null,
//                   onSaved: (val) => this.url = val,
//                 ),
//                 Container(
//                   margin: const EdgeInsets.only(top: 10.0),
//                   child: RaisedButton(
//                     onPressed: _submit,
//                     child: Text('Save Hotel Record'),
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   void _submit() {
//     if (this.formKey.currentState.validate()) {
//       formKey.currentState.save();
//     } else {
//       return null;
//     }
//     FirestoreService().addHotelData(hotelName,hotelPrice, hotelLocation,hotelDescription,url);
//     Fluttertoast.showToast(
//         msg: "Data saved successfully", gravity: ToastGravity.TOP);
//   } //_submit
// } //_AddRecordPageState

