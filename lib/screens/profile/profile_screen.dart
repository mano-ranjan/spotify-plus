import 'package:flutter/material.dart';

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
            children: const [
              BackButton(
                color: Colors.transparent,
              ),
              Icon(
                Icons.more_horiz,
                color: Colors.white,
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
              color: Colors.grey[900],
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
          const Text(
            'manoranjan kumar',
            style: TextStyle(
              color: Colors.white,
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
                color: Colors.white,
              ),
              borderRadius: BorderRadius.circular(24),
            ),
            child: const Center(
              child: Text(
                'Edit profile',
                style: TextStyle(
                  color: Colors.white,
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
                children: const [
                  Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'FOLLOWERS',
                    style: TextStyle(
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
              Column(
                children: const [
                  Text(
                    '0',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'FOLLOWING',
                    style: TextStyle(
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
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Playlists',
              style: TextStyle(
                color: Colors.white,
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
                    children: const [
                      Text(
                        'playlist_name',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        '0 likes',
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      )
                    ],
                  )
                ],
              ),
              const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              )
            ],
          )
        ],
      ),
    );
  }
}
