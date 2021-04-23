import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'clipperWidget.dart';

class WaveWidget extends StatefulWidget {
  final Size size;
  final double yOffset;
  final Color color;

  const WaveWidget({
    Key? key,
    required this.size,
    required this.yOffset,
    required this.color,
  }) : super(key: key);

  @override
  _WaveWidgetState createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> with TickerProviderStateMixin {
  AnimationController? animationController;
  List<Offset> wavePoints = [];

  @override
  void initState() {
    super.initState();
    //base of the algo
    animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 5000))
          ..addListener(() {
            wavePoints.clear();
            final double waveSpeed = animationController!.value * 1080;
            final double fullSphere = animationController!.value * pi * 2;
            final double normalizer = cos(fullSphere);
            final double waveWidth = pi / 270;
            final double waveHeight = 20.0;

            for (int i = 0; i <= widget.size.width.toInt(); ++i) {
              double calc = sin((waveSpeed - i) * waveWidth);
              wavePoints.add(
                Offset(
                  i.toDouble(),
                  // the offset controls the amount of wave distortion
                  calc * waveHeight * normalizer + widget.yOffset,
                ),
              );
            }
          });
    animationController!.repeat();
  }

  @override
  void dispose() {
    super.dispose();
    animationController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animationController!,
      builder: (context, _) {
        return ClipPath(
          clipper: ClipperWidget(waveList: wavePoints),
          child: Container(
            width: widget.size.width,
            height: widget.size.height,
            color: widget.color,
          ),
        );
      },
    );
  }
}
