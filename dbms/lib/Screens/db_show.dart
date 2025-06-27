import 'package:dbms/apis/excel_read.dart';
import 'package:dbms/utils/app_styles.dart';
import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.green,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Align(alignment: Alignment.topLeft, child: BackButton()),
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
                  style: TextStyle(color: Colors.white, fontSize: 18),
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
                      headingRowColor: WidgetStateProperty.all(const Color.fromARGB(101, 0, 0, 0)),
                      dataRowColor: WidgetStateProperty.all(const Color.fromARGB(68, 12, 117, 85)),
                      columns: dbdata[0].keys.map((key) {
                        return DataColumn(
                          label: Text(
                            key,
                            style: const TextStyle(
                              color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                          ),
                        );
                      }).toList(),
                      rows: dbdata.map((row) {
                        return DataRow(
                          cells: row.values.map((value) {
                            return DataCell(
                              Center(
                                child: 
                                Text(
                                value?.toString() ?? '',
                                style: const TextStyle(color: Color.fromARGB(255, 0, 0, 0)),
                              ),
                            )
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
