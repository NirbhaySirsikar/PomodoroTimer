import 'package:flutter/material.dart';

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
