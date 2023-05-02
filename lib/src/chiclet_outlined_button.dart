import 'package:flutter/material.dart';

import 'enums/button_types.dart';

class ChicletOutlinedButton extends StatelessWidget {
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

  const ChicletOutlinedButton({
    Key? key,
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
    required this.child,
  }) : super(key: key);

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
          color: buttonColor ?? borderColor,
          borderRadius: buttonType == ButtonTypes.oval
              ? BorderRadius.all(Radius.elliptical(chicletWidth, height))
              : BorderRadius.circular(chicletBorderRadius)),
      child: Container(
        width: chicletWidth,
        height: height,
        padding: EdgeInsets.all(borderWidth),
        decoration: BoxDecoration(
          color: borderColor,
          borderRadius: buttonType == ButtonTypes.oval
              ? BorderRadius.all(Radius.elliptical(chicletWidth, height))
              : BorderRadius.circular(chicletBorderRadius),
        ),
        child: TextButton(
            onPressed: onPressed,
            style: TextButton.styleFrom(
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
                    : BorderRadius.circular(chicletBorderRadius - 2),
              ),
            ),
            child: child),
      ),
    );
  }
}
