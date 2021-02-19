import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spectrum_library/screen/book_detail.dart';
import 'package:spectrum_library/services/services.dart';

class EndDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.55,
      child: Drawer(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 50.0, right: 20.0),
                width: MediaQuery.of(context).size.width * 0.55,
                color: Constants.primaryColor,
                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetail()));
                      },
                      child: Container(
                        child: Image(
                          image: AssetImage('assets/images/book1.png'),
                          width: 100.0,
                          height: 120.0,
                        ),
                        alignment: Alignment.center,
                      ),
                    ),
                    Text(
                      'Agriculture for Senior Secondary Schools 3',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(height: 7.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Mugumu Deogratias',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            'Ayodeji E.A',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'Ibrahim Sola F',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                          Text(
                            'Ucheana J.N',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 10.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            BookExpansionTile('Chapter One'),
                            BookExpansionTile('Chapter Two'),
                            BookExpansionTile('Chapter Three'),
                            BookExpansionTile('Chapter Four'),
                            BookExpansionTile('Chapter Five'),
                            BookExpansionTile('Chapter Six'),
                            BookExpansionTile('Chapter Seven'),
                            BookExpansionTile('Chapter Eight'),
                            BookExpansionTile('Chapter Nine'),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BookExpansionTile extends StatelessWidget {
  final String chapterNumber;

  BookExpansionTile(this.chapterNumber);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        accentColor: Colors.white,
        unselectedWidgetColor: Colors.white,
      ),
      child: ExpansionTile(
        title: Text(
          chapterNumber,
          style: TextStyle(
            color: Colors.white,
            fontSize: 15.0,
          ),
        ),
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(3.0),
              color: Colors.black,
              child: Text(
                'Introduction to Agriculture',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,
                ),
              )),
          Text(
            'Importance of Agriculture',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
          Text(
            'Different Agriculture produce',
            style: TextStyle(
              color: Colors.white,
              fontSize: 12.0,
            ),
          ),
        ],
      ),
    );
  }
}
