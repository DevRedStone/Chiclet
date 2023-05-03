import 'dart:math';
import 'package:flutter/material.dart';

import 'enums/button_types.dart';

class ChicletButton extends StatelessWidget {
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

  const ChicletButton(
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

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) => Color.fromRGBO(
      shadeValue(color.red, factor),
      shadeValue(color.green, factor),
      shadeValue(color.blue, factor),
      1);

  @override
  Widget build(BuildContext context) {
    final double chicletWidth =
        buttonType == ButtonTypes.circle ? height : width ?? height;
    final double chicletBorderRadius =
        buttonType == ButtonTypes.roundedRectangle
            ? borderRadius > height / 2
                ? height / 2
                : borderRadius
            : buttonType == ButtonTypes.circle
                ? height
                : borderRadius;
    return Container(
      width: chicletWidth,
      height: (isPressed) ? height : height + buttonHeight,
      margin: EdgeInsets.only(top: (isPressed) ? buttonHeight : 0),
      padding: EdgeInsets.fromLTRB(0, 0, 0, (isPressed) ? 0 : buttonHeight),
      decoration: BoxDecoration(
          color: buttonColor ??
              shadeColor(Theme.of(context).colorScheme.primary, 0.4),
          borderRadius: buttonType == ButtonTypes.oval
              ? BorderRadius.all(Radius.elliptical(chicletWidth, height))
              : BorderRadius.circular(chicletBorderRadius)),
      child: ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            elevation: 0,
            padding: padding,
            splashFactory: splashFactory,
            shadowColor: Colors.transparent,
            foregroundColor: foregroundColor,
            backgroundColor: backgroundColor,
            minimumSize: minimumSize,
            maximumSize: maximumSize,
            shape: RoundedRectangleBorder(
              borderRadius: buttonType == ButtonTypes.oval
                  ? BorderRadius.all(Radius.elliptical(chicletWidth, height))
                  : BorderRadius.circular(
                      buttonType == ButtonTypes.roundedRectangle
                          ? borderRadius - 2
                          : chicletBorderRadius - 2),
            ),
          ),
          child: child),
    );
  }
}
