import 'dart:math';

import 'package:flutter/material.dart';
import 'package:spectrum_library/model/puzzle.dart';

class MockServices {
  Future<KidGames> getkidsmockgames({int number}) async {
    final kidgames = <KidGames>[
      KidGames.fromJson(
        {
          "uuid": "grid_2_drag_drop",
          "data": {
            "introduction": [
              {"name": "url", "image": ""},
              {"name": "url", "image": ""}
            ],
            "examples": [
              {"name": "url", "image": ""}
            ],
            "question": [
              {"name": '🍏', "image": '0xFF2E7D32'},
              {"name": '🍋', "image": '0xFFFDD835'},
              {"name": '🍅', "image": '0xFFE53935'},
              {"name": '🍇', "image": '0xFF8E24AA'},
              {"name": '🥥', "image": '0xFF6D4C41'},
              {"name": '🥕', "image": '0xFFFB8C00'}
            ]
          },
        },
      ),
      KidGames.fromJson(
        {
          "uuid": "trace_and_paint_image",
          "data": {
            "introduction": [
              {"name": "url", "image": ""},
              {"name": "url", "image": ""}
            ],
            "examples": [
              {"name": "url", "image": ""}
            ],
            "question": [
              {"name": '🍏', "image": '0xFF2E7D32'},
              {"name": '🍋', "image": '0xFFFDD835'},
              {"name": '🍅', "image": '0xFFE53935'},
              {"name": '🍇', "image": '0xFF8E24AA'},
              {"name": '🥥', "image": '0xFF6D4C41'},
              {"name": '🥕', "image": '0xFFFB8C00'}
            ]
          },
        },
      ),
      KidGames.fromJson(
        {
          "uuid": "drag_to_box_horizontal",
          "data": {
            "introduction": [
              {"name": "url", "image": ""},
              {"name": "url", "image": ""}
            ],
            "examples": [
              {"name": "url", "image": ""}
            ],
            "question": [
              {"box_no": 4, "answer": '4'},
              {"box_no": 2, "answer": '4'},
              {"box_no": 3, "answer": '4'},
            ]
          },
        },
      ),
      KidGames.fromJson(
        {
          "uuid": "drag_to_box_vertical",
          "data": {
            "introduction": [
              {"name": "url", "image": ""},
              {"name": "url", "image": ""}
            ],
            "examples": [
              {"name": "url", "image": ""}
            ],
            "question": [
              {"box_no": 4, "answer": '4'},
              {"box_no": 2, "answer": '4'},
              {"box_no": 3, "answer": '4'},
            ]
          },
        },
      ),
    ];

    return await Future.value(kidgames.elementAt(number));
  }
}
