import 'package:mysql_client/mysql_client.dart';
import 'package:logger/logger.dart';

class MysqlConnect {

  final Logger lg = Logger();
  Future<void> conct() async{
    try {
      final conn = await MySQLConnection.createConnection(
        host: "127.0.0.1", 
        port: 3306, 
        userName: "root", 
        password: "Sanjay@2005",
      );
      await conn.connect();
      if (conn.connected) {
        lg.w("CONNECTED SUCCESSFULLY");
      } else {
        lg.e("CONNECTION FAILED");
      }
    } catch (e) {
      lg.e("ERROR: $e");
    }
  }
}