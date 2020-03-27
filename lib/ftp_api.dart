import 'package:flutterftp/pages/api_response.dart';
import 'package:ftpclient/ftpclient.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class FtpApi {

  static Future<bool> getFile(String file) async {

   ServerConfig server =  ServerConfig(host: SERVE-FTP, user: USER ,
       pass: PASSWORD, serverDiretory: '/AFV');

    FTPClient ftpClient =
      FTPClient(server.host, user: server.user, pass: server.pass, debug: false);

    ftpClient.connect();
    ftpClient.changeDirectory(server.serverDiretory);

    print("conectado");

    try {
    //  List<FTPEntry> contentList = ftpClient.listDirectoryContent();
//    print("Conteúdo da pasta: ${contentList.toString()}");

      //for (FTPEntry entry in contentList) {
      // print("${entry.type}: ${entry.name} ");
      //}

      final directory = await getApplicationDocumentsDirectory();
      File _file = File('${directory.path}/$file');

      if (_file == null) {
        print("file nullo");
      }
      print(_file);

      ftpClient.downloadFile(file, _file);
    } finally {
      ftpClient.disconnect();
    }
  }
}

class ServerConfig {
  String host;
  int port = 21;
  String user = 'anonymous';
  String pass;
  String serverDiretory;

  ServerConfig({this.host, this.port, this.user, this.pass, this.serverDiretory});
}
