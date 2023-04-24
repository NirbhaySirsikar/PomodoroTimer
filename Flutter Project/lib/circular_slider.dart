import 'package:flutter_glow/flutter_glow.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'utils.dart';

double radius = 130;
double radiusActive = 115;
double strokeWidthActive = 10;
double strokeWidthBar = 40;

class CircularSlider extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;

  CircularSlider({super.key, required this.onAngleChanged});

  @override
  State<CircularSlider> createState() => _CircularSliderState();
}

class _CircularSliderState extends State<CircularSlider> {
  Offset _currentDragOffset = Offset.zero;

  double startAngle = toRadian(270);

  double currentAngle = 0;

  double totalAngle = toRadian(360);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    Size canvasSize = Size(screenSize.width, screenSize.width - 35);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(
        center - Offset(strokeWidthActive, strokeWidthActive),
        currentAngle + startAngle,
        radiusActive);
    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          child: Container(),
          painter: SliderPainter(startAngle, currentAngle),
        ),
        Center(
          child: GlowContainer(
            offset: Offset.zero,
            blurRadius: 40,
            glowColor: Color(0xff664eff),
            color: Color(0xff232330),
            shape: BoxShape.circle,
            height: 220,width:220,spreadRadius: -10,
            child: Center(child: Text('05:24',style: TextStyle(fontSize: 50,),)),
          ),
        ),
        Positioned(
          left: knobPos.dx,
          top: knobPos.dy,
          // left: _currentDragOffset.dx,
          // top: _currentDragOffset.dy,
          child: GestureDetector(
            onPanStart: (details) {
              RenderBox getBox = context.findRenderObject() as RenderBox;
              _currentDragOffset = getBox.globalToLocal(details.globalPosition);
            },
            onPanUpdate: (details) {
              var previousOffset = _currentDragOffset;
              _currentDragOffset += details.delta;
              var angle = currentAngle +
                  toAngle(_currentDragOffset, center) -
                  toAngle(previousOffset, center);
              currentAngle = normalizeAngle(angle);
              widget.onAngleChanged(currentAngle);
              setState(() {});
            },
            child: const _Knob(),
          ),
        ),
      ],
    );
  }
}

class SliderPainter extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  SliderPainter(this.startAngle, this.currentAngle);
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radiusActive);

    Rect rectbar = Rect.fromCircle(center: center, radius: radius);
    var activetrack = Paint()
      ..shader = SweepGradient(
        colors: [Colors.transparent, Color(0xff664eff)],
        transform: GradientRotation(currentAngle - toRadian(90)),
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidthActive;

    canvas.drawArc(
        rectbar,
        startAngle,
        math.pi * 2,
        false,
        Paint()
          ..color = Colors.white10.withAlpha(10)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidthBar);

    canvas.drawArc(
        rectbar,
        startAngle,
        currentAngle,
        false,
        Paint()
          ..color = Colors.white10.withAlpha(10)
          ..style = PaintingStyle.stroke
          ..strokeWidth = strokeWidthBar);

    canvas.drawArc(rect, startAngle, currentAngle, false, activetrack);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class _Knob extends StatelessWidget {
  const _Knob({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(color: Color(0xff664eff), width: 5),
      ),
    );
  }
}
