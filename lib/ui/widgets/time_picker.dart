import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

// ignore: must_be_immutable
class TimePickerColumn extends StatelessWidget {
  var timeFormat;
  var maxValue;
  Function(int) pickNumber;

  TimePickerColumn({this.timeFormat, this.maxValue, this.pickNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          NumberPicker.integer(
              initialValue: 0,
              minValue: 0,
              maxValue: maxValue,
              highlightSelectedValue: true,
              infiniteLoop: true,
              haptics: true,
              onChanged: (val) {
                pickNumber(val);
              }),
          SizedBox(
            height: 30,
          ),
          Text(
            '$timeFormat',
            style: TextStyle(
              fontSize: 22,
            ),
          ),
        ],
      ),
    );
  }
}
