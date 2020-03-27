import 'package:flutter/material.dart';
import 'package:flutterftp/ftp_api.dart';
import 'package:flutterftp/pages/download_file.dart';
import 'package:flutterftp/utils/nav.dart';
import 'package:flutterftp/widgets/app_button.dart';
import 'package:progress_dialog/progress_dialog.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
      message: 'Downloading file...',
      borderRadius: 10.0,
      backgroundColor: Colors.white,
      elevation: 10.0,
      insetAnimCurve: Curves.easeInOut,
      progress: 0.0,
      maxProgress: 100.0,
      progressTextStyle: TextStyle(
          color: Colors.black, fontSize: 13.0, fontWeight: FontWeight.w400),
      messageTextStyle: TextStyle(
          color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Ubasoft AFV - instalação"),
        centerTitle: true,
      ),
      body: _body(context),
    );
  }

  Container _body(context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        width: size.width,
        padding: EdgeInsets.all(16),
        color: Colors.white,
        child: ListView(children: <Widget>[
          AppButton('Afv', false, () => _onClickOk(context, 'Afv.apk'))
        ]));
  }

  Future<bool> _onClickOk(context, file) async {

      progressDialog.show();
      setState(() {

      });

    //await Future.delayed(Duration(seconds: 2));
    //await FtpApi.getFile(file);
   // push(context, DownloadFile(file: file));
 //   if (progressDialog.isShowing()) {
   //   progressDialog.hide();
   //}

    FtpApi.getFile(file).then((value) {
      if (progressDialog.isShowing()) {
        progressDialog.hide();
      }
      print('concluído o download');
    });
  }
}
