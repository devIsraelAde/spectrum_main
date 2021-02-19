import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/screen/note/add_note_screen.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/widgets/notebook_card.dart';

class NotebookTabBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SingleChildScrollView(
        child: Provider.of<DatabaseHelper>(context).getnote() != null
            ? Consumer<DatabaseHelper>(
                builder: (context, db, _) => ListView.separated(
                  shrinkWrap: true,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return InkWell(
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              db.addnote(
                                note: Note(
                                  title: db.getnote()[index].title,
                                  notes: db.getnote()[index].notes,
                                  date: db.getnote()[index].date,
                                  bookmark: true,
                                ),
                              );
                              return AlertDialog(
                                title: Center(
                                  child: CircleAvatar(
                                    child: Icon(Icons.done),
                                    backgroundColor: Constants.primaryColor,
                                  ),
                                ),
                                content: Text('🎉🎁 \n\n Note has been bookmarked'),
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
                                  title: db.getnote()[index].title,
                                  date: db.getnote()[index].date,
                                  notes: db.getnote()[index].notes,
                                  bookmark: db.getnote()[index].bookmark,
                                ),
                              );
                            },
                          ),
                        );
                      },
                      child: NotebookCard(
                        title: db.getnote()[index].title,
                        time: db.getnote()[index].date,
                        onPressed: () async {
                          await db.deletenote(dateTime: db.getnote()[index].date);
                        },
                      ),
                    );
                  },
                  itemCount: db.getnote().length,
                  separatorBuilder: (BuildContext context, int index) => Divider(),
                ),
              )
            : Center(
                child: Text('No note'),
              ),
      ),
    );
  }
}
