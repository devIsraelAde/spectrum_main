import 'dart:convert';

import 'package:hive/hive.dart';

part 'device.g.dart';

Device deviceFromJson(String str) => Device.fromJson(json.decode(str));

String deviceToJson(Device data) => json.encode(data.toJson());

@HiveType(typeId: 7)
class Device {
  Device({
    this.message,
    this.data,
    this.status,
  });

  @HiveField(0)
  final String message;
  @HiveField(1)
  final Data data;
  @HiveField(2)
  final int status;

  factory Device.fromJson(Map<String, dynamic> json) => Device(
        message: json["message"] == null ? null : json["message"],
        data: json["data"] == null ? null : Data.fromJson(json["data"]),
        status: json["status"] == null ? null : json["status"],
      );

  Map<String, dynamic> toJson() => {
        "message": message == null ? null : message,
        "data": data == null ? null : data.toJson(),
        "status": status == null ? null : status,
      };
}

@HiveType(typeId: 8)
class Data {
  Data({
    this.token,
    this.expires,
    this.userId,
  });

  @HiveField(0)
  final String token;
  @HiveField(1)
  final dynamic expires;
  @HiveField(2)
  final String userId;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        token: json["token"] == null ? null : json["token"],
        expires: json["expires_in"] == null ? null : json["expires_in"],
        userId: json["user_id"] == null ? null : json["user_id"],
      );

  Map<String, dynamic> toJson() => {
        "token": token == null ? null : token,
        "expires_in": expires == null ? null : expires,
        "user_id": userId == null ? null : userId,
      };
}
