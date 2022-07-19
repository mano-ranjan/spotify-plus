import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:spotify_app/providers/login_provider/mobile_otp_login.dart';
import 'package:spotify_app/services/sign_out_current_user.dart';
import 'package:spotify_app/routes/routes.dart' as route;

import 'package:spotify_app/utils/constants/colors.dart';
import 'package:spotify_app/utils/constants/strings.dart';

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
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          child: Container(
                            height: 400,
                            width: 400,
                            decoration: BoxDecoration(
                              color: SpotifyPlusColors().pureGrey,
                              borderRadius: BorderRadius.circular(16),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  SignOutCurrentUser().signOutCurrentUser();
                                  if (!Provider.of<MobileOtpLoginData>(context,
                                          listen: false)
                                      .loggedIn) {
                                    Navigator.of(context)
                                        .pushNamedAndRemoveUntil(
                                            route.loginScreen,
                                            (route) => false);
                                  }
                                },
                                child: Container(
                                  height: 50,
                                  width: 150,
                                  decoration: BoxDecoration(
                                    color: SpotifyPlusColors().pureGreen,
                                    borderRadius: BorderRadius.circular(36),
                                  ),
                                  child: Center(
                                    child: Text(
                                      SpotifyPlusStrings().profileSignOutText,
                                      style: TextStyle(
                                        fontSize: 24,
                                        color: SpotifyPlusColors().pureWhite,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      });
                },
                child: Icon(
                  Icons.more_horiz,
                  color: SpotifyPlusColors().pureWhite,
                ),
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
            SpotifyPlusStrings().defaultProfileName,
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
            onTap: () {},
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
                  SpotifyPlusStrings().profileEditProfileText,
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
                    SpotifyPlusStrings().profileFollowersNum,
                    style: TextStyle(
                      color: SpotifyPlusColors().pureWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    SpotifyPlusStrings().profileFollowerText,
                    style: TextStyle(
                      color: SpotifyPlusColors().pureGrey,
                    ),
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    SpotifyPlusStrings().profileFollowingsNum,
                    style: TextStyle(
                      color: SpotifyPlusColors().pureWhite,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    SpotifyPlusStrings().profileFollowingText,
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
              SpotifyPlusStrings().profilePlaylistText,
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
                        SpotifyPlusStrings().profilePlaylistHeaderText,
                        style: TextStyle(
                          color: SpotifyPlusColors().pureWhite,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        SpotifyPlusStrings().profileLikesText,
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
