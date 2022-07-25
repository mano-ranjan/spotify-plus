// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_songs_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LikedSongsAdapter extends TypeAdapter<LikedSongs> {
  @override
  final int typeId = 0;

  @override
  LikedSongs read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedSongs()
      ..songName = fields[0] as String
      ..songNetworkUrl = fields[1] as String
      ..songAlbumCoverPicUrl = fields[2] as String;
  }

  @override
  void write(BinaryWriter writer, LikedSongs obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.songName)
      ..writeByte(1)
      ..write(obj.songNetworkUrl)
      ..writeByte(2)
      ..write(obj.songAlbumCoverPicUrl);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedSongsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
