import 'package:dbms/apis/excel_read.dart';
import 'package:dbms/utils/app_styles.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> serverNames = [];
  @override
  void initState(){
    super.initState();
    loadServerNames();
  }
  Future<void> loadServerNames() async {
    var reader = ExcelRead();
    var names = await reader.readExcel();
    setState((){
      serverNames = names;
    });
  }
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for(var i in serverNames)
                AppTheme.btn(i),
                Padding(padding: EdgeInsets.all(20)),
            ],
          )
        ],
      ),
    );
  }
}