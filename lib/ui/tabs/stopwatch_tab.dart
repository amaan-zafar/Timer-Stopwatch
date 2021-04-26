import 'package:flutter/material.dart';
import 'package:timer_stopwatch/ui/global/widgets/long_button.dart';
import 'package:timer_stopwatch/ui/global/widgets/short_button.dart';
import 'dart:async';

class StopwatchTab extends StatefulWidget {
  @override
  _StopwatchTabState createState() => _StopwatchTabState();
}

class _StopwatchTabState extends State<StopwatchTab> {
  bool startIsPressed;

  bool startBtnVisibility = true;

  bool stopBtnVisibility = false;

  var stopwatch = Stopwatch();

  Timer _timer;

  final dur = const Duration(milliseconds: 1);

  String timeToDisplay = '00 : 00 . 000';

  void startTimer() {
    Timer(dur, keeprunning);
  }

  void keeprunning() {
    if (stopwatch.isRunning) {
      startTimer();
    }
    setState(() {
      timeToDisplay = // stopwatch.elapsed.inHours.toString().padLeft(2, '0') + ' : ' +
          (stopwatch.elapsed.inMinutes).toString().padLeft(2, '0') +
              ' : ' +
              (stopwatch.elapsed.inSeconds % 60).toString().padLeft(2, '0') +
              ' . ' +
              (stopwatch.elapsed.inMilliseconds % 1000)
                  .toString()
                  .padLeft(3, '0');
    });
  }

  void startStopwatch() {
    setState(() {
      startBtnVisibility = false;
      stopBtnVisibility = true;
    });
    stopwatch.start();
    startTimer();
  }

  void resumeStopwatch() {
    setState(() {
      stopBtnVisibility = true;
    });
    stopwatch.start();
    startTimer();
  }

  void stopStopwatch() {
    setState(() {
      stopBtnVisibility = false;
    });
    stopwatch.stop();
  }

  void resetStopwatch() {
    setState(() {
      startBtnVisibility = true;
    });
    stopwatch.stop();
    stopwatch.reset();
    timeToDisplay = '00 : 00 . 000';
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
        Center(
          child: Text(
            timeToDisplay,
            style: TextStyle(
              fontSize: 50,
            ),
          ),
        ),
        SizedBox(
          height: 350,
        ),
        startBtnVisibility == true
            ? FullBtn('Start', () {
                startStopwatch();
              })
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                    stopBtnVisibility == true
                        ? HalfBtn('Pause', () {
                            stopStopwatch();
                          })
                        : HalfBtn('Resume', () {
                            resumeStopwatch();
                          }),
                    HalfBtn('Reset', () {
                      resetStopwatch();
                    })
                  ])
      ]),
    );
  }
}
