import 'package:flutter/material.dart';
import 'package:timer_stopwatch/tabs/timer_tab.dart';
import 'package:timer_stopwatch/tabs/stopwatch_tab.dart';

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Clock',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.red,
        canvasColor: Colors.grey[900],
        textTheme: TextTheme(),
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController tb;

  @override
  void initState() {
    tb = TabController(
      length: 2,
      vsync: this,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        child: Container(
            child: SafeArea(
          child: Column(
            children: <Widget>[
              // Expanded(
              //   child: Container(),
              // ),
              TabBar(
                tabs: <Widget>[Text('Timer'), Text('Stopwatch')],
                labelStyle:
                    TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                labelPadding: EdgeInsets.symmetric(vertical: 16),
                controller: tb,
              ),
            ],
          ),
        )),
        preferredSize: Size.fromHeight(kToolbarHeight),
      ),
      body: TabBarView(
        children: <Widget>[
          TimerTab(),
          StopwatchTab(),
        ],
        controller: tb,
      ),
    );
  }
}
