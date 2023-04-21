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

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double value = 3;
  var color0 = Color(0xff1F1B2E);
  var color3 = Color(0xff444267);
  var color1 = Color(0xff664eff);
  var color2 = Color(0xff6c4eb3);

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
                    borderRadius: BorderRadius.all(Radius.circular(100))),

                width: MediaQuery.of(context).size.width,
                // height: ,
                margin: EdgeInsets.fromLTRB(20, 35, 20, 35),
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
                    offset: Offset(0, 0),
                    color: color1,
                    borderRadius: BorderRadius.all(Radius.circular(50)),
                    height: 70,
                    width: 70,
                    child: Icon(FontAwesomeIcons.pause, size: 35),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
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
            color: color2,
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

//Donut Slider class

class DonutSliderThumbCircle extends SliderComponentShape {
  final double thumbRadius;
  final int min;
  final int max;

  const DonutSliderThumbCircle({
    required this.thumbRadius,
    required this.min,
    required this.max,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(
    PaintingContext context,
    Offset center, {
    required Animation<double> activationAnimation,
    required Animation<double> enableAnimation,
    required bool isDiscrete,
    required TextPainter labelPainter,
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required TextDirection textDirection,
    required double value,
    required double textScaleFactor,
    required Size sizeWithOverflow,
  }) {
    final Canvas canvas = context.canvas;
    final paint = Paint()
      ..color = sliderTheme.thumbColor!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;
    final paintInside = Paint()
      ..color = Color(0xff1F1B2E)
      ..style = PaintingStyle.fill
      ..strokeWidth = 0;

    // Draw the outer circle of the thumb
    canvas.drawCircle(center, thumbRadius, paint);
    //Draw inner circle of the thumb
    canvas.drawCircle(center, 8, paintInside);

    // final double startAngle = valueToRadians(min, max, value);

    // Draw the donut-shaped thumb
    paint
      ..color = sliderTheme.activeTickMarkColor!
      ..style = PaintingStyle.fill;

    // canvas.drawArc(
    //   Rect.fromCircle(center: center, radius: thumbRadius),
    //   startAngle,
    //   degToRadians(270),
    //   true,
    //   paint,
    // );
  }
}

double valueToRadians(int min, int max, double value) {
  return ((value - min) / (max - min) * 3 * 3.14 / 2 + 3.14 / 4);
}

double degToRadians(double deg) {
  return deg * 3.14 / 180;
}

class DonutSlider extends StatelessWidget {
  final int min;
  final int max;
  final int value;
  final ValueChanged<double> onChanged;
  final int divisions;

  DonutSlider({
    Key? key,
    required this.min,
    required this.max,
    required this.value,
    required this.onChanged,
    required this.divisions,
  }) : super(key: key);

  //Custom colors

  var color0 = Color(0xff1F1B2E);
  var color3 = Color(0xff444267);
  var color1 = Color(0xff664eff);
  var color2 = Color(0xff6c4eb3);
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        thumbShape: DonutSliderThumbCircle(
          thumbRadius: 10,
          min: min,
          max: max,
        ),

        //Custom added parameters
        trackHeight: 1,
        rangeThumbShape: RoundRangeSliderThumbShape(
          disabledThumbRadius: 8,
          enabledThumbRadius: 8,
        ),

        tickMarkShape: RoundSliderTickMarkShape(
          tickMarkRadius: 6,
        ),
        overlayColor: Colors.transparent,
        inactiveTickMarkColor: color3,
        inactiveTrackColor: color3,
        thumbColor: color1,
        activeTrackColor: color3,
        activeTickMarkColor: color1,
      ),
      child: Slider(
        min: min.toDouble(),
        max: max.toDouble(),
        value: value.toDouble(),
        onChanged: onChanged,
        divisions: divisions,
      ),
    );
  }
}
