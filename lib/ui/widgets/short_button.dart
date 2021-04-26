import 'package:flutter/material.dart';

class HalfBtn extends StatelessWidget {
  final String text;
  final Function onClicked;

  HalfBtn(this.text, this.onClicked);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(3.5, 5, 3.5, 48),
      child: SizedBox(
        width: 160,
        child: MaterialButton(
          onPressed: onClicked,
          padding: EdgeInsets.symmetric(vertical: 12.0),
          child: Text(
            text,
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
