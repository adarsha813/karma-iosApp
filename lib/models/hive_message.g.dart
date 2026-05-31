// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_message.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveMessageAdapter extends TypeAdapter<HiveMessage> {
  @override
  final int typeId = 0;

  @override
  HiveMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveMessage(
      id: fields[0] as String,
      text: fields[1] as String,
      isMe: fields[2] as bool,
      createdAt: fields[3] as DateTime,
      adminId: fields[4] as String?,
      adminName: fields[5] as String?,
      adminImage: fields[6] as String?,
      answeredAt: fields[7] as DateTime?,
      clarificatedAt: fields[8] as DateTime?,
      isAdvice: fields[9] as bool,
      isClarification: fields[10] as bool,
      rating: fields[11] as int?,
      feedback: fields[12] as String?,
      clarificationId: fields[13] as String?,
      type: fields[14] as String?,
      title: fields[15] as String?,
      isSending: fields[16] as bool,
      hasFailed: fields[17] as bool,
      isTemporary: fields[18] as bool,
      questionId: fields[19] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, HiveMessage obj) {
    writer
      ..writeByte(20)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.isMe)
      ..writeByte(3)
      ..write(obj.createdAt)
      ..writeByte(4)
      ..write(obj.adminId)
      ..writeByte(5)
      ..write(obj.adminName)
      ..writeByte(6)
      ..write(obj.adminImage)
      ..writeByte(7)
      ..write(obj.answeredAt)
      ..writeByte(8)
      ..write(obj.clarificatedAt)
      ..writeByte(9)
      ..write(obj.isAdvice)
      ..writeByte(10)
      ..write(obj.isClarification)
      ..writeByte(11)
      ..write(obj.rating)
      ..writeByte(12)
      ..write(obj.feedback)
      ..writeByte(13)
      ..write(obj.clarificationId)
      ..writeByte(14)
      ..write(obj.type)
      ..writeByte(15)
      ..write(obj.title)
      ..writeByte(16)
      ..write(obj.isSending)
      ..writeByte(17)
      ..write(obj.hasFailed)
      ..writeByte(18)
      ..write(obj.isTemporary)
      ..writeByte(19)
      ..write(obj.questionId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
