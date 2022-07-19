import 'package:flutter/material.dart';

class SpotifyPlusStrings {
  // Add your strings here

  // default strings
  String defaultName = 'mano';
  String defaultHeaderName = 'Hello Mano!';
  String defaultProfileName = 'manoranjan kumar';
  String defaultArtistName = 'artist';
  String defaultArtistLogoName = 'M';
  String defaultPlaylistName = 'Playlist Name';
  String defaultPlaylistSubName = 'Playlist . Spotify';

  // dashboard strings
  String dashboardSubHeaderText = "Let's listen to some music";
  String dashboardFavArtistString = 'Your favorite artist';

  // library strings
  String libraryHeaderText = 'Your Library';
  String librarySortingHeaderText = 'Most recent';
  String submitText = 'Submit';

  // login strings
  String loginHeaderText = 'Spotify App';
  String loginSignupText = 'Login / Sign Up';

  // notification strings
  String notificationHeaderText = "What's New";
  String notificationHeaderSubText =
      'The latest releases from artists, podcasts, and shows you follow';
  String notificationSubText = 'New';
  String notificationTimeStampText = '14 hr ago';
  String notificationTrackNameText = 'Blinding Lights';
  String notificationArtistNameText = 'Weeknd';
  String notificationAlbumTypeText = 'Single';

  // profile strings
  String profileSignOutText = 'Sign out';
  String profileEditProfileText = 'Edit profile';
  String profileFollowersNum = '0';
  String profileFollowerText = 'FOLLOWERS';
  String profileFollowingsNum = '0';
  String profileFollowingText = 'FOLLOWING';
  String profilePlaylistText = 'Playlists';
  String profilePlaylistHeaderText = 'playlist_name';
  String profileLikesText = '0 likes';

  // search strings
  String searchGoBackText = 'go back';
  String searchSearchText = 'Search';
  String searchBarHintText = 'Artists, songs, or podcasts';
  String searchTopGenreText = 'Your top genres';
}

class SpotifyPlusImage {
  // Add your Image strings here
  String defaultArtistImageString = 'assets/images/pngs/artist_logo.jpeg';
  Image defaultArtistImage = Image.asset(
    'assets/images/pngs/artist_logo.jpeg',
    fit: BoxFit.cover,
  );
}
