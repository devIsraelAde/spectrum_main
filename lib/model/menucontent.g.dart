// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'menucontent.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MenuContent _$MenuContentFromJson(Map<String, dynamic> json) {
  return MenuContent(
    characters: (json['characters'] as List)?.map((e) => e as String)?.toList(),
    selectedmenu: json['selectedmenu'] as int,
  );
}

Map<String, dynamic> _$MenuContentToJson(MenuContent instance) =>
    <String, dynamic>{
      'selectedmenu': instance.selectedmenu,
      'characters': instance.characters,
    };
