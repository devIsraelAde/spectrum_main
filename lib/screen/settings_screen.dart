import 'package:flutter/material.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/app_drawer.dart';

class SettingsScreen extends StatelessWidget {
  static const routeName = '/settings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Settings'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Settings Screen'),
      ),
    );
  }
}
