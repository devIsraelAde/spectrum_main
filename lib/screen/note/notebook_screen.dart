import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/app_drawer.dart';
import 'package:spectrum_library/screen/note/bookmark.dart';
import 'package:spectrum_library/widgets/colored_tabbar.dart';
import 'package:spectrum_library/screen/note/notebook_tabbar.dart';

class NotebookScreen extends StatefulWidget {
  static const routeName = '/notebook';

  @override
  _NotebookScreenState createState() => _NotebookScreenState();
}

class _NotebookScreenState extends State<NotebookScreen> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: 2,
      child: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 0,
              child: ColoredTabBar(
                TabBar(
                  unselectedLabelColor: Colors.grey,
                  indicatorColor: Colors.green[900],
                  labelColor: Constants.primaryColor,
                  indicatorWeight: 3.0,
                  tabs: <Widget>[
                    Tab(
                        icon: Icon(
                      FluentIcons.document_edit_24_filled,
//                    color: primaryColor,
                    )),
                    Tab(
                        icon: Icon(
                      FluentIcons.bookmark_24_regular,
//                    color: primaryColor,
                    )),
                  ],
                ),
              ),
            ),
            Expanded(
              child: TabBarView(
                children: <Widget>[
                  NotebookTabBar(),
                  Bookmark(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
