import 'package:flutter/material.dart';
import 'package:spectrum_library/screen/games/games.dart';

class ChallengesScreen extends StatelessWidget {
  static const routeName = '/challenge';

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ChallengeCard(
              onTapped: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return WebGamesUI(
                    gamepath: 'assets/2048/index.html',
                  );
                }));
                // Scaffold.of(context).showSnackBar(SnackBar(content: Text('No Game Yet')));
              },
              imageUrl: 'assets/images/2048_img.png',
              title: '2048',
              description: "SA small clone of 1024, based on Saming's 2048 (also a clone).",
            ),
            // ChallengeCard(
            //   onTapped: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return WebGamesUI(
            //         gamepath: 'assets/chess/chess.html',
            //       );
            //     }));
            //     // Scaffold.of(context).showSnackBar(SnackBar(content: Text('No Game Yet')));
            //   },
            //   imageUrl: 'assets/images/challenge2.png',
            //   title: 'Chess',
            //   description: 'Discover it.',
            // ),
            // ChallengeCard(
            //   onTapped: () {
            //     // Scaffold.of(context).showSnackBar(SnackBar(content: Text('No Game Yet')));
            //     Navigator.push(context, MaterialPageRoute(builder: (context) {
            //       return WebGamesUI(
            //         gamepath: 'assets/TicTacToe/index.html',
            //       );
            //     }));
            //   },
            //   imageUrl: 'assets/images/challenge3.png',
            //   title: 'TicTacToe',
            //   description: 'The old paper game.',
            // ),
            // ChallengeCard(
            //   onTapped: () {
            //     Scaffold.of(context).showSnackBar(SnackBar(content: Text('No Game Yet')));
            //   },
            //   imageUrl: 'assets/images/challenge4.png',
            //   title: 'Chess Play',
            //   description: 'Think fast! Think wide!',
            // ),
          ],
        ),
      ),
    );
  }
}

class ChallengeCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final Function onTapped;

  ChallengeCard({this.imageUrl, this.title, this.description, this.onTapped});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: onTapped,
      child: Card(
        child: Row(
          children: <Widget>[
            Container(
              width: width * .30,
              child: Image(
                image: AssetImage(imageUrl),
                width: 100.0,
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
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10.0),
                  Text(
                    description,
                    maxLines: 3,
                    style: TextStyle(fontSize: 13.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
