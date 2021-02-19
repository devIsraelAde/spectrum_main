import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:spectrum_library/app/app.dart';
import 'package:spectrum_library/view_model/view_model.dart';
import 'package:spectrum_library/widgets/fancy_fab.dart';
import 'package:spectrum_library/widgets/widget.dart';

class DashBoardKidScreen extends StatefulWidget {
  @override
  _DashBoardKidScreenState createState() => _DashBoardKidScreenState();
}

class _DashBoardKidScreenState extends State<DashBoardKidScreen> {
  ValueNotifier<int> _menuNotifier = ValueNotifier(0);
  ScrollController _scrollController;
  KidGameProvider _kidGameProvider;

  @override
  void initState() {
    super.initState();
    _kidGameProvider = context.read<KidGameProvider>();

    _kidGameProvider.mockresponse();
    context.read<KidGameProvider>().setcharacters(menuselection: 0);
  }

  @override
  dispose() {
    super.dispose();
    context.read<DrawerBottomNavigation>().selectedindex(0);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return StreamProvider<KidGameProvider>(
      initialData: null,
      create: (context) {},
      child: Scaffold(
        appBar: AppBar(),
        drawer: Drawer(
          child: GameLevelsUI(
            title: 'Alphabet',
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              SalomonBottomBar(
                currentIndex: context.watch<DrawerBottomNavigation>().currentindex,
                onTap: (index) {
                  context.read<DrawerBottomNavigation>().selectedindex(index);
                },
                items: [
                  SalomonBottomBarItem(
                    icon: Icon(FluentIcons.book_open_24_regular),
                    title: Text("Introduction"),
                    selectedColor: Colors.purple,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(FluentIcons.book_letter_24_regular),
                    title: Text("Example"),
                    selectedColor: Colors.pink,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(FluentIcons.notebook_question_mark_24_regular),
                    title: Text("Questions"),
                    selectedColor: Colors.orange,
                  ),
                  SalomonBottomBarItem(
                    icon: Icon(FluentIcons.chat_bubbles_question_24_regular),
                    title: Text("Feedback"),
                    selectedColor: Colors.teal,
                  ),
                ],
              ),
              context.watch<KidGameProvider>().kidstate.map(
                initial: (_) {
                  return Center(child: CupertinoActivityIndicator());
                },
                loading: (_) {
                  return Center(child: CupertinoActivityIndicator());
                },
                loaded: (kidgames) {
                  //TODO:
                  // switch (kidgames.kidGames.uuid) {
                  //   case 'grid_2_drag_drop':
                  //     return MappingEffectUI(
                  //       kidGames: kidgames.kidGames,
                  //     );
                  //     break;
                  //   case 'drag_to_box_horizontal':
                  //     return MappingEffectUI(
                  //       kidGames: kidgames.kidGames,
                  //     );
                  //     break;
                  //   case 'drag_to_box_vertical':
                  //     return MappingEffectUI(
                  //       kidGames: kidgames.kidGames,
                  //     );
                  //     break;
                  //   case 'trace_and_paint_image':
                  //     return FlutterDraw();
                  //     break;
                  //   default:
                  //     return Container();
                  // }
                },
                error: (_) {
                  return Center(child: CupertinoActivityIndicator());
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FancyFab(),
        bottomNavigationBar: Consumer<KidGameProvider>(
          builder: (context, _kidmenus, _) => _kidmenus.getcharacters != null
              ? _kidmenus.getcharacters.selectedmenu != 2
                  ? Container(
                      height: MediaQuery.of(context).size.height / 15,
                      child: Card(
                        elevation: 10,
                        // color: Constants.primaryColor,
                        child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: _kidmenus.getcharacters.characters.length ?? 0,
                            itemBuilder: (context, index) {
                              return LongPressDraggable<String>(
                                data: _kidmenus.getcharacters.characters.elementAt(index),
                                feedback: Material(
                                  // color: Constants.primaryColor,
                                  child: _kidmenus.getcharacters.characters.elementAt(index).contains('#')
                                      ? Container(
                                          color: Color(int.parse(
                                              '0xff${_kidmenus.getcharacters.characters.elementAt(index).replaceFirst(new RegExp(r'#'), '')}')),
                                        )
                                      : Text(
                                          _kidmenus.getcharacters.characters.elementAt(index),
                                          style: AppTextStyles.h3style.copyWith(fontSize: 80),
                                        ),
                                ),
                                childWhenDragging: Material(
                                  child: _kidmenus.getcharacters.characters.elementAt(index).contains('#')
                                      ? Container(
                                          color: Color(int.parse(
                                              '0xff${_kidmenus.getcharacters.characters.elementAt(index).replaceFirst(new RegExp(r'#'), '')}')),
                                        )
                                      : Text(
                                          _kidmenus.getcharacters.characters.elementAt(index),
                                          style: AppTextStyles.h3style.copyWith(fontSize: 25),
                                        ),
                                ),
                                child: Material(
                                  color: Colors.pinkAccent,
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                                      child: _kidmenus.getcharacters.characters.elementAt(index).contains('#')
                                          ? Padding(
                                              padding: const EdgeInsets.all(6.0),
                                              child: Container(
                                                width: 30,
                                                height: 30,
                                                color: Color(int.parse(
                                                    '0xff${_kidmenus.getcharacters.characters.elementAt(index).replaceFirst(new RegExp(r'#'), '')}')),
                                              ),
                                            )
                                          : Text(
                                              _kidmenus.getcharacters.characters.elementAt(index),
                                              style: AppTextStyles.h3style.copyWith(fontSize: 40),
                                            ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    )
                  : BottomToolBar()
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class GameLevelsUI extends StatefulWidget {
  const GameLevelsUI({
    Key key,
    String title,
    List levels,
  })  : _title = title,
        super(key: key);

  final String _title;

  @override
  _GameLevelsUIState createState() => _GameLevelsUIState();
}

class _GameLevelsUIState extends State<GameLevelsUI> {
  ValueNotifier<GameLevelNotifier> _gamelevelNotifier;

  KidGameProvider _kidGameProvider;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _gamelevelNotifier = ValueNotifier<GameLevelNotifier>(GameLevelNotifier(0));
    _kidGameProvider = context.read<KidGameProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _gamelevelNotifier,
      builder: (context, level, _) => StreamProvider<KidGameProvider>(
        initialData: null,
        create: (context) {},
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget._title,
                  style: AppTextStyles.babystyle.copyWith(fontSize: 20),
                ),
              )),
              ListView(
                shrinkWrap: true,
                physics: ClampingScrollPhysics(),
                children: List.generate(
                  4,
                  (index) => ListTile(
                    onTap: () {
                      switch (index) {
                        case 0:
                          _kidGameProvider.mockresponse(number: 0);
                          break;
                        case 1:
                          _kidGameProvider.mockresponse(number: 1);
                          break;
                        case 2:
                          _kidGameProvider.mockresponse(number: 2);
                          break;
                        case 3:
                          _kidGameProvider.mockresponse(number: 3);
                          break;
                        default:
                          _kidGameProvider.mockresponse(number: 4);
                          break;
                      }
                      Navigator.pop(context);
                      //todo:s check if level is complete then cancel afterwards add the new level screen to the page
                    },
                    leading: Icon(Icons.gamepad),
                    title: Text(
                      'Level $index',
                    ),
                    trailing: Icon(CupertinoIcons.download_circle), //todo: change after level has been downloaded
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// LayoutBuilder(builder: (context, constraint) {
//   return SingleChildScrollView(
//       child: ConstrainedBox(
//           constraints: BoxConstraints(minHeight: constraint.maxHeight),
//           child: IntrinsicHeight(
//             child: NavigationRail(
//               elevation: 3.0,
//               leading: IconButton(
//                 icon: Icon(Icons.menu),
//                 onPressed: () {
//                   Scaffold.of(context).openDrawer();
//                 },
//               ),
//               destinations: [
//                 NavigationRailDestination(
//                     icon: SvgPicture.asset(
//                       AppVectors.alphabetIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     selectedIcon: SvgPicture.asset(
//                       AppVectors.alphabetIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     label: Text('')),
//                 NavigationRailDestination(
//                     icon: SvgPicture.asset(
//                       AppVectors.numbersIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     selectedIcon: SvgPicture.asset(
//                       AppVectors.numbersIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     label: Text('')),
//                 NavigationRailDestination(
//                     icon: SvgPicture.asset(
//                       AppVectors.colorIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     selectedIcon: SvgPicture.asset(
//                       AppVectors.colorIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     label: Text('')),
//                 NavigationRailDestination(
//                     icon: SvgPicture.asset(
//                       AppVectors.symbolIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     selectedIcon: SvgPicture.asset(
//                       AppVectors.symbolIcon,
//                       height: 30,
//                       width: 30,
//                     ),
//                     label: Text('')),
//               ],
//               labelType: NavigationRailLabelType.selected,
//               selectedIndex: value,
//               onDestinationSelected: (value) {
//                 _menuNotifier.value = value;
//                 context.read<KidGameProvider>().setcharacters(menuselection: value);
//               },
//             ),
//           )));
// }),
