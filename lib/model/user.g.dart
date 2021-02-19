// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserAdapter extends TypeAdapter<User> {
  @override
  final int typeId = 13;

  @override
  User read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return User(
      id: fields[1] as int,
      uuid: fields[2] as String,
      first_name: fields[3] as String,
      last_name: fields[4] as String,
      phone: fields[5] as String,
      email: fields[6] as dynamic,
      imei: fields[7] as String,
      login_attempt: fields[8] as int,
      access_code: fields[9] as String,
      created_at: fields[10] as DateTime,
      updated_at: fields[11] as DateTime,
      uuiactivation_dated: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, User obj) {
    writer
      ..writeByte(12)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.uuid)
      ..writeByte(3)
      ..write(obj.first_name)
      ..writeByte(4)
      ..write(obj.last_name)
      ..writeByte(5)
      ..write(obj.phone)
      ..writeByte(6)
      ..write(obj.email)
      ..writeByte(7)
      ..write(obj.imei)
      ..writeByte(8)
      ..write(obj.login_attempt)
      ..writeByte(9)
      ..write(obj.access_code)
      ..writeByte(10)
      ..write(obj.created_at)
      ..writeByte(11)
      ..write(obj.updated_at)
      ..writeByte(12)
      ..write(obj.uuiactivation_dated);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as int,
    uuid: json['uuid'] as String,
    first_name: json['first_name'] as String,
    last_name: json['last_name'] as String,
    phone: json['phone'] as String,
    email: json['email'],
    imei: json['imei'] as String,
    login_attempt: json['login_attempt'] as int,
    access_code: json['access_code'] as String,
    created_at: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updated_at: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    uuiactivation_dated: json['uuiactivation_dated'] == null
        ? null
        : DateTime.parse(json['uuiactivation_dated'] as String),
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'uuid': instance.uuid,
      'first_name': instance.first_name,
      'last_name': instance.last_name,
      'phone': instance.phone,
      'email': instance.email,
      'imei': instance.imei,
      'login_attempt': instance.login_attempt,
      'access_code': instance.access_code,
      'created_at': instance.created_at?.toIso8601String(),
      'updated_at': instance.updated_at?.toIso8601String(),
      'uuiactivation_dated': instance.uuiactivation_dated?.toIso8601String(),
    };
