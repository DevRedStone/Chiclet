import 'package:flutter/material.dart';

import 'enums/button_types.dart';
import 'chiclet_outlined_button.dart';

class ChicletOutlinedAnimatedButton extends StatefulWidget {
  final Widget child;
  final bool isPressed;
  final double? width;
  final double height;
  final Size? minimumSize;
  final Size? maximumSize;
  final double buttonHeight;
  final double borderWidth;
  final double borderRadius;
  final Color? borderColor;
  final Color? buttonColor;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final ButtonTypes buttonType;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;
  final InteractiveInkFeatureFactory? splashFactory;

  const ChicletOutlinedAnimatedButton(
      {Key? key,
      required this.onPressed,
      this.padding,
      this.width,
      this.height = 50,
      this.minimumSize,
      this.maximumSize,
      this.isPressed = false,
      this.buttonHeight = 4,
      this.borderWidth = 2,
      this.borderRadius = 16,
      this.borderColor = Colors.grey,
      this.buttonColor,
      this.foregroundColor,
      this.backgroundColor = Colors.white,
      this.splashFactory = NoSplash.splashFactory,
      this.buttonType = ButtonTypes.roundedRectangle,
      required this.child})
      : super(key: key);

  @override
  State<ChicletOutlinedAnimatedButton> createState() =>
      _ChicletOutlinedAnimatedButtonState();
}

class _ChicletOutlinedAnimatedButtonState
    extends State<ChicletOutlinedAnimatedButton>
    with SingleTickerProviderStateMixin {
  bool _isPressed = false;
  static const Duration duration = Duration(milliseconds: 80);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ChicletOutlinedButton(
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
          borderWidth: widget.borderWidth,
          borderRadius: widget.borderRadius,
          borderColor: widget.borderColor,
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
