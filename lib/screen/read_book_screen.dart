import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:spectrum_library/screen/reading_pref_screen.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/end_drawer.dart';

class ReadBookScreen extends StatefulWidget {
  static const routeName = '/read-book';
  @override
  _ReadBookScreenState createState() => _ReadBookScreenState();
}

class _ReadBookScreenState extends State<ReadBookScreen> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Agriculture for Senior School 6'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.only(right: 10.0),
            child: GestureDetector(
              child: Text(
                'Aa',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, ReadingPrefScreen.routeName);
              },
            ),
          ),
          IconButton(
            icon: Icon(MdiIcons.hamburger, color: Colors.white),
            onPressed: () {
              _scaffoldKey.currentState.openEndDrawer();
            },
          ),
        ],
      ),
      endDrawer: EndDrawer(),
      body: SingleChildScrollView(
        child: Column(
//        mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width,
              height: 40.0,
              color: Colors.grey[300],
              child: Text(
                'Chapter One',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constants.primaryColor,
                  fontSize: 17.0,
                ),
              ),
            ),
            Text(
              'Introduction to Agriculture',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                  '   Agriculture is the science and art of cultivating plants \nsedentary human civilization, whereby farming of domesticated spices. Agriculture is the science and art of cultivating plants and livestock. '
                  'Agriculture was key development in the rise of \nsedentary human civilization, '
                  'whereby farming of domesticated \nspices. is the science and art of cultivating plants '
                  'and livestock. '
                  '\n\n   Agriculture was key development in the rise of \nsedentary Agriculture '
                  'is the science and art of \ncultivating and livestock. '
                  'Agriculture was key development \nin the rise sedentary human civilization, '
                  'whereby farming of \ndomesticated spices.'),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              color: Colors.redAccent,
              child: Text(
                'Agriculture was key development in the rise '
                '\nsedentary human civilization, whereby '
                '\nfarming of domesticated spices.',
              ),
            ),
            SizedBox(height: 30.0),
            LinearPercentIndicator(
              lineHeight: 5.0,
              percent: 0.4,
              progressColor: Constants.primaryColor,
              width: 300.0,
              alignment: MainAxisAlignment.center,
            ),
          ],
        ),
      ),
    );
  }
}
