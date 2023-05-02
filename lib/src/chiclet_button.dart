import 'dart:math';
import 'package:flutter/material.dart';

import 'enums/button_types.dart';

class ChicletButton extends StatelessWidget {
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
