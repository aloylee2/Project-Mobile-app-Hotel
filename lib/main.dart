import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:project/screens/home_page.dart';
import 'package:project/screens/index.dart';
import 'package:project/screens/login_page.dart';

Future<void> main() async {
 WidgetsFlutterBinding.ensureInitialized();
 await Firebase.initializeApp();
 runApp(MyApp());
}
class MyApp extends StatelessWidget {
 @override
 Widget build(BuildContext context) {
 return GetMaterialApp(
 debugShowCheckedModeBanner: false,
 title: 'Hotel & Resort',
 routes: {
 '/login': (context) => LoginPage(),
 },
 home: LoginPage(),
 );
 }
}