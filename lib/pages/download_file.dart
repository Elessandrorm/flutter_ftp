import 'package:flutter/material.dart';
import 'package:flutterftp/ftp_api.dart';

class DownloadFile extends StatelessWidget {
  String file;

  DownloadFile({this.file});

  @override
  Widget build(BuildContext context) {


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.deepPurple,
          title: Text(
            'Future Builder',
          ),
        ),
        body: buildContainer());
  }
  buildContainer() {
    return Container(
        child: FutureBuilder(
            future: getFtpFile(file),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                  child: Text(
                    snapshot.data,
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }));
  }

  Future<String> getFtpFile(String file) async {
    await Future.delayed(Duration(seconds: 3),() {
      return 'Arquivo Recebido';
    });
    //await FtpApi.getFile(file).then((value) {
    //  return 'Arquivo Recebido';
    //});
  }
}