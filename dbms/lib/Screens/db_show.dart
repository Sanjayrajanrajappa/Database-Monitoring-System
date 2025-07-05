import 'package:dbms/Screens/extensive.dart';
import 'package:dbms/apis/excel_read.dart';
import 'package:dbms/utils/app_styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:logger/logger.dart';

Logger log = Logger();

class DBShow extends StatefulWidget {
  final String serverName;
  const DBShow({super.key, required this.serverName});

  @override
  State<DBShow> createState() => _DBShowState();
}

class _DBShowState extends State<DBShow> {
  List<Map<String, dynamic>> dbdata = [];
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadSDBnames();
  }

  Future<void> loadSDBnames() async {
    var reader = ExcelRead();
    var names = await reader.readExcelDats(widget.serverName);
    setState(() {
      dbdata = names;
      isLoading = false;
    });
  }
  DataCell da(dynamic cr, BuildContext context){
      if(cr == "r"){
        return DataCell(
          SizedBox.expand(
            child: Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(253, 255, 15, 15),                
              ),
            ),
          ),
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => Extensive()),
          ),
        );
      }
      else if(cr == "g"){
        return DataCell(
          SizedBox.expand(
            child: Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(252, 0, 255, 17),
              ),
            ),
          ),
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => Extensive()),
          ),
        );
      }
      return DataCell(
          SizedBox.expand(
            child: Container(
              margin: EdgeInsets.all(7),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color.fromARGB(250, 251, 255, 0),
              ),
              
            ),
          ),
          onTap: () => Navigator.push(
            context, 
            MaterialPageRoute(builder: (context) => Extensive()),
            
          ),
      );
      
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.gray,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Align(alignment: Alignment.topLeft, child: BackButton(color: AppTheme.purple,)),
            Center(
              child: Text(
                widget.serverName,
                style: const TextStyle(
                  fontFamily: "Karmatic Arcade",
                  fontSize: 60,
                  fontStyle: FontStyle.italic,
                  color: AppTheme.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (isLoading)
              const Center(child: CircularProgressIndicator(color: Colors.white))
            else if (dbdata.isEmpty)
              const Center(
                child: Text(
                  "No data found",
                  style: TextStyle(color: AppTheme.black, fontSize: 18),
                ),
              )
            else
              Center(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: DataTable(
                      columnSpacing: 20,
                      headingRowColor: WidgetStateProperty.all(AppTheme.white),
                      dataRowColor: WidgetStateProperty.all(AppTheme.purple),
                      columns: dbdata[0].keys
                          .where((key) => key != "HOSTNAME" && key != "PORTNO" && key != "USERNAME")
                          .map((key) {
                            return DataColumn(
                              label: Text(
                                key,
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 0, 0, 0),
                                  fontFamily: "Karmatic Arcade",
                                  fontSize: 30
                                ),
                                textAlign: TextAlign.center,
                              ),
                            );
                          }).toList(),
                      rows: dbdata.map((row) {
                        return DataRow(
                          cells: row.entries
                              .where((entry) =>
                                  entry.key != "HOSTNAME" && entry.key != "PORTNO" && entry.key != "USERNAME")
                              .map((entry) {
                                String dat = entry.value.toString();
                                if (dat == "r" || dat == "g" || dat == "y") {
                                  return da(dat, context); 
                                }
                                return DataCell(
                                  Center(
                                    child: Text(
                                      dat,
                                      style: const TextStyle(
                                        color: Color.fromARGB(255, 0, 0, 0),
                                        fontFamily: "Karmatic Arcade",
                                        fontSize: 30
                                        ),
                                      
                                    ),
                                  ),
                                );
                              }).toList(),
                        );
                      }).toList(),
                    ),

                  ),
                ),
              ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
