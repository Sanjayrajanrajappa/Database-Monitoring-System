import 'package:dbms/Screens/home_screen.dart';
import 'package:flutter/material.dart';


void main() async {
  runApp(MyApp());
} 

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}