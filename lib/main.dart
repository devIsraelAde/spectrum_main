import 'dart:developer';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:spectrum_library/screen/carousel_slider.dart';
import 'package:spectrum_library/screen/errorpage_screen.dart';
import 'package:spectrum_library/screen/home_screen.dart';
import 'package:spectrum_library/screen/registration.dart';
import 'package:spectrum_library/services/api_services.dart';
import 'package:spectrum_library/services/constants.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/view_model/download_provider.dart';
import 'package:spectrum_library/view_model/view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences locationStorage = await SharedPreferences.getInstance();
  await Constants.init();

  print(locationStorage.getInt('status'));

  await FlutterDownloader.initialize(debug: true // optional: set false to disable printing logs to console
      );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  // SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
  // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));

  // await DatabaseHelper().init();

  runApp(MultiProvider(
    providers: [
      Provider(
        create: (_) => KidsGameDatabase().gameBookDao,
      ),
      Provider(create: (context) => DatabaseHelper(gameBookDao: Provider.of<GameBookDao>(context, listen: false))),
      Provider(create: (context) => ApiServices(dbhelper: Provider.of<DatabaseHelper>(context, listen: false))),
      ChangeNotifierProvider(create: (_) => DownloadProvider()),
      ChangeNotifierProvider(create: (_) => DrawerBottomNavigation()),
      ListenableProvider(create: (_) => Progress()),
      ChangeNotifierProvider(create: (_) => KidGameProvider()),
      ChangeNotifierProvider(
        create: (context) => NavigationService(),
      ),
    ],
    builder: (context, _) => MaterialApp(
      // debugShowMaterialGrid: false,
      debugShowCheckedModeBanner: false,

      title: 'Spectrum',
      theme: ThemeData(
        primarySwatch: Colors.green,
        cursorColor: Constants.primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      navigatorKey: context.watch<NavigationService>().navigatorKey,
      //home: status == 'registered' ? Library() : MySplashScreen(),
      home: locationStorage.getInt('status') != null && locationStorage.getInt('status') != 0
          ? HomeScreen()
          : CarouselSlider(),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/registration':
            return MaterialPageRoute(builder: (context) => Registration());
            break;
          default:
            return MaterialPageRoute(builder: (context) => ErrorPageScreen());
        }
      },
    ),
  )
      // ),
      );
}

// class App extends StatelessWidget {
//   const App({
//     Key key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {

//   }
// }
