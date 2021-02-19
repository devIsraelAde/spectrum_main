import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/screen/note/add_note_screen.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/bookmark_card.dart';
import 'package:spectrum_library/widgets/notebook_card.dart';

class Bookmark extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15.0),
      child: SingleChildScrollView(
        child: Consumer<DatabaseHelper>(
          builder: (context, db, _) => ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return InkWell(
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        db.addnote(
                          note: Note(
                            title: db.getnote().where((note) => note.bookmark == true).elementAt(index).title,
                            notes: db.getnote().where((note) => note.bookmark == true).elementAt(index).notes,
                            date: db.getnote().where((note) => note.bookmark == true).elementAt(index).date,
                            bookmark: false,
                          ),
                        );
                        return AlertDialog(
                          // title: Center(
                          //   child: CircleAvatar(
                          //     child: Icon(Icons.done),
                          //     backgroundColor: Constants.primaryColor,
                          //   ),
                          // ),
                          content: Text('🎉🎁\n\n Removed from Bookmark'),
                        );
                      });
                },
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return AddNoteScreen(
                          note: Note(
                            title: db.getnote().where((note) => note.bookmark == true).elementAt(index).title,
                            date: db.getnote().where((note) => note.bookmark == true).elementAt(index).date,
                            notes: db.getnote().where((note) => note.bookmark == true).elementAt(index).notes,
                            bookmark: db.getnote().where((note) => note.bookmark == true).elementAt(index).bookmark,
                          ),
                        );
                      },
                    ),
                  );
                },
                child: NotebookCard(
                  title: db.getnote().where((note) => note.bookmark == true).elementAt(index).title,
                  time: db.getnote().where((note) => note.bookmark == true).elementAt(index).date,
                  onPressed: () async {
                    await db.deletenote(dateTime: db.getnote()[index].date);
                  },
                ),
              );
            },
            itemCount: db.getnote().where((note) => note.bookmark == true).length,
            separatorBuilder: (BuildContext context, int index) => Divider(),
          ),
        ),
      ),
    );
  }
}
