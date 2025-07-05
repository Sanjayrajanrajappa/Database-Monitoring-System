// import 'package:dbms/apis/mysql_connect.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppTheme{
  
  static const Color green = Color.fromARGB(255, 16, 224, 161);
  static const Color black = Color.fromARGB(98, 0, 0, 0);
  static const Color gray = Color.fromARGB(255, 41, 41, 41);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static const Color purple = Color.fromARGB(255, 191, 146, 255);

  static ElevatedButton modeBTN(BuildContext context){
    return ElevatedButton(
      onPressed:() => Placeholder(),
      child: Icon(
        CupertinoIcons.moon,
        color: AppTheme.purple,
        )
    );
  }
  static ElevatedButton btnWFUNC(BuildContext context,dynamic data, Widget nextPage){
    return ElevatedButton(
    onPressed: () async {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextPage)
      );
      // if(data.toString() == "MYSQL"){
      //   MysqlConnect c = MysqlConnect();
      //   await c.conct();
      // }
    },
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(AppTheme.white),
      backgroundColor: WidgetStateProperty.all(AppTheme.purple),
      minimumSize: WidgetStatePropertyAll(Size(20,40)),
    ),
    child: Text(
      data.toString(),
      style: TextStyle(
        fontFamily: "Times New Roman",
        fontSize: 30,
        fontStyle: FontStyle.italic,
      ),
    ),
  );
  }  
}