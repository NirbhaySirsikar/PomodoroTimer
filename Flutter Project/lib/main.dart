import 'package:flutter/material.dart';
import 'package:pomotimer/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_glow/flutter_glow.dart';

// ignore_for_file: prefer_const_constructors
void main() {
  runApp(const Home());
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pomodoro Timer',
      theme: appTheme,
      home: Scaffold(
        backgroundColor: const Color(0xff1F1B2E),
        appBar: AppBar(
          title: const Center(
              child: Text(
            'Pomodoro timer',
            style: TextStyle(fontWeight: FontWeight.bold, letterSpacing: 2.0),
          )),
          backgroundColor: const Color(0x1F1B2E),
          elevation: 0.0,
        ),
        body: Column(
          children: [Text('Hello')],
        ),
        bottomNavigationBar: Container(
          padding: EdgeInsets.symmetric(vertical: 30, horizontal: 12),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: const [
            Icon(
              FontAwesomeIcons.calendar,
              size: 20,
            ),
            GlowIcon(
              offset: Offset(0, 0),
              blurRadius: 10,
              FontAwesomeIcons.clock,
              size: 20,
              color: Color(0xff664eff),
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
        ),
      ),
    );
  }
}
