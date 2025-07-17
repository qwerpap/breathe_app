import 'package:flutter/material.dart';

class DefaultAppAnimation extends StatefulWidget {
  final Widget Function(bool isPressed) builder;
  final VoidCallback? onTap;
  final Duration duration;

  const DefaultAppAnimation({
    super.key,
    required this.builder,
    this.onTap,
    this.duration = const Duration(milliseconds: 150),
  });

  @override
  State<DefaultAppAnimation> createState() => _DefaultAppAnimationState();
}

class _DefaultAppAnimationState extends State<DefaultAppAnimation> {
  bool _isPressed = false;

  void _onTapDown(TapDownDetails _) => setState(() => _isPressed = true);
  void _onTapUp(TapUpDetails _) => setState(() => _isPressed = false);
  void _onTapCancel() => setState(() => _isPressed = false);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      behavior: HitTestBehavior.opaque,
      child: widget.builder(_isPressed),
    );
  }
}
