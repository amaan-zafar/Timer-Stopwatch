import 'package:flutter/material.dart';
import 'package:timer_stopwatch/ui/home/stopwatch_tab.dart';
import 'package:timer_stopwatch/ui/home/timer_tab.dart';
import 'package:timer_stopwatch/ui/preference/preference_screen.dart';

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
                margin: const EdgeInsets.symmetric(horizontal: 18),
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
        preferredSize: Size.fromHeight(44 + kToolbarHeight),
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
