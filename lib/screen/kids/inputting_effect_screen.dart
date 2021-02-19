import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:spectrum_library/model/puzzle.dart';

class InputtingEffectUI extends StatefulWidget {
  final int id;
  final KidGames data;
  InputtingEffectUI({this.id, this.data});

  @override
  _InputtingEffectUIState createState() => _InputtingEffectUIState();
}

class _InputtingEffectUIState extends State<InputtingEffectUI> {
  @override
  Widget build(BuildContext context) {
    return Material(
        child: widget.id == 0
            ? ListView.builder(
                itemCount: widget.data.data.question.length,
                itemBuilder: (context, index) {
                  return ListView.builder(
                      itemCount: widget.data.data.question.elementAt(index).box_count,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return DragTarget<int>(
                          onAccept: (data) {
                            // print(data.name);
                            // if (data.image == answer.image) {
                            //   return true;
                            // }
                          },
                          // onAcceptWithDetails: (details) {
                          //   print(details.data.name);
                          // },
                          onWillAccept: (data) {
                            // print(data.name);
                            // if (data.image == answer.image) {
                            //   setState(() {
                            //     score[answer.name] = true;
                            //   });
                            //   return true;
                            // } else {
                            //   return false;
                            // }
                          },
                          builder: (BuildContext context, List<int> candidateData, rejectedData) => Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text('$index'),
                              ),
                              index == widget.data.data.question.elementAt(index).box_count
                                  ? index == widget.data.data.question.elementAt(index).box_count
                                      ? Row(
                                          children: [
                                            Icon(Icons.equalizer),
                                            Text(widget.data.data.question.elementAt(index).answer.toString())
                                          ],
                                        )
                                      : Icon(Icons.add)
                                  : Icon(Icons.add)
                            ],
                          ),
                        ); //todo: box
                      });
                })
            : PageView.builder(
                itemCount: widget.data.data.question.length,
                itemBuilder: (context, index) {
                  return ListView.builder(
                      itemCount: widget.data.data.question.elementAt(index).box_count,
                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return DragTarget<int>(
                          onAccept: (data) {
                            // print(data);
                            // if (data.image == answer.image) {
                            //   return true;
                            // }
                          },
                          // onAcceptWithDetails: (details) {
                          //   print(details.data.name);
                          // },
                          onWillAccept: (data) {
                            // print(data.name);
                            // if (data.image == answer.image) {
                            //   setState(() {
                            //     score[answer.name] = true;
                            //   });
                            //   return true;
                            // } else {
                            //   return false;
                            // }
                          },
                          builder: (BuildContext context, List<int> candidateData, rejectedData) => Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text('$index'),
                              ),
                              index == widget.data.data.question.elementAt(index).box_count
                                  ? Column(
                                      children: [
                                        Divider(),
                                        Text(widget.data.data.question.elementAt(index).answer.toString())
                                      ],
                                    )
                                  : Icon(Icons.add)
                            ],
                          ),
                        ); //todo: box
                      });
                }));
  }
}
