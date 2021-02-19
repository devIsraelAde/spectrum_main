import 'package:flutter/material.dart';
import 'package:spectrum_library/services/services.dart';

class ReadingPrefScreen extends StatelessWidget {
  static const routeName = '/reading-pref';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Constants.primaryColor,
          title: Text('Reading Preferences'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PrefCard('Font Size', 'Small'),
              PrefCard('Font Family', 'San Serif'),
              Card(
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 70.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Color',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Change background color',
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 30.0,
                            height: 25.0,
                            color: Colors.black,
                          ),
                          SizedBox(width: 3.0),
                          Container(
                            width: 30.0,
                            height: 25.0,
                            color: Colors.brown,
                          ),
                          SizedBox(width: 3.0),
                          Container(
                            width: 30.0,
                            height: 25.0,
                            color: Constants.primaryColor,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              PrefCard('Screen Orientation', 'Auto'),
              PrefCard('Reading Mode', 'Scrolling'),
              Card(
                elevation: 3.0,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                  height: 70.0,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Use Device Brightness',
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 17.0,
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            'Uncheck to manually change brightness\nwithin the Reader',
                            maxLines: 2,
                            style: TextStyle(
                              fontSize: 13.0,
                            ),
                          ),
                          Spacer(),
                          Container(
                            width: 30.0,
                            height: 25.0,
                            color: Constants.primaryColor,
                            child: Checkbox(
                              activeColor: Constants.primaryColor,
                              checkColor: Colors.white,
                              value: true,
                              onChanged: (value) {},
                            ),
                          ),
                          SizedBox(width: 3.0),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

class PrefCard extends StatelessWidget {
  final String pref;
  final String selected;

  PrefCard(this.pref, this.selected);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        height: 70.0,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              pref,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 17.0,
              ),
            ),
            Text(
              selected,
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
