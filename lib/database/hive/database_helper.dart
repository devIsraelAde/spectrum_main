import 'dart:io';

import 'package:android_alarm_manager/android_alarm_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DatabaseHelper {
  GameBookDao gameBookDao;

  DatabaseHelper({this.gameBookDao});

  Future<void> addnote({Note note}) async {
    final notesHive = Hive.box<Note>('note');
    if (note.bookmark) {
      // await notesHive.delete(note.date.toString());
      await notesHive.put(note.date.toString(), note);
    } else {
      print(notesHive.get(note.date.toString()));
      if (notesHive.get(note.date.toString()) != null) {
        // if (note.date == (notesHive.get(note.date.toString())).date) {
        // await notesHive.delete(note.date.toString());
        await notesHive.put(note.date.toString(), note);
        // } else {
        //   await notesHive.put(note.date.toString(), note);
        // }
      } else {
        await notesHive.put(note.date.toString(), note);
      }
    }
  }

  List<Note> getnote() {
    return Hive.box<Note>('note').values.toList().reversed.toList() ?? [];
  }

  Future<void> deletenote({DateTime dateTime}) async {
    await Hive.box<Note>('note').delete(dateTime.toString());
  }

  Future<void> deleteAllnote({DateTime dateTime}) async {
    await Hive.box<Note>('note').deleteFromDisk();
    await Hive.openBox<Note>('note');
  }

  Future<void> adduser({User user}) async {
    await Hive.box<User>('user').put(0, user);
  }

  User getuser() {
    return Hive.box<User>('user').get(0);
  }

  Future<void> deleteuser() async {
    await Hive.box<User>('user').delete(0);
  }

//todo: device box
  Future<void> adddevice({Device device}) async {
    SharedPreferences locationStorage = await SharedPreferences.getInstance();

    if (locationStorage.getInt('device') == 0 || locationStorage.getInt('device') == null) {
      await Hive.box<Device>('device').put(0, device);
      locationStorage.setInt('device', 1);
      return;
    }
    await Hive.box<Device>('device').put(0, device);
    return;
    // return response;
  }

  Future<Device> getdeviceresponse() async {
    SharedPreferences locationStorage = await SharedPreferences.getInstance();
    if (locationStorage.getInt('device') == 0 || locationStorage.getInt('device') == null) {
      return Future.value(Hive.box<Device>('device').get(0));
    }
    return Future.value(Hive.box<Device>('device').get(0));
  }

  Future<void> deletedevice() async {
    await Hive.box<Device>('device').deleteFromDisk();
  }

  Future<void> deletebooks() async {
    await Hive.box<BookDetails>('books').deleteFromDisk();
  }

//todo: books response downloaded books

  Future<void> addbooks({dynamic books}) async {
    Books _books = Books.fromJson(books);
    gameBookDao.addBookGames(specialBooks: _books.data.special_books);
    final bookdetailsBox = Hive.box<BookDetails>('books');
    for (BookDetails book in _books.data.books) {
      await bookdetailsBox.put(book.book_id, book);
    }
    SharedPreferences locationStorage = await SharedPreferences.getInstance();
    locationStorage.setInt('status', 1);
  }

  Future<void> checkaccesscode() async {
    await deleteuser();
    await NavigationService().navigateTo('/registration');
  }

  Future<void> addbooksandgames({dynamic books}) async {
    Books _books = Books.fromJson(books);
    await Hive.box<Books>('booksandgames').put(0, _books);
    AndroidAlarmManager.oneShotAt(_books.data.access_code_expiry, 0, checkaccesscode, exact: true);
  }

  DateTime getaccesscodeexpiringdate() {
    return Hive.box<Books>('booksandgames').get(0).data.access_code_expiry;
  }

  Future<List<BookDetails>> getallbooks() async {
    return Future.value(Hive.box<BookDetails>('books').values.toList());
  }

  BookDetails getsinglebooks({int bookid}) {
    return Hive.box<BookDetails>('books').get(bookid);
  }

  BookDetails getsinglebooksfordownload({String downloadid}) {
    final books = Hive.box<BookDetails>('books');
    if (books.values?.where((download) => download.downloadedbookId == downloadid)?.isEmpty) {
      return null;
    } else {
      return books.values?.where((download) => download.downloadedbookId == downloadid)?.elementAt(0);
    }
  }

  Future<void> updatebook({BookDetails book}) async {
    await Hive.box<BookDetails>('books').put(book.book_id, book);
  }

//   static final _databaseName = "Database.db";
//   static final _databaseVersion = 1;

//   static final table = 'book';

//   static final id = '_id';
//   static final bookId = 'book_id';
//   static final bookTitle = 'book_title';
//   static final bookAuthor = 'book_author';
//   static final bookDescription = 'book_description';
//   static final downloadLink = 'download_link';
//   static final frontCover = 'front_cover';
//   static final bookPath = 'book_path';

//   // make this a singleton class
//   DatabaseHelper._privateConstructor();

//   static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

//   // only have a single app-wide reference to the database
//   static Database _database;

//   Future<Database> get database async {
//     if (_database != null) return _database;
//     // lazily instantiate the db the first time it is accessed
//     _database = await _initDatabase();
//     return _database;
//   }

//   // this opens the database (and creates it if it doesn't exist)
//   _initDatabase() async {
//     Directory documentsDirectory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirectory.path, _databaseName);
//     return await openDatabase(path,
//         version: _databaseVersion, onCreate: _onCreate);
//   }

//   // SQL code to create the database table
//   Future _onCreate(Database db, int version) async {
//     await db.execute('''
//           CREATE TABLE $table (
//             $id INTEGER PRIMARY KEY,
//             $bookId INTEGER NOT NULL,
//             $bookTitle TEXT NOT NULL,
//             $bookAuthor TEXT NOT NULL,
//             $bookDescription TEXT NOT NULL,
//             $downloadLink TEXT NOT NULL,
//             $frontCover TEXT NOT NULL,
//             $bookPath TEXT NOT NULL
//           )
//           ''');
//   }

//   // Helper methods

//   // Inserts a row in the database where each key in the Map is a column name
//   // and the value is the column value. The return value is the id of the
//   // inserted row.
//   Future<int> insert(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     var queryRow = await db
//         .rawQuery('SELECT * FROM $table WHERE $bookId==${row['book_id']}');
//     print('Query Row result = $queryRow');
//     if (queryRow.isEmpty) {
//       return await db.insert(table, row);
//     }
//     return 0;
//   }

//   // All of the rows are returned as a list of maps, where each map is
//   // a key-value list of columns.
//   Future<List<Map<String, dynamic>>> queryAllRows() async {
//     Database db = await instance.database;
//     var r = await db.query(table);
//     print('Number of Books in Database ${r.length}');
//     print('All Database Rows = $r');
//     return r;
// //    return await db.query(table);
//   }

//   // All of the methods (insert, query, update, delete) can also be done using
//   // raw SQL commands. This method uses a raw query to give the row count.
//   Future<int> queryRowCount() async {
//     Database db = await instance.database;
//     return Sqflite.firstIntValue(
//         await db.rawQuery('SELECT COUNT(*) FROM $table'));
//   }

//   Future check(var id) async {
//     Database db = await instance.database;
//     var check = await db.rawQuery('SELECT * FROM $table WHERE $bookId==$id');
//     print('Check result = $check');
//     return check;
//   }

//   // We are assuming here that the id column in the map is set. The other
//   // column values will be used to update the row.
//   Future<int> update(Map<String, dynamic> row) async {
//     Database db = await instance.database;
//     int id = row[bookId];
//     var u = await db.update(table, row, where: '$bookId = ?', whereArgs: [id]);
//     print('Update Result = $u');
//     return u;
//   }

//   // Deletes the row specified by the id. The number of affected rows is
//   // returned. This should be 1 as long as the row exists.
//   Future<int> delete(int id) async {
//     Database db = await instance.database;
//     return await db.delete(table, where: '$bookId = ?', whereArgs: [id]);
//   }
}
