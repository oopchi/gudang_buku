import 'package:flutter/material.dart';

class AnimatedOpacitySize extends StatefulWidget {
  const AnimatedOpacitySize({
    super.key,
    required this.child,
    this.isVisible = true,
    this.duration = 300,
    this.curve = Curves.easeOutCubic,
    this.direction = Axis.vertical,
  });

  final Widget child;
  final bool isVisible;
  final int duration;
  final Curve curve;
  final Axis direction;

  @override
  State<AnimatedOpacitySize> createState() => _AnimatedOpacitySizeState();
}

class _AnimatedOpacitySizeState extends State<AnimatedOpacitySize> {
  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedSize(
        duration: Duration(
          milliseconds: widget.duration,
        ),
        curve: widget.curve,
        child: AnimatedOpacity(
          duration: Duration(
            milliseconds: widget.duration,
          ),
          opacity: widget.isVisible ? 1.0 : .0,
          child: Align(
            heightFactor: widget.direction == Axis.vertical
                ? (widget.isVisible ? 1.0 : .0)
                : 1.0,
            widthFactor: widget.direction == Axis.horizontal
                ? (widget.isVisible ? 1.0 : .0)
                : 1.0,
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
