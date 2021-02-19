import 'package:flutter/material.dart';
import 'package:spectrum_library/database/database.dart';
import 'package:spectrum_library/model/model.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatefulWidget {
  final Note note;
  AddNoteScreen({this.note});
  @override
  _AddNoteScreenState createState() => _AddNoteScreenState();
}

class _AddNoteScreenState extends State<AddNoteScreen> {
  TextEditingController _noteController;
  TextEditingController _notetitleController;
  @override
  void initState() {
    super.initState();
    _noteController = TextEditingController(text: widget.note.notes ?? '');
    _notetitleController = TextEditingController(text: widget.note.title ?? '');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Constants.primaryColor,
        title: Text('Add Notes'),
        centerTitle: true,
        elevation: 0,
        leading: IconButton(
            icon: Icon(Icons.clear),
            onPressed: () async {
              if (_noteController.text != null || _notetitleController != null) {
                _noteController.clear();
                _notetitleController.clear();
                Navigator.pop(context);
              } else {
                Navigator.pop(context);
              }
            }),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.done),
              onPressed: () async {
                if (_notetitleController.text.isNotEmpty) {
                  if (widget.note.bookmark) {
                    await context.read<DatabaseHelper>().addnote(
                        note: Note(
                            notes: _noteController.text,
                            title: _notetitleController.text,
                            date: widget.note.date,
                            bookmark: widget.note.bookmark));
                    Navigator.pop(context);
                  } else {
                    // await context.watch<DatabaseHelper>().deletenote(index: widget.position);
                    await context
                        .read<DatabaseHelper>()
                        .addnote(
                            note: Note(
                                notes: _noteController.text,
                                title: _notetitleController.text,
                                date: widget.note.date != null ? widget.note.date : DateTime.now(),
                                bookmark: false))
                        .then((_) => Navigator.pop(context));
                  }
                } else {
                  await showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        // title: Icon(
                        //   Icons.error_outline,
                        //   color: Colors.red,
                        //   size: 30,
                        // ),
                        content: Text(
                          '😒😒😒 \n\n Your Title is Empty',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
                    },
                  );
                }
              })
        ],
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Expanded(
              flex: 0,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _notetitleController,
                  maxLines: 1,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Title',
                      hintStyle: TextStyle(fontWeight: FontWeight.w600, fontSize: 20)),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: _noteController,
                  maxLines: MediaQuery.of(context).size.height.toInt(),
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Express your feelings',
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
