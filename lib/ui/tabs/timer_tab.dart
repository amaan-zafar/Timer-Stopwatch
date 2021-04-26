import 'package:flutter/material.dart';
import 'dart:async';
import 'package:timer_stopwatch/widgets/long_button.dart';
import 'package:timer_stopwatch/widgets/short_button.dart';
import 'package:timer_stopwatch/widgets/time_picker.dart';

class TimerTab extends StatefulWidget {
  @override
  _TimerTabState createState() => _TimerTabState();
}

class _TimerTabState extends State<TimerTab> {
  bool startBtnVisibility = true;
  bool pauseBtnVisibility = false;
  int timeInSeconds = 0;
  int hr = 0;
  int min = 0;
  int sec = 0;
  Timer _timer;

  final oneSec = const Duration(seconds: 1);

  void startTimer() {
    if (hr == 0 && min == 0 && sec == 0) {
      showSnackbar(context);
      return;
    }
    setState(() {
      startBtnVisibility = false;
      pauseBtnVisibility = true;
      timeInSeconds = hr * 3600 + min * 60 + sec;
      _timer = Timer.periodic(
          oneSec,
          (Timer timer) => setState(() {
                if (timeInSeconds < 1) {
                  _timer.cancel();
                } else {
                  timeInSeconds -= 1;
                }
              }));
    });
  }

  void pauseTimer() {
    setState(() {
      pauseBtnVisibility = false;
      _timer.cancel();
    });
  }

  void resumeTimer() {
    setState(() {
      pauseBtnVisibility = true;
      _timer = Timer.periodic(
          oneSec,
          (Timer timer) => setState(() {
                if (timeInSeconds < 1) {
                  cancelTimer();
                  startBtnVisibility = true;
                  pauseBtnVisibility = false;
                } else {
                  timeInSeconds -= 1;
                }
              }));
    });
  }

  void cancelTimer() {
    setState(() {
      startBtnVisibility = true;
      timeInSeconds = 0;
      _timer.cancel();
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child:
            Column(mainAxisAlignment: MainAxisAlignment.end, children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        TimePickerColumn(
            timeFormat: 'HH',
            maxValue: 23,
            pickNumber: (val) {
              setState(() {
                hr = val;
              });
            }),
        TimePickerColumn(
            timeFormat: 'MM',
            maxValue: 60,
            pickNumber: (val) {
              setState(() {
                min = val;
              });
            }),
        TimePickerColumn(
            timeFormat: 'SS',
            maxValue: 60,
            pickNumber: (val) {
              setState(() {
                sec = val;
              });
            })
      ]),
      SizedBox(
        height: 30,
      ),
      Center(
        child: Text(
          '${timeInSeconds ~/ 3600}'.padLeft(2, '0') +
              '  :  ' +
              '${(timeInSeconds % 3600) ~/ 60}'.padLeft(2, '0') +
              '  :  ' +
              '${(timeInSeconds % 3600) % 60}'.padLeft(2, '0'),
          style: TextStyle(
            fontSize: 44,
          ),
        ),
      ),
      SizedBox(
        height: 200,
      ),
      startBtnVisibility == true
          ? FullBtn('Start', () {
              startTimer();
            })
          : Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              pauseBtnVisibility == true
                  ? HalfBtn('Pause', () {
                      pauseTimer();
                    })
                  : HalfBtn('Resume', () {
                      resumeTimer();
                    }),
              HalfBtn('Cancel', () {
                cancelTimer();
              })
            ])
    ]));
  }

  void showSnackbar(BuildContext context) {
    var snackbar = SnackBar(
      content: Text('Pick a non-zero time'),
    );

    Scaffold.of(context).showSnackBar(snackbar);
  }
}
