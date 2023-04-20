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
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xff6e4eb3),
                    borderRadius: BorderRadius.all(Radius.circular(100))),

                width: MediaQuery.of(context).size.width,
                // height: ,
                margin: EdgeInsets.fromLTRB(20, 30, 20, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('Task: Write an article',
                        style: TextStyle(fontSize: 18)),
                    Icon(
                      FontAwesomeIcons.pen,
                      size: 18,
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                height: double.infinity,
                color: Colors.green,
                child: Center(child: Text("Widget 2")),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: double.infinity,
                color: Colors.red,
                child: Center(child: Text("Widget 3")),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                color: Colors.yellow,
                child: Center(child: Text("Widget 4")),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
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
    );
  }
}
