import 'package:flutter/material.dart';

import 'chiclet_button.dart';
import 'enums/button_types.dart';

class ChicletAnimatedButton extends StatefulWidget {
  /// Typically the button's label.
  final Widget child;

  /// Whether the button is currently pressed or not.
  final bool isPressed;

  /// The width of the button.
  ///
  /// If not given, it will be the same as [height].
  final double? width;

  /// The height of the button's surface.
  final double height;

  /// The minimum size of the button itself.
  final Size? minimumSize;

  /// The maximum size of the button itself.
  final Size? maximumSize;

  /// The height of the button.
  ///
  /// It applies in addition to the [height].
  final double buttonHeight;

  /// The border radius of the button's corners.
  final double borderRadius;

  /// The color of the button.
  ///
  /// If [backgroundColor] is given, it will be shade.900 of [backgroundColor].
  /// If neither [backgroundColor] nor [buttonColor] is given, it will be the shade.900 of ThemeData's primarySwatch.
  final Color? buttonColor;

  /// The color for the button's Text and Icon widget descendants.
  final Color? foregroundColor;

  /// The color of the button's surface.
  ///
  /// If not given, it will be the same as ThemeData's primarySwatch.
  final Color? backgroundColor;

  /// The color for the disabled button's Text and Icon widget descendants.
  final Color? disabledForegroundColor;

  /// The color of the disabled button's surface.
  final Color? disabledBackgroundColor;

  /// The shape of the button.
  ///
  /// The available options are: roundedRectangle (the default shape), circle, and oval.
  final ButtonTypes buttonType;

  /// Called when the button is tapped or otherwise activated.
  final VoidCallback? onPressed;

  /// The padding between the button's boundary and its child.
  final EdgeInsetsGeometry? padding;

  /// Creates the InkWell splash factory, which defines the appearance of "ink" splashes that occur in response to taps.
  final InteractiveInkFeatureFactory? splashFactory;

  const ChicletAnimatedButton(
      {Key? key,
      this.onPressed,
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
      this.disabledForegroundColor,
      this.disabledBackgroundColor,
      this.splashFactory = NoSplash.splashFactory,
      this.buttonType = ButtonTypes.roundedRectangle,
      required this.child})
      : super(key: key);

  @override
  State<ChicletAnimatedButton> createState() => _ChicletAnimatedButtonState();
}

class _ChicletAnimatedButtonState extends State<ChicletAnimatedButton>
    with SingleTickerProviderStateMixin {
  late bool _isPressed = widget.isPressed;
  static const Duration duration = Duration(milliseconds: 80);

  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.onPressed == null;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ChicletButton(
          onPressed: !isDisabled ? _handleButtonPress : null,
          padding: widget.padding,
          width: widget.width,
          height: widget.height,
          minimumSize: widget.minimumSize,
          maximumSize: widget.maximumSize,
          isPressed: isDisabled ? true : _isPressed,
          buttonHeight: widget.buttonHeight,
          borderRadius: widget.borderRadius,
          buttonColor: widget.buttonColor,
          foregroundColor: widget.foregroundColor,
          backgroundColor: widget.backgroundColor,
          disabledForegroundColor: widget.disabledForegroundColor,
          disabledBackgroundColor: widget.disabledBackgroundColor,
          splashFactory: widget.splashFactory,
          buttonType: widget.buttonType,
          child: widget.child),
    );
  }

  Future<void> _handleButtonPress() async {
    setState(() {
      _isPressed = true;
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
    });
    await Future.delayed(duration, () {
      setState(() {
        _isPressed = false;
      });
    });
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
