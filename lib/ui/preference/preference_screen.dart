import 'package:flutter/material.dart';

class PreferenceScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              onChanged: (bool value) {},
              value: false,
            ),
          )
        ],
      ),
    );
  }
}
