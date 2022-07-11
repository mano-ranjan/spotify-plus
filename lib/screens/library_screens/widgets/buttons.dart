import 'package:flutter/material.dart';
import 'package:spotify_app/utils/constants/colors.dart';

class SpotifyPlusButton extends StatefulWidget {
  final String buttonText;
  const SpotifyPlusButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<SpotifyPlusButton> createState() => _SpotifyPlusButtonState();
}

class _SpotifyPlusButtonState extends State<SpotifyPlusButton> {
  bool istapped = false;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        setState(() {
          istapped = !istapped;
        });
      },
      child: Container(
        height: 40,
        decoration: BoxDecoration(
          color: istapped ? Colors.green : Colors.transparent,
          border: Border.all(
            color: istapped ? Colors.green.shade700 : Colors.grey,
          ),
          borderRadius: BorderRadius.circular(
            36,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Text(
              widget.buttonText,
              style: TextStyle(
                color: SpotifyPlusColors().pureWhite,
                fontSize: 16,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
