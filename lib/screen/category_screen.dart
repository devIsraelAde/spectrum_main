import 'package:flutter/material.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/app_drawer.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = '/category';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Category'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {},
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Text('Category Screen'),
      ),
    );
  }
}
