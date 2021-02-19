// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@HiveType(typeId: 13)
@JsonSerializable(nullable: true)
class User {
  User({
    this.id,
    this.uuid,
    this.first_name,
    this.last_name,
    this.phone,
    this.email,
    this.imei,
    this.login_attempt,
    this.access_code,
    this.created_at,
    this.updated_at,
    this.uuiactivation_dated,
  });

  @HiveField(1)
  final int id;
  @HiveField(2)
  final String uuid;
  @HiveField(3)
  final String first_name;
  @HiveField(4)
  final String last_name;
  @HiveField(5)
  final String phone;
  @HiveField(6)
  final dynamic email;
  @HiveField(7)
  final String imei;
  @HiveField(8)
  final int login_attempt;
  @HiveField(9)
  final String access_code;
  @HiveField(10)
  final DateTime created_at;
  @HiveField(11)
  final DateTime updated_at;
  @HiveField(12)
  final DateTime uuiactivation_dated;

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}
