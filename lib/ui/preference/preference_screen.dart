import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_stopwatch/ui/global/theme/app_themes.dart';
import 'package:timer_stopwatch/ui/global/theme/bloc/theme_bloc.dart';

class PreferenceScreen extends StatefulWidget {
  @override
  _PreferenceScreenState createState() => _PreferenceScreenState();
}

class _PreferenceScreenState extends State<PreferenceScreen> {
  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<ThemeBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(8),
        children: [
          ListTile(
            title: Text('Dark mode'),
            trailing: Switch(
              activeColor: Colors.red,
              onChanged: (bool value) {
                AppThemeData selectedTheme = value == false
                    ? AppThemeData.LightTheme
                    : AppThemeData.DarkTheme;
                bloc.add(ThemeChanged(themeData: selectedTheme));
              },
              value:
                  bloc.state.themeData == appThemeData[AppThemeData.LightTheme]
                      ? false
                      : true,
            ),
          ),
          Divider(
            thickness: 1.5,
          )
        ],
      ),
    );
  }
}
