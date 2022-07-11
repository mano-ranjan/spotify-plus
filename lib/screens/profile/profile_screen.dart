import 'package:flutter/material.dart';

import 'package:spotify_app/utils/constants/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const BackButton(
                color: Colors.transparent,
              ),
              Icon(
                Icons.more_horiz,
                color: SpotifyPlusColors().pureWhite,
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: SpotifyPlusColors().greyShade900,
              borderRadius: BorderRadius.circular(86),
            ),
            child: const Icon(
              Icons.person_outline_sharp,
              color: Colors.grey,
              size: 100,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'manoranjan kumar',
            style: TextStyle(
              color: SpotifyPlusColors().pureWhite,
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            height: 40,
            width: 120,
            decoration: BoxDecoration(
              border: Border.all(
                color: SpotifyPlusColors().pureWhite,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: Center(
              child: Text(
                'Edit profile',
                style: TextStyle(
                  color: SpotifyPlusColors().pureWhite,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 80,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      color: SpotifyPlusColors().pureWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'FOLLOWERS',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    '0',
                    style: TextStyle(
                      color: SpotifyPlusColors().pureWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'FOLLOWING',
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Playlists',
              style: TextStyle(
                color: SpotifyPlusColors().pureWhite,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'playlist_name',
                        style: TextStyle(
                          color: SpotifyPlusColors().pureWhite,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      const Text(
                        '0 likes',
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_sharp,
                color: SpotifyPlusColors().pureWhite,
              )
            ],
          )
        ],
      ),
    );
  }
}
