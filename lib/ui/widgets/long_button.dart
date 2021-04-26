import 'package:flutter/material.dart';

class FullBtn extends StatelessWidget {
  final String text;
  final Function onClicked;

  FullBtn(this.text, this.onClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(16.3, 5, 16.3, 48),
      child: SizedBox(
        width: double.infinity,
        child: MaterialButton(
          onPressed: onClicked,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            'Start',
            style: TextStyle(
              fontSize: 16.0,
            ),
          ),
          color: Colors.red,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
