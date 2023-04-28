import 'package:flutter/material.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.color1,
  });

  final Color color1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Icon(
          FontAwesomeIcons.calendar,
          size: 20,
        ),
        GlowIcon(
          offset: Offset(0, 0),
          blurRadius: 20,
          FontAwesomeIcons.clock,
          size: 20,
          color: color1,
        ),
        Icon(
          FontAwesomeIcons.sliders,
          size: 20,
        ),
        Icon(
          FontAwesomeIcons.userNinja,
          size: 20,
        ),
      ]),
    );
  }
}
