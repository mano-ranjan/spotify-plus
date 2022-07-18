import 'package:audioplayers/audioplayers.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SongsData with ChangeNotifier {
  String songUrl = '';
  String coverPicUrl = '';
  String songName = '';

  Future<void> getFirebaseSongUrl() async {
    var instance = FirebaseFirestore.instance;
    CollectionReference urls = instance.collection('artist');
    DocumentSnapshot snapshot = await urls
        .doc('KcHTxqHAaKmNpRjfUq6o')
        .collection('songs')
        .doc('2WxDje85TfnjMk5H7c1E')
        .get();
    var data = snapshot.data() as Map;
    coverPicUrl = data['songAlbumCoverPicUrl'];
    songName = data['songName'];
    songUrl = data['songNetworkUrl'];
    print(data['songName']);
    notifyListeners();
  }
}

class MediaPlayerData with ChangeNotifier {
  PlayerState playingState = PlayerState.stopped;
  bool isSongLoading = false;
  AudioPlayer audioPlayer = AudioPlayer();

  void updatePlayingState(PlayerState incomingPlayerState) {
    print(incomingPlayerState);
    playingState = incomingPlayerState;
    notifyListeners();
  }

  void updateIsSongLoading(bool incomingIsSongLoading) {
    print('the issongloading state is : $incomingIsSongLoading');
    isSongLoading = incomingIsSongLoading;
    notifyListeners();
  }

  // void updateAudioPlayerAction (AudioPlayer )
}
