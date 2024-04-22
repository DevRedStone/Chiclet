import 'package:flutter/material.dart';

import 'chiclet_outlined_button.dart';
import 'enums/button_types.dart';

class ChicletOutlinedAnimatedButton extends StatefulWidget {
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

  /// The width of the button's surface border.
  final double borderWidth;

  /// The border radius of the button's corners.
  final double borderRadius;

  /// The color of the border on the button's surface.
  final Color? borderColor;

  /// The color of the button.
  ///
  /// If not given, it will be the same as [borderColor].
  final Color? buttonColor;

  /// The color for the button's Text and Icon widget descendants.
  ///
  /// If not given, it will be the same as ThemeData's primarySwatch.
  final Color? foregroundColor;

  /// The color of the button's surface.
  final Color? backgroundColor;

  /// The color for the disabled button's Text and Icon widget descendants.
  final Color? disabledForegroundColor;

  /// The color of the disabled button's surface.
  final Color? disabledBackgroundColor;

  /// The color of the border on the disabled button's surface.
  ///
  /// If not given, it will be Theme.colorScheme.onSurface(0.12).
  final Color? disabledBorderColor;

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

  const ChicletOutlinedAnimatedButton(
      {Key? key,
      this.onPressed,
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
      this.disabledForegroundColor,
      this.disabledBackgroundColor,
      this.disabledBorderColor,
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
  late bool _isPressed = widget.isPressed;
  static const Duration duration = Duration(milliseconds: 80);

  @override
  Widget build(BuildContext context) {
    bool isDisabled = widget.onPressed == null;

    return GestureDetector(
      onTapDown: _onTapDown,
      onTapUp: _onTapUp,
      onTapCancel: _onTapCancel,
      child: ChicletOutlinedButton(
          onPressed: !isDisabled ? _handleButtonPress : null,
          padding: widget.padding,
          width: widget.width,
          height: widget.height,
          minimumSize: widget.minimumSize,
          maximumSize: widget.maximumSize,
          isPressed: isDisabled ? true : _isPressed,
          buttonHeight: widget.buttonHeight,
          borderWidth: widget.borderWidth,
          borderRadius: widget.borderRadius,
          borderColor: widget.borderColor,
          buttonColor: widget.buttonColor,
          foregroundColor: widget.foregroundColor,
          backgroundColor: widget.backgroundColor,
          disabledBackgroundColor: widget.disabledBackgroundColor,
          disabledForegroundColor: widget.disabledForegroundColor,
          disabledBorderColor: widget.disabledBorderColor,
          splashFactory: widget.splashFactory,
          buttonType: widget.buttonType,
          child: widget.child),
    );
  }

  Future<void> _handleButtonPress() async {
    setState(() {
      _isPressed = true;
    });
    await Future.delayed(duration, () {
      setState(() {
        _isPressed = false;
      });
      if (widget.onPressed != null) {
        widget.onPressed!();
      }
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
