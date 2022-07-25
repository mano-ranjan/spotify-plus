import 'package:hive/hive.dart';
part 'liked_songs_hive.g.dart';

@HiveType(typeId: 0)
class LikedSongs extends HiveObject {
  // late Map savedSongs;
  @HiveField(0)
  late String songName;

  @HiveField(1)
  late String songNetworkUrl;

  @HiveField(2)
  late String songAlbumCoverPicUrl;
}
