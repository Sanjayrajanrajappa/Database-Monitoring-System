import 'package:db/utils/app_style.dart';
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
      backgroundColor: AppTheme.greenish,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Database Monitoring System',
                style: TextStyle(
                  fontSize: 50,
                  fontFamily: 'Karmatic Arcade',
                  color: Colors.white,
                  letterSpacing: 10,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}