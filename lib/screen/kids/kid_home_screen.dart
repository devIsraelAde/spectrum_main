import 'dart:math';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/app/app.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/database/moor/moor_kid_games/dao/dao.dart';
import 'package:spectrum_library/screen/kids/kids.dart';
import 'package:spectrum_library/services/services.dart';

import 'kid_gamebook_detail.dart';

class KidHomeScreen extends StatefulWidget {
  @override
  _KidHomeScreenState createState() => _KidHomeScreenState();
}

class _KidHomeScreenState extends State<KidHomeScreen> with TickerProviderStateMixin {
  AnimationController _animationController;
  AnimationController _animationControllerColor;

  AnimationController _animationControllerArrowIcon;
  Animation<int> _animation;
  Animation<int> _animationArrowIcon;
  int _selectedIndex = 0;
  DatabaseHelper _databaseHelper;
  ValueNotifier<String> _subjectNotifier = ValueNotifier('Mathematics');

  @override
  void initState() {
    super.initState();
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    // ]);
    // SystemChrome.setEnabledSystemUIOverlays([]);
    _databaseHelper = context.read<DatabaseHelper>();
    _animationController = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationControllerColor = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationControllerArrowIcon = AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _animationController.repeat();
    _animationControllerArrowIcon.repeat();
    _animation = IntTween(begin: 0, end: 30).animate(_animationController);
    _animationArrowIcon = IntTween(begin: 0, end: 2).animate(_animationControllerArrowIcon);
  }

  @override
  dispose() {
    // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom, SystemUiOverlay.top]);
    // SystemChrome.setPreferredOrientations([
    //   DeviceOrientation.landscapeRight,
    //   DeviceOrientation.landscapeLeft,
    //   DeviceOrientation.portraitUp,
    //   DeviceOrientation.portraitDown,
    // ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<GameBookData>>(
      stream: context.watch<GameBookDao>().watchAllBookGames(),
      builder: (context, snapshot) => snapshot.hasData
          ? ValueListenableBuilder(
              valueListenable: _subjectNotifier,
              builder: (context, value, _) => Material(
                child: Row(
                  children: [
                    LayoutBuilder(builder: (context, constraint) {
                      return SingleChildScrollView(
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              minHeight: constraint.maxHeight, maxWidth: MediaQuery.of(context).size.width / 6),
                          child: IntrinsicHeight(
                            child: NavigationRail(
                              leading: Transform.translate(
                                  offset: Offset(0.0, _animationArrowIcon.value.toDouble()),
                                  child: Icon(FluentIcons.arrow_down_left_24_filled)),
                              elevation: 4,
                              backgroundColor: Colors.greenAccent,
                              selectedIndex: _selectedIndex,
                              onDestinationSelected: (int index) {
                                _subjectNotifier.value = snapshot.data.toSet().elementAt(index).subject;
                                setState(() {
                                  _selectedIndex = index;
                                });
                              },
                              labelType: NavigationRailLabelType.selected,
                              destinations: snapshot.data
                                  .toSet()
                                  .map((e) => e.subject)
                                  .toList()
                                  .map<NavigationRailDestination>((e) => NavigationRailDestination(
                                        icon: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width / 8),
                                          child: Transform.rotate(
                                              angle: 3 * pi / 2,
                                              child: Text(e,
                                                  style: AppTextStyles.babystyle
                                                      .copyWith(fontSize: MediaQuery.of(context).size.width / 30))),
                                        ),
                                        selectedIcon: Padding(
                                          padding:
                                              EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.width / 8),
                                          child: Transform.rotate(
                                              angle: 3 * pi / 2,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Text(e,
                                                      style: AppTextStyles.babystyle.copyWith(
                                                          color: Colors.green,
                                                          fontSize: MediaQuery.of(context).size.width / 30)),
                                                  Icon(Icons.brightness_1, size: 5.0, color: Colors.green),
                                                ],
                                              )),
                                        ),
                                        label: Transform.rotate(angle: 3 * pi / 2, child: Text('')),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ),
                      );
                    }),
                    Expanded(
                      child: Scrollbar(
                        child: ListView(
                          shrinkWrap: true,
                          physics: AlwaysScrollableScrollPhysics(),
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 40.0, bottom: 20, left: 20, right: 20),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text('${AppStrings.welcome}',
                                          textAlign: TextAlign.left,
                                          style: AppTextStyles.h3style.copyWith(
                                              fontSize: MediaQuery.of(context).size.width / 25,
                                              fontWeight: FontWeight.w300)),
                                      Text(
                                          _databaseHelper.getuser().last_name +
                                              '' +
                                              _databaseHelper.getuser().first_name,
                                          style: AppTextStyles.babystyle
                                              .copyWith(fontSize: MediaQuery.of(context).size.width / 15)),
                                    ],
                                  ),
                                  Icon(
                                    FluentIcons.person_24_filled,
                                    size: MediaQuery.of(context).size.width / 15,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                            ),
                            VerticalDivider(),
                            ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data.where((subject) => subject.subject == value).length,
                              physics: ScrollPhysics(),
                              itemBuilder: (context, index) {
                                final gamebook =
                                    snapshot.data.where((subject) => subject.subject == value).elementAt(index);
                                return SubjectCard(
                                  index: index,
                                  level: gamebook.level,
                                  animation: _animation,
                                  imagePath: '${Constants.domainNameUrl}${gamebook.cover}',
                                  title: value,
                                  onTapped: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return KidGameBookDetails(
                                            gameBookData: gamebook,
                                          );
                                          // return DashBoardKidScreen();
                                        },
                                      ),
                                    );
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : Material(
              child: Center(
                child: CircularProgressIndicator(
                  valueColor:
                      _animationController.drive(ColorTween(begin: Colors.greenAccent, end: Constants.primaryColor)),
                ),
              ),
            ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    @required String imagePath,
    @required VoidCallback onTapped,
    @required String title,
    @required Animation<int> animation,
    @required int index,
    @required int level,
    Key key,
  })  : _imagePath = imagePath,
        _title = title,
        _onTapped = onTapped,
        _animation = animation,
        _index = index,
        _level = level,
        super(key: key);
  final String _imagePath;
  final String _title;
  final VoidCallback _onTapped;
  final Animation<int> _animation;
  final int _index;
  final int _level;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: _onTapped,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, child) => Padding(
          padding: const EdgeInsets.all(20.0),
          child: Stack(
            children: [
              Padding(
                padding: EdgeInsets.only(top: MediaQuery.of(context).size.height / 10),
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width / 2.5,
                  decoration: BoxDecoration(
                    // color: Colors.pinkAccent,
                    gradient: LinearGradient(colors: [Colors.pinkAccent, Colors.pink], stops: [0.6, 0.4]),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.width / 9,
                        left: 20,
                        right: 20,
                        bottom: MediaQuery.of(context).size.width / 70),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          _title,
                          style: AppTextStyles.babystyle
                              .copyWith(fontSize: MediaQuery.of(context).size.width / 15, color: Colors.white),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              _level >= 1 ? 'Level  0 - Level $_level' : 'Level $_level',
                              style: AppTextStyles.babystyle
                                  .copyWith(color: Colors.white, fontSize: MediaQuery.of(context).size.width / 25),
                            ),
                            TextButton(
                              onPressed: null,
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: MediaQuery.of(context).size.width / 70,
                                    vertical: MediaQuery.of(context).size.width / 100),
                                child: Text('Play',
                                    style: AppTextStyles.babystyle.copyWith(
                                        color: Colors.white, fontSize: MediaQuery.of(context).size.width / 25)),
                              ),
                              style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.grey),
                                  shape: MaterialStateProperty.all<OutlinedBorder>(
                                      RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)))),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 0,
                right: 0,
                left: 0,
                child: SvgPicture.network(
                  _imagePath,
                  width: MediaQuery.of(context).size.width / 3,
                  height: MediaQuery.of(context).size.width / 3,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// crossAxisCount: 2,
//               shrinkWrap: true,
//               children: [
//                 SubjectCard(
//                   animation: _animation,
//                   imagePath: AppVectors.alphabetIcon,
//                   title: AppStrings.english,
//                   onTapped: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return DashBoardKidScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//                 SubjectCard(
//                   animation: _animation,
//                   imagePath: AppVectors.numbersIcon,
//                   title: AppStrings.math,
//                   onTapped: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) {
//                           return DashBoardKidScreen();
//                         },
//                       ),
//                     );
//                   },
//                 ),
//               ],
