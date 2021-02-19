import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';
import 'package:spectrum_library/model/puzzle.dart';
import 'package:spectrum_library/services/services.dart';
import 'package:spectrum_library/model/model.dart';
import 'dart:async';
import 'dart:convert';
import 'package:flutter/services.dart' show rootBundle;
part 'kidgame_provider.freezed.dart';

class KidGameProvider extends ChangeNotifier {
  KidGameProviderState _kidGameProviderState;

  KidGameProviderState get kidstate => _kidGameProviderState ?? KidGameProviderState.initial();
  void mockresponse({int number}) async {
    //todo:
    _kidGameProviderState =
        KidGameProviderState.loaded(kidGames: await MockServices().getkidsmockgames(number: number));
    notifyListeners();
  }

  MenuContent _characters;

  MenuContent get getcharacters => _characters;

  Future<void> setcharacters({int menuselection}) async {
    switch (menuselection) {
      case 0:
        _characters =
            MenuContent.fromJson({'characters': json.decode(await rootBundle.loadString('assets/alphabet.json'))});
        notifyListeners();
        break;
      case 1:
        _characters =
            MenuContent.fromJson({'characters': json.decode(await rootBundle.loadString('assets/number.json'))});
        notifyListeners();
        break;
      case 2:
        _characters = MenuContent.fromJson({'selectedmenu': 2});

        notifyListeners();
        break;
      case 3:
        _characters =
            MenuContent.fromJson({'characters': json.decode(await rootBundle.loadString('assets/symbol.json'))});
        notifyListeners();
        break;
      case 4:
        _characters = MenuContent.fromJson(json.decode(await rootBundle.loadString('assets/alphabet.json')));
        notifyListeners();
        break;
      default:
    }
  }
}

@freezed
abstract class KidGameProviderState with _$KidGameProviderState {
  const KidGameProviderState._();
  factory KidGameProviderState.initial() = _Initial;
  factory KidGameProviderState.loading() = _Loading;
  factory KidGameProviderState.loaded({KidGames kidGames}) = _Loaded;
  factory KidGameProviderState.error() = _Error;
}
