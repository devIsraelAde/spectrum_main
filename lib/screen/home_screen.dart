import 'dart:isolate';
import 'dart:ui';

import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/screen/library.dart';
import 'package:spectrum_library/screen/download/download_screen.dart';
import 'package:spectrum_library/screen/registration.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/view_model/view_model.dart';
import 'package:spectrum_library/widgets/app_drawer.dart';
import 'package:provider/provider.dart';

import 'games/challenges_ui.dart';
import 'contact_support_screen.dart';
import 'note/note.dart';
import 'note/notebook_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home-screen';

  final List accessCodeBooks;

  HomeScreen({this.accessCodeBooks});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _pages = [Library(), DownloadScreen(), NotebookScreen(), ChallengesScreen()];

  @override
  void initState() {
    super.initState();
    context.read<DownloadProvider>().bindBackgroundIsolate();
    FlutterDownloader.registerCallback(DownloadProvider.downloadCallback);
    context.read<DownloadProvider>().prepare();
  }

  @override
  void dispose() {
    context.read<DownloadProvider>().unbindBackgroundIsolate();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0XFFFFFFFF),
      resizeToAvoidBottomInset: false,
      drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Image.asset(
          'assets/images/logo.png',
          width: 20,
          color: Colors.white,
          height: 20,
        ),
        //title(index: context.watch<DrawerBottomNavigation>().currentindex),
        centerTitle: true,
        elevation: 0,
      ),
      // drawer: AppDrawer(),
      bottomNavigationBar: Container(
        color: Constants.primaryColor,
        child: SalomonBottomBar(
          unselectedItemColor: Colors.white,
          currentIndex: context.watch<DrawerBottomNavigation>().currentindex,
          onTap: (index) {
            context.read<DrawerBottomNavigation>().selectedindex(index);
          },
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(FluentIcons.home_24_regular),
              title: Text("Home"),
              selectedColor: Colors.greenAccent,
            ),

            /// Likes
            SalomonBottomBarItem(
              icon: Icon(FluentIcons.arrow_download_24_regular),
              title: Text("Download"),
              selectedColor: Colors.greenAccent,
            ),

            /// Search
            SalomonBottomBarItem(
              icon: Icon(FluentIcons.note_24_regular),
              title: Text("Note"),
              selectedColor: Colors.greenAccent,
            ),

            /// Profile
            SalomonBottomBarItem(
              icon: Icon(FluentIcons.games_24_regular),
              title: Text("Game"),
              selectedColor: Colors.greenAccent,
            ),
          ],
        ),
      ),

//       BottomNavigationBar(
//         currentIndex: context.watch<DrawerBottomNavigation>().currentindex,
//         onTap: (index) {
//           context.read<DrawerBottomNavigation>().selectedindex(index); // SetState
//         }, // onTap
// //        unselectedItemColor: primaryColor,
//         selectedItemColor: Constants.primaryColor,
//         type: BottomNavigationBarType.fixed,

//         items: [
//           BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('Library')),
//           BottomNavigationBarItem(icon: Icon(Icons.move_to_inbox), title: Text('Downloads')),
//           BottomNavigationBarItem(icon: Icon(Icons.note_add), title: Text('Notebook')),
//           BottomNavigationBarItem(icon: Icon(Icons.gamepad), title: Text('Games')),
//         ],
//       ),
      floatingActionButton: context.watch<DrawerBottomNavigation>().currentindex == 2
          ? FloatingActionButton.extended(
              backgroundColor: Constants.primaryColor,
              onPressed: () {
                // context.read<DatabaseHelper>().deleteAllnote();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return AddNoteScreen(
                        note: Note(
                          title: '',
                          notes: '',
                          bookmark: false,
                        ),
                      );
                    },
                  ),
                );
              },
              label: Row(
                children: <Widget>[Icon(FluentIcons.note_add_24_regular), Text('Notes')],
              ),
            )
          : Container(),
      body: _pages[context.watch<DrawerBottomNavigation>().currentindex],
    );
  }

  Widget title({int index}) {
    switch (index) {
      case 0:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                'Library',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        );
        break;
      case 1:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Downloads', textAlign: TextAlign.center),
            ),
          ],
        );
        break;
      case 2:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Notes', textAlign: TextAlign.center),
            ),
          ],
        );
        break;
      case 3:
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              'assets/images/logo.png',
              width: 20,
              color: Colors.white,
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text('Games', textAlign: TextAlign.center),
            ),
          ],
        );
        break;
      default:
        return Text('');
    }
  }
}
