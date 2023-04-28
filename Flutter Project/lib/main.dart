import 'package:flutter/material.dart';
import 'package:pomotimer/pages/home/home.dart';
import 'package:pomotimer/theme.dart';

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
      home: HomePage(),
    );
  }
}
