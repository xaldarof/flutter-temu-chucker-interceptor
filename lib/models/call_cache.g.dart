// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'call_cache.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CallCacheModelAdapter extends TypeAdapter<CallCacheModel> {
  @override
  final int typeId = 1;

  @override
  CallCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CallCacheModel(
      data: fields[0] as String?,
      path: fields[1] as String?,
      uri: fields[2] as String?,
      queryParameters: fields[3] as String?,
      method: fields[4] as String?,
      baseUrl: fields[5] as String?,
      connectTimeout: fields[6] as String?,
      contentType: fields[7] as String?,
      extra: fields[8] as String?,
      followRedirects: fields[9] as String?,
      listFormat: fields[10] as String?,
      receiveTimeout: fields[11] as String?,
      responseType: fields[12] as String?,
      headers: fields[13] as String?,
      validateStatus: fields[14] as String?,
      isCompleted: fields[15] as String?,
      date: fields[16] as String?,
      response: fields[17] as String?,
      statusCode: fields[18] as String?,
      eventMessage: fields[19] as String?,
      startDate: fields[20] as String?,
      endDate: fields[21] as String?,
      totalSent: fields[22] as String?,
      totalReceived: fields[23] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CallCacheModel obj) {
    writer
      ..writeByte(24)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.path)
      ..writeByte(2)
      ..write(obj.uri)
      ..writeByte(3)
      ..write(obj.queryParameters)
      ..writeByte(4)
      ..write(obj.method)
      ..writeByte(5)
      ..write(obj.baseUrl)
      ..writeByte(6)
      ..write(obj.connectTimeout)
      ..writeByte(7)
      ..write(obj.contentType)
      ..writeByte(8)
      ..write(obj.extra)
      ..writeByte(9)
      ..write(obj.followRedirects)
      ..writeByte(10)
      ..write(obj.listFormat)
      ..writeByte(11)
      ..write(obj.receiveTimeout)
      ..writeByte(12)
      ..write(obj.responseType)
      ..writeByte(13)
      ..write(obj.headers)
      ..writeByte(14)
      ..write(obj.validateStatus)
      ..writeByte(15)
      ..write(obj.isCompleted)
      ..writeByte(16)
      ..write(obj.date)
      ..writeByte(17)
      ..write(obj.response)
      ..writeByte(18)
      ..write(obj.statusCode)
      ..writeByte(19)
      ..write(obj.eventMessage)
      ..writeByte(20)
      ..write(obj.startDate)
      ..writeByte(21)
      ..write(obj.endDate)
      ..writeByte(22)
      ..write(obj.totalSent)
      ..writeByte(23)
      ..write(obj.totalReceived);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CallCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
