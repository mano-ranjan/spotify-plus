import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/screens/login_screens/login_screen.dart';
import 'package:spotify_app/services/sign_out_current_user.dart';
import 'package:spotify_app/routes/routes.dart' as route;

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
              BackButton(
                color: SpotifyPlusColors().transparent,
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
            child: Icon(
              Icons.person_outline_sharp,
              color: SpotifyPlusColors().pureGrey,
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
          InkWell(
            onTap: () {
              SignOutCurrentUser().signOutCurrentUser();
              if (!Provider.of<MobileOtpLoginData>(context, listen: false)
                  .loggedIn) {
                Navigator.of(context).pushNamedAndRemoveUntil(
                    route.loginScreen, (route) => false);
              }
            },
            child: Container(
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
                  Text(
                    'FOLLOWERS',
                    style: TextStyle(
                      color: SpotifyPlusColors().pureGrey,
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
                  Text(
                    'FOLLOWING',
                    style: TextStyle(
                      color: SpotifyPlusColors().pureGrey,
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
                    color: SpotifyPlusColors().pureAmber,
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
                      Text(
                        '0 likes',
                        style: TextStyle(
                          color: SpotifyPlusColors().pureGrey,
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
