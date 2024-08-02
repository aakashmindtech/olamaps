import 'package:flutter/material.dart';

class VerticalDashedLine extends StatelessWidget {
  final double width;
  final Color color;
  final double dashHeight;
  final double dashSpace;

  VerticalDashedLine({
    this.width = 1.0,
    this.color = Colors.black,
    this.dashHeight = 10.0,
    this.dashSpace = 5.0,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: List.generate(
          3,
              (index) => Container(
            width: width,
            height: dashHeight,
            color: color,
            margin: EdgeInsets.only(bottom: dashSpace),
          ),
        ),
      ),
    );
  }
}