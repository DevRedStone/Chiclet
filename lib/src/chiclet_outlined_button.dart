import 'package:flutter/material.dart';

import 'enums/button_types.dart';

class ChicletOutlinedButton extends StatelessWidget {
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

  /// The width of the border on the button's surface.
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

  const ChicletOutlinedButton({
    Key? key,
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
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              minimumSize: minimumSize,
              maximumSize: maximumSize,
              shape: RoundedRectangleBorder(
                borderRadius: buttonType == ButtonTypes.oval
                    ? BorderRadius.all(Radius.elliptical(chicletWidth, height))
                    : BorderRadius.circular(chicletBorderRadius - 2),
              ),
            ).copyWith(
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(
                  splashFactory == NoSplash.splashFactory
                      ? Colors.transparent
                      : Theme.of(context).splashColor),
            ),
            child: child),
      ),
    );
  }
}
