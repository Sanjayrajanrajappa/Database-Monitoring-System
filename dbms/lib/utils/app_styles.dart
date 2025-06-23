import 'package:flutter/material.dart';

class AppTheme{
  static const Color green = Color.fromARGB(255, 16, 224, 161);
  static const Color black = Color.fromARGB(98, 0, 0, 0);
  static const Color white = Color.fromARGB(255, 255, 255, 255);
  static ElevatedButton btnWFUNC(BuildContext context,dynamic data, Widget nextPage){
    return ElevatedButton(
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => nextPage)
      );
    },
    style: ButtonStyle(
      foregroundColor: WidgetStateProperty.all(white),
      backgroundColor: WidgetStateProperty.all(black),
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