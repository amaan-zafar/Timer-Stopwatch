import 'package:flutter/material.dart';
import 'package:timer_stopwatch/ui/preference/preference_screen.dart';
import 'package:timer_stopwatch/ui/tabs/timer_tab.dart';

import 'ui/tabs/stopwatch_tab.dart';

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Clock',
      theme: ThemeData(
        brightness: Brightness.dark,
        accentColor: Colors.red,
        canvasColor: Colors.grey[900],
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
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                height: 40,
                child: Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      child: Icon(
                        Icons.settings,
                        color: Colors.red,
                      ),
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (_) => PreferenceScreen()));
                      },
                    )),
              ),
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
        preferredSize: Size.fromHeight(40 + kToolbarHeight),
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
