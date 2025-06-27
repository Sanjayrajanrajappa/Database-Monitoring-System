import 'dart:io';
import 'package:excel/excel.dart';
import 'package:logger/logger.dart';

class ExcelRead {

  final Logger logger = Logger();

  Future<List<dynamic>> readExcelColumnsWise() async{
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
      var c = "TECHNOLOGY";
      int columnIndex = headerRow.indexWhere((cell) => cell?.value.toString().trim() == c);
      if (columnIndex == -1) {
        logger.w('Column "$c" not found in sheet "$table".');
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

  Future<List<Map<String, dynamic>>> readExcelDats(dynamic techname) async {
    final filePath = r'D:\PROGRAMMING\PROJECTS\FLUTTER\PROJECT\GITCLONE\Database-Monitoring-System\dbms\lib\src\details.xlsx';
    final bytes = await File(filePath).readAsBytes();
    final excel = Excel.decodeBytes(bytes);
    final List<Map<String, dynamic>> dbdata = [];
    for (var table in excel.tables.keys) {
      final sheet = excel.tables[table];
      if (sheet == null) continue;
      final List<Data?> headerRow = sheet.rows[0];
      final List<String> columns = ["TECHNOLOGY","SERVERNAME", "DATABASENAME","HOSTNAME","PORTNO","USERNAME"];
      final Map<String, int> columnIndices = {};
      for (var colName in columns) {
        final index = headerRow.indexWhere((cell) => cell?.value.toString().trim().toUpperCase() == colName);
        if (index == -1) {
          logger.w('Column $colName not found in sheet $table');
          continue;
        }
        columnIndices[colName] = index;
      }
      for (int i = 1; i < sheet.rows.length; i++) {
        final row = sheet.rows[i];
        final techValue = row[columnIndices["TECHNOLOGY"]!]?.value.toString().trim();

        if (techValue?.toLowerCase() != techname.toString().toLowerCase()) continue;

        final rowMap = <String, dynamic>{};
        rowMap["TECHNOLOGY"] = row[columnIndices["TECHNOLOGY"]!]?.value;
        rowMap["SERVERNAME"] = row[columnIndices["SERVERNAME"]!]?.value;
        rowMap["DATABASENAME"] = row[columnIndices["DATABASENAME"]!]?.value;
        rowMap["HOSTNAME"] = row[columnIndices["HOSTNAME"]!]?.value;
        rowMap["PORTNO"] = row[columnIndices["PORTNO"]!]?.value;
        rowMap["USERNAME"] = row[columnIndices["USERNAME"]!]?.value;

        dbdata.add(rowMap);
      }
    }
    return dbdata;
  }
  
}