import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String _textButton;
  bool _showProgress;
  Function _onPressed;

  AppButton(this._textButton, this._showProgress, this._onPressed );

  @override
  Widget build(BuildContext context) {
    print('botão desenhado!');
    return Container(
      height: 46,
      child: RaisedButton(
        child: _showProgress
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
                _textButton,
                style: TextStyle(color: Colors.white, fontSize: 22),
              ),
        color: Colors.blue,
        onPressed: () => _onPressed(),
      ),
    );
    ;
  }
}
