import 'package:flutter/material.dart';

import 'enums/button_types.dart';
import 'chiclet_button.dart';

class ChicletAnimatedButton extends StatefulWidget {
  final Widget child;
  final bool isPressed;
  final double? width;
  final double height;
  final Size? minimumSize;
  final Size? maximumSize;
  final double buttonHeight;
  final double borderRadius;
  final Color? buttonColor;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final ButtonTypes buttonType;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final InteractiveInkFeatureFactory? splashFactory;

  const ChicletAnimatedButton(
      {Key? key,
      required this.onPressed,
      this.padding,
      this.width,
      this.height = 50,
      this.minimumSize,
      this.maximumSize,
      this.isPressed = false,
      this.buttonHeight = 4,
      this.borderRadius = 16,
      this.buttonColor,
      this.foregroundColor = Colors.white,
      this.backgroundColor,
      this.splashFactory = NoSplash.splashFactory,
      this.buttonType = ButtonTypes.roundedRectangle,
      required this.child})
      : super(key: key);

  @override
  State<ChicletAnimatedButton> createState() => _ChicletAnimatedButtonState();
}

class _ChicletAnimatedButtonState extends State<ChicletAnimatedButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  static const Duration duration = Duration(milliseconds: 80);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ChicletButton(
          onPressed: () {
            setState(() {
              _isPressed = true;
            });
            Future.delayed(duration, () {
              setState(() {
                _isPressed = false;
              });
              widget.onPressed!();
            });
          },
          padding: widget.padding,
          width: widget.width,
          height: widget.height,
          minimumSize: widget.minimumSize,
          maximumSize: widget.maximumSize,
          isPressed: _isPressed,
          buttonHeight: widget.buttonHeight,
          borderRadius: widget.borderRadius,
          buttonColor: widget.buttonColor,
          foregroundColor: widget.foregroundColor,
          backgroundColor: widget.backgroundColor,
          splashFactory: widget.splashFactory,
          buttonType: widget.buttonType,
          child: widget.child),
    );
  }

  void _onTapDown(TapDownDetails details) {
    setState(() {
      _isPressed = true;
    });
  }

  void _onTapUp(TapUpDetails details) {
    setState(() {
      _isPressed = false;
    });
  }

  void _onTapCancel() {
    setState(() {
      _isPressed = false;
    });
  }
}
