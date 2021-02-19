// import 'dart:io';
// import 'package:epub_view/epub_view.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_tts/flutter_tts.dart';

// class EpubUI extends StatefulWidget {
//   final String path;

//   const EpubUI({Key key, this.path}) : super(key: key);

//   @override
//   _EpubUIState createState() => _EpubUIState();
// }

// enum TtsState { playing, stopped, paused, continued }

// class _EpubUIState extends State<EpubUI> {
//   FlutterTts flutterTts;
//   dynamic languages;
//   String language;
//   double volume = 0.5;
//   double pitch = 1.0;
//   double rate = 0.5;

//   String _newVoiceText;

//   TtsState ttsState = TtsState.stopped;

//   get isPlaying => ttsState == TtsState.playing;

//   get isStopped => ttsState == TtsState.stopped;

//   get isPaused => ttsState == TtsState.paused;

//   get isContinued => ttsState == TtsState.continued;

//   // List<dynamic> languages = await flutterTts.getLanguages;

//   EpubController _epubController;

//   initTts() {
//     flutterTts = FlutterTts();

//     _getLanguages();

//     if (Platform.isAndroid) {
//       _getEngines();
//     }

//     flutterTts.setStartHandler(() {
//       setState(() {
//         print("Playing");
//         ttsState = TtsState.playing;
//       });
//     });

//     flutterTts.setCompletionHandler(() {
//       setState(() {
//         print("Complete");
//         ttsState = TtsState.stopped;
//       });
//     });

//     flutterTts.setCancelHandler(() {
//       setState(() {
//         print("Cancel");
//         ttsState = TtsState.stopped;
//       });
//     });

//     flutterTts.setErrorHandler((msg) {
//       setState(() {
//         print("error: $msg");
//         ttsState = TtsState.stopped;
//       });
//     });
//   }

//   Future _getLanguages() async {
//     languages = await flutterTts.getLanguages;
//     if (languages != null) setState(() => languages);
//   }

//   Future _getEngines() async {
//     var engines = await flutterTts.getEngines;
//     if (engines != null) {
//       for (dynamic engine in engines) {
//         print(engine);
//       }
//     }
//   }

//   Future _speak() async {
//     await flutterTts.setVolume(volume);
//     await flutterTts.setSpeechRate(rate);
//     await flutterTts.setPitch(pitch);
//     await flutterTts.setLanguage("en-US");

//     _newVoiceText = await _epubController.document
//         .then((value) => value.Content.Html.values.map((e) => e.Content))
//         .then((value) => value.join());

//     if (_newVoiceText != null) {
//       if (_newVoiceText.isNotEmpty) {
//         var result = await flutterTts.speak(_newVoiceText);
//         if (result == 1) setState(() => ttsState = TtsState.playing);
//       }
//     }
//   }

//   Future _stop() async {
//     var result = await flutterTts.stop();
//     if (result == 1) setState(() => ttsState = TtsState.stopped);
//   }

//   // Future _pause() async {
//   //   var result = await flutterTts.pause();
//   //   if (result == 1) setState(() => ttsState = TtsState.paused);
//   // }

//   @override
//   void initState() {
//     File file = File(widget.path);
//     _epubController = EpubController(data: file.readAsBytes());
//     super.initState();
//     // initTts();
//     // print(File(widget.path).readAsBytesSync());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: EpubActualChapter(
//           controller: _epubController,
//           builder: (chaptervalue) => Text(
//             chaptervalue.chapter.Title ?? '',
//             textAlign: TextAlign.center,
//           ),
//         ),
//         centerTitle: true,
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.play_circle_outline),
//               onPressed: () {
//                 _speak();
//               }),
//           IconButton(
//               icon: Icon(Icons.pause_circle_outline),
//               onPressed: () {
//                 _stop();
//               })
//         ],
//       ),
//       drawer: Drawer(
//         child: EpubReaderTableOfContents(controller: _epubController),
//       ),
//       body: EpubView(
//         controller: _epubController,
//       ),
//     );
//   }
// }
