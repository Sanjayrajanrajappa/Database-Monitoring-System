import 'dart:io';
import 'package:excel/excel.dart';
import 'package:logger/logger.dart';

class ExcelRead {

  final Logger logger = Logger();

  Future<List<dynamic>> readExcel() async{
    var file = r'D:\PROGRAMMING\PROJECTS\FLUTTER\PROJECT\GITCLONE\Database-Monitoring-System\dbms\lib\src\details.xlsx';
    var bytes = await File(file).readAsBytes();
    var excel = Excel.decodeBytes(bytes);
    List<dynamic> dbdata = [];
    for(var table in excel.tables.keys){
      var sheet = excel.tables[table];
      if(sheet == null){ 
        continue;
      }
      List<Data?> headerRow = sheet.rows[0];
      var columnName = "SERVER";
      int columnIndex = headerRow.indexWhere((cell) => cell?.value.toString().trim() == columnName);
      if (columnIndex == -1) {
        logger.w('Column "$columnName" not found in sheet "$table".');
        continue;
      }
      for (int i = 1; i < sheet.rows.length; i++) {
        var row = sheet.rows[i];
        if (columnIndex < row.length && !dbdata.contains(row[columnIndex]?.value)) {
          dbdata.add(row[columnIndex]?.value);
        }
      }
    }
    return dbdata;
  }
  
}