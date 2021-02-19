import 'package:json_annotation/json_annotation.dart';
part 'menucontent.g.dart';

@JsonSerializable(nullable: true)
class MenuContent {
  final int selectedmenu;
  final List<String> characters;

  const MenuContent({this.characters, this.selectedmenu});

  factory MenuContent.fromJson(Map<String, dynamic> json) => _$MenuContentFromJson(json);

  Map<String, dynamic> toJson() => _$MenuContentToJson(this);
}
