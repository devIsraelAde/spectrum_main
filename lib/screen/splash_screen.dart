// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:spectrum_library/screens/carousel_slider.dart';
// import 'package:spectrum_library/utils/constants.dart';

// class MySplashScreen extends StatefulWidget {
//   @override
//   _MySplashScreenState createState() => _MySplashScreenState();
// }

// class _MySplashScreenState extends State<MySplashScreen> {
//   @override
//   void initState() {
//     /*new Future.delayed(
//         const Duration(seconds: 5),
//         () =>
//             Navigator.pushReplacementNamed(context, CarouselScreen.routeName));*/
//     new Future.delayed(
//         const Duration(seconds: 5),
//             () =>
//             Navigator.pushReplacement(context,
//                 MaterialPageRoute(builder: (context) => CarouselSlider())));
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           color: Constants.gradientColor,
//           image: DecorationImage(
//             image: AssetImage('assets/images/bg-img.png'),
//           ),
//         ),
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         child: Padding(
//           padding: const EdgeInsets.all(20.0),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 CircleAvatar(
//                   backgroundColor: Constants.gradientColor,
//                   radius: 30.0,
//                   backgroundImage: AssetImage('assets/images/logo.png'),
//                 ),
//                 SizedBox(height: 5.0),
//                 Text(
//                   'SPECTRUM INTERACTIVE\nBOOK LIBRARY',
//                   textAlign: TextAlign.center,
//                   style: TextStyle(
//                     fontSize: 18.0,
//                     color: Colors.white70,
//                   ),
//                 ),
//                 SizedBox(height: 5.0),
//                 Text(
//                   'Read More! Learn More!',
//                   style: TextStyle(
//                     color: Colors.white70,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
