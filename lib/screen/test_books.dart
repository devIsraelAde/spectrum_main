// import 'dart:io';

// import 'package:epub_kitty/epub_kitty.dart';
// import 'package:flutter/material.dart';
// import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';
// import 'package:spectrum_library/utils/constants.dart';

// class TestBooks extends StatefulWidget {
//   @override
//   _TestBooksState createState() => _TestBooksState();
// }

// class _TestBooksState extends State<TestBooks> {
//   List<Map<String, dynamic>> _list = [
//     {
//       'image_url': 'assets/images/cover0.jpg',
//       'title': 'Basic History 2',
//       'book_url': 'Basic History 2',
//     },
//     {
//       'image_url': 'assets/images/cover0.jpg',
//       'title': 'Basic History JSS 1',
//       'book_url': 'Basic History JSS 1',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'Basic History JSS3',
//       'book_url': 'Basic History JSS3',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'Basic Science JSS1',
//       'book_url': 'Basic Science JSS1',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'BASIC SCIENCE JSS2',
//       'book_url': 'BASIC SCIENCE JSS2',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'Basic Tech Jss 1',
//       'book_url': 'Basic Tech Jss 1',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'Basic Tech JSS 2',
//       'book_url': 'Basic Tech JSS 2',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'Social Books',
//       'book_url': 'SocialBooks',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'Social Studies for JSS1',
//       'book_url': 'Social Studies for JSS1',
//     },
//     {
//       'image_url': 'assets/images/challenge1.png',
//       'title': 'Social Studies for JSS2',
//       'book_url': 'Social Studies for JSS2',
//     },
//   ];
//   String filePath;

//   _createPath() async {
//     PermissionStatus permission = await PermissionHandler().checkPermissionStatus(PermissionGroup.storage);

//     if (permission != PermissionStatus.granted) {
//       await PermissionHandler().requestPermissions([PermissionGroup.storage]);
//     }
//     Directory appDocDir =
//         Platform.isAndroid ? await getExternalStorageDirectory() : await getApplicationSupportDirectory();
//     if (Platform.isAndroid) {
//       Directory(appDocDir.path.split("Android")[0] + "${Constants.appName}").createSync();
//     }

//     filePath = Platform.isIOS ? appDocDir.path : appDocDir.path.split("Android")[0] + "${Constants.appName}";
//     print('STORAGE PATH = $filePath');
//     File file = File(filePath);
//   }

//   @override
//   void initState() {
//     _createPath();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final width = MediaQuery.of(context).size.width;

//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Constants.primaryColor,
//         title: Text('Test Books'),
//       ),
//       body: ListView.builder(
//           itemCount: _list.length,
//           itemBuilder: (context, index) {
//             return GestureDetector(
//               onTap: () {
//                 String path = '$filePath/${_list[index]['book_url']}.epub';
//                 EpubKitty.setConfig("androidBook", "#06d6a7", "vertical", true);
//                 EpubKitty.open(path);
//               },
//               child: Card(
//                 child: Row(
//                   children: <Widget>[
//                     ClipRRect(
//                       borderRadius: BorderRadius.circular(20.0),
//                       child: Container(
//                         padding: EdgeInsets.symmetric(vertical: 10.0),
//                         width: width * .30,
//                         child: Image(
//                           image: AssetImage(_list[index]['image_url']),
//                           width: 100.0,
//                           height: 100.0,
//                         ),
//                       ),
//                     ),
//                     SizedBox(width: 5.0),
//                     Container(
//                       width: width * .60,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: <Widget>[
//                           Text(
//                             _list[index]['title'],
//                             style: TextStyle(fontWeight: FontWeight.bold),
//                           ),
//                           SizedBox(height: 10.0),
//                           Text(
//                             _list[index]['book_url'],
//                             maxLines: 3,
//                             style: TextStyle(fontSize: 13.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }),
//     );
//   }
// }
