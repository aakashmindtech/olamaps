import 'package:flutter/material.dart';

class BackAndForthProgressBar extends StatefulWidget {
  @override
  _BackAndForthProgressBarState createState() => _BackAndForthProgressBarState();
}

class _BackAndForthProgressBarState extends State<BackAndForthProgressBar> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 0.0, end: 1.0).animate(
        _controller,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: 2,
        child: Stack(
          children: [
            Container(
              height: 10,
              color: Colors.grey[300],
            ),
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Positioned(
                  left: _animation.value * (MediaQuery.of(context).size.width - 10),
                  child: Container(
                    width: 50,
                    height: 10,
                    color: Colors.blue,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}