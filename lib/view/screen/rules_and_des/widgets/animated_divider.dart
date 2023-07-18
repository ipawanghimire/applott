import 'package:flutter/material.dart';

class AnimatedDivider extends StatefulWidget {
  const AnimatedDivider({
    required this.duration,
    required this.color,
    super.key,
  });
  final Duration duration;
  final Color color;

  @override
  AnimatedDividerState createState() => AnimatedDividerState();
}

class AnimatedDividerState extends State<AnimatedDivider>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  Animation<double>? _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(duration: widget.duration, vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation!,
      builder: (context, child) {
        return SizedBox(
          height: 6,
          child: LinearProgressIndicator(
            value: _animation?.value,
            backgroundColor: Colors.transparent,
            valueColor: AlwaysStoppedAnimation<Color>(widget.color),
          ),
        );
      },
    );
  }
}
