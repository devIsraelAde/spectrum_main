import 'dart:convert';
import 'dart:math';
import 'package:spectrum_library/app/app.dart';
import 'package:flutter/material.dart';
import 'package:spectrum_library/model/puzzle.dart';

class MappingEffectUI extends StatefulWidget {
  final KidGames kidGames;
  const MappingEffectUI({Key key, this.kidGames}) : super(key: key);

  @override
  _MappingEffectUIState createState() => _MappingEffectUIState();
}

class _MappingEffectUIState extends State<MappingEffectUI> {
  final Map<String, bool> score = {};

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InteractiveViewer(
        child: ListView(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Expanded(
                //   child: Column(
                //     children: widget.kidGames.data.question.map((quest) {
                //       return Draggable<Question>(
                //         data: quest,
                //         childWhenDragging: Material(
                //           color: Colors.transparent,
                //           child: Text(
                //             '🌱',
                //             style: AppTextStyles.babystyle.copyWith(fontSize: 50),
                //           ),
                //         ),
                //         child: Material(
                //           color: Colors.transparent,
                //           child: Text(
                //             quest.name,
                //             style: AppTextStyles.babystyle.copyWith(fontSize: 50),
                //           ),
                //         ),
                //         feedback: Material(
                //           color: Colors.transparent,
                //           child: Text(
                //             quest.name,
                //             style: AppTextStyles.babystyle.copyWith(fontSize: 50),
                //           ),
                //         ),
                //       );
                //     }).toList()
                //       ..shuffle(
                //         Random(
                //           widget.kidGames.data.question.length,
                //         ),
                //       ),
                //   ),
                // ),

                // Expanded(
                //   child: Column(
                //     children: widget.kidGames.data.question.map((answer) {
                //       return DragTarget<Question>(
                //         onAccept: (data) {
                //           print(data.name);
                //           if (data.image == answer.image) {
                //             return true;
                //           }
                //         },
                //         // onAcceptWithDetails: (details) {
                //         //   print(details.data.name);
                //         // },
                //         onWillAccept: (data) {
                //           print(data.name);
                //           if (data.image == answer.image) {
                //             setState(() {
                //               score[answer.name] = true;
                //             });
                //             return true;
                //           } else {
                //             return false;
                //           }
                //         },
                //         builder: (BuildContext context, List<Question> candidateData, rejectedData) {
                //           if (score[answer.name] == true) {
                //             return Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Container(
                //                 child: Text(
                //                   score.keys.where((element) => element == answer.name).elementAt(0).toString(),
                //                   style: AppTextStyles.babystyle.copyWith(fontSize: 50),
                //                 ),
                //                 width: 50,
                //                 height: 50,
                //               ),
                //             );
                //           } else {
                //             // print(rejectedData);
                //             // print(candidateData);
                //             return Padding(
                //               padding: const EdgeInsets.all(8.0),
                //               child: Container(
                //                 color: Color(int.parse(answer.image)),
                //                 width: 50,
                //                 height: 50,
                //               ),
                //             );
                //           }
                //         },
                //       );
                //     }).toList()
                //       ..shuffle(Random(widget.kidGames.data.question.length)),
                //   ),
                // ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
