import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spectrum_library/app/app.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/services/services.dart';

import 'dashboard_screen.dart';
import 'kid_home_screen.dart';

class KidGameBookDetails extends StatefulWidget {
  final GameBookData gameBookData;
  KidGameBookDetails({this.gameBookData});
  @override
  _KidGameBookDetailsState createState() => _KidGameBookDetailsState();
}

class _KidGameBookDetailsState extends State<KidGameBookDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Course',
          style: AppTextStyles.babystyle.copyWith(fontSize: MediaQuery.of(context).size.width / 15),
        ),
      ),
      body: SafeArea(
        child: ListView(
          physics: ScrollPhysics(),
          children: [
            SubjectCard(
                imagePath: '${Constants.domainNameUrl}${widget.gameBookData.cover}',
                onTapped: null,
                title: widget.gameBookData.booktitle,
                animation: null,
                index: null,
                level: widget.gameBookData.level),
            ListView.builder(
                shrinkWrap: true,
                itemCount: widget.gameBookData.level,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return DashBoardKidScreen();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
                      child: Container(
                        width: double.infinity,
                        height: MediaQuery.of(context).size.width / 4,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey,
                            )
                          ],
                          color: Color(0XFFF2F0F0),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            SvgPicture.network(
                              '${Constants.domainNameUrl}${widget.gameBookData.cover}',
                              width: 60,
                              height: 40,
                            ),
                            Text(
                              'Level ${index + 1}',
                              style: AppTextStyles.babystyle.copyWith(
                                fontSize: MediaQuery.of(context).size.width / 20,
                              ),
                            ),
                            Icon(
                              FluentIcons.play_circle_24_filled,
                              color: Colors.yellow,
                              size: 15,
                            )
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ],
        ),
      ),
    );
  }
}
