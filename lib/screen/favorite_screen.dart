import 'package:flutter/material.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/app_drawer.dart';

class FavoriteScreen extends StatelessWidget {
  static const routeName = '/favorite';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Favorites'),

        centerTitle: true,
        // actions: <Widget>[
        //   IconButton(
        //     icon: Icon(Icons.more_vert),
        //     onPressed: () {},
        //   ),
        // ],
      ),
      // drawer: AppDrawer(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Center(child: Text('No Favorites Yet!'))
          // FavoriteCard(
          //   imageUrl: 'assets/images/book1.png',
          //   title: 'Agriculture for Senior Secondary Schools 3',
          //   date: '20/02/2020',
          // ),
          // FavoriteCard(
          //   imageUrl: 'assets/images/book3.png',
          //   title: 'Mathmatics for Primary Schools 6',
          //   date: '20/02/2020',
          // ),
          // FavoriteCard(
          //   imageUrl: 'assets/images/book1.png',
          //   title: 'Agriculture for Senior Secondary Schools 3',
          //   date: '20/02/2020',
          // ),
        ],
      ),
    );
  }
}

class FavoriteCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String date;

  FavoriteCard({this.imageUrl, this.title, this.date});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Card(
      elevation: 5.0,
      child: Row(
        children: <Widget>[
          Container(
            width: width * .30,
            child: Image(
              image: AssetImage(imageUrl),
              width: 50.0,
              height: 100.0,
            ),
          ),
          SizedBox(width: 5.0),
          Container(
            width: width * .60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  maxLines: 2,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    Text(
                      'Last Read',
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    ),
                    Spacer(),
                    Text(
                      date,
                      style: TextStyle(fontSize: 13.0, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
