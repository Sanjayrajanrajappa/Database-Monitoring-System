import 'package:dbms/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.green,
      body: 
      Column(
        children: [
          Center(
            child: 
              Text(
                "Database Monitoring System",
                style: 
                  TextStyle(
                    color: Color.fromARGB(255, 255, 255, 255),
                    fontFamily: "Karmatic Arcade",
                    fontSize: 60,
                    fontStyle: FontStyle.italic,
                  ),
              ),
          ),
        ],
      ),
    );
  }
}