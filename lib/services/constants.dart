import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:spectrum_library/model/model.dart';

class Constants {
  static Color primaryColor = Color(0xff0B4E4B);
  static Color gradientColor = Color(0xff054D44);
  static Color shadowColor = Color(0xff707070);

  static String appKey = 'a04725cc3d377b872b54c08a310f2969'; //'adacba0aabe1224fb770c3c6952de4ab';
  static String testappKey = '56f798cb9d04dbfe81220af881c966fa';
  static final kBoxShadow = BoxShadow(
    offset: Offset(0, 10),
    blurRadius: 20,
    color: Color(0xFF4056C6).withOpacity(.15),
  );

  static String appName = "Spectrum";

  static formatBytes(bytes, decimals) {
    if (bytes == 0) return 0.0;
    var k = 1024,
        dm = decimals <= 0 ? 0 : decimals,
        sizes = ['Bytes', 'KB', 'MB', 'GB', 'TB', 'PB', 'EB', 'ZB', 'YB'],
        i = (log(bytes) / log(k)).floor();
    return (((bytes / pow(k, i)).toStringAsFixed(dm)) + ' ' + sizes[i]);
  }

  static final String domainNameUrl =
      "https://api.ebookapi.spectrumbookslimited.com"; //"https://spectrumbooks.156credit.com";
  static final String testdomainNameUrl = "https://spectrumbooks.156credit.com";

  //5841-795625092622

  static Future<void> init() async {
    await Hive.initFlutter();

    Hive
      ..registerAdapter<BookDetails>(BookDetailsAdapter())
      ..registerAdapter<BookData>(BookDataAdapter())
      ..registerAdapter<Game>(GameAdapter())
      ..registerAdapter<Device>(DeviceAdapter())
      ..registerAdapter<Data>(DataAdapter())
      ..registerAdapter<Books>(BooksAdapter())
      ..registerAdapter<User>(UserAdapter())
      ..registerAdapter<Note>(NoteAdapter())
      ..registerAdapter<SpecialBooks>(SpecialBooksAdapter())
      ..registerAdapter<SpecialBooksData>(SpecialBooksDataAdapter())
      ..registerAdapter<KidGames>(KidGamesAdapter())
      ..registerAdapter<PuzzleData>(PuzzleDataAdapter())
      ..registerAdapter<Puzzle>(PuzzleAdapter());

    await Hive.openBox<Device>('device');
    await Hive.openBox<User>('user');
    await Hive.openBox<Note>('note');
    await Hive.openBox<Books>('booksandgames');
    await Hive.openBox<BookDetails>('books');
  }
}
