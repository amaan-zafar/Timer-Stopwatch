import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_stopwatch/ui/global/theme/bloc/theme_bloc.dart';
import 'package:timer_stopwatch/ui/home/home.dart';

void main() {
  runApp(ClockApp());
}

class ClockApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ThemeBloc(),
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Clock',
            theme: state.themeData,
            home: HomePage(),
          );
        },
      ),
    );
  }
}
