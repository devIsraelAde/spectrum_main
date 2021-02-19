import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  static const pageChannel =
      const EventChannel('com.xiaofwang.epub_kitty/page');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Epub Reader'),
      ),
      body: Center(
        child: GestureDetector(
          onTap: () async {
            Directory appDocDir = await getApplicationDocumentsDirectory();
            print('$appDocDir');
            String iosBookPath = '${appDocDir.path}/4.epub';
//            String androidBookPath = 'file:///android_asset/PhysicsSyllabus.epub';
            String androidBookPath =
                'assets/epub/The_Adventures_of_Sherlock_Holmes.epub';
//            EpubKitty.setConfig("androidBook", "#32a852", "vertical", true);
//            EpubKitty.open(androidBookPath);
          },
          child: Container(
            child: Text('open epub'),
          ),
        ),
      ),
    );
  }
}
