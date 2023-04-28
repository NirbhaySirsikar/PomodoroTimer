import 'package:flutter/material.dart';
import 'package:pomotimer/pages/home/slider.dart';
import 'package:pomotimer/pages/home/timer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_glow/flutter_glow.dart';
import 'bottom_nav_bar.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 3;
  var color0 = const Color(0xff1F1B2E);
  var color3 = const Color(0xff444267);
  var color1 = const Color(0xff664eff);
  var color2 = const Color(0xff6c4eb3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color0,
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
                    color: color2,
                    borderRadius: const BorderRadius.all(Radius.circular(100))),

                width: MediaQuery.of(context).size.width,
                // height: ,
                margin: const EdgeInsets.fromLTRB(20, 35, 20, 35),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: const [
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
                child: Center(
                  child: CircularSlider(
                    onAngleChanged: (value) => value = 270,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Container(
                  height: double.infinity,
                  width: 157,
                  child: DonutSlider(
                    value: value.toInt(),
                    min: 0,
                    max: 4,
                    onChanged: (value) => setState(() => this.value = value),
                    divisions: 3,
                  ),
                  // child: SliderTheme(
                  //   data: SliderThemeData(

                  //     trackHeight: 2,
                  //     thumbShape: RoundSliderThumbShape(
                  //       disabledThumbRadius: 8,
                  //       enabledThumbRadius: 8,
                  //     ),
                  //     rangeThumbShape: RoundRangeSliderThumbShape(
                  //       disabledThumbRadius: 8,
                  //       enabledThumbRadius: 8,
                  //     ),

                  //     tickMarkShape: RoundSliderTickMarkShape(
                  //       tickMarkRadius: 6,
                  //     ),
                  //     inactiveTickMarkColor: color3,
                  //     inactiveTrackColor: color3,
                  //     thumbColor: color1,
                  //     activeTrackColor: color2,
                  //     activeTickMarkColor: color1,
                  //   ),
                  //   child: Slider(
                  //     value: value,
                  //     min: 0,
                  //     max: 4,
                  //     onChanged: (value) =>
                  //         setState(() => this.value = value),
                  //     divisions: 3,
                  //   ),
                  // ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: double.infinity,
                child: Center(
                  child: GlowContainer(
                    blurRadius: 50,
                    glowColor: color1,
                    offset: const Offset(0, 0),
                    color: color1,
                    borderRadius: const BorderRadius.all(Radius.circular(50)),
                    height: 70,
                    width: 70,
                    child: const Icon(FontAwesomeIcons.pause, size: 35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(color1: color1),
    );
  }
}
