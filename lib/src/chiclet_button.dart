import 'dart:math';

import 'package:flutter/material.dart';

import 'enums/button_group_positions.dart';
import 'enums/button_types.dart';

class ChicletButton extends StatelessWidget {
  final ButtonPositions? _buttonPosition;

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

  const ChicletButton({Key? key,
    ButtonPositions? buttonPosition,
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
      : _buttonPosition = buttonPosition,
        super(key: key);

  int shadeValue(int value, double factor) =>
      max(0, min(value - (value * factor).round(), 255));

  Color shadeColor(Color color, double factor) =>
      Color.fromRGBO(
          shadeValue((color.r * 255.0).round() & 0xff, factor),
          shadeValue((color.g * 255.0).round() & 0xff, factor),
          shadeValue((color.b * 255.0).round() & 0xff, factor),
          1);

  @override
  Widget build(BuildContext context) {
    final isDisabled = onPressed == null;
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
    final OutlinedBorder chicletShape = buttonType != ButtonTypes.circle
        ? RoundedRectangleBorder(
      borderRadius: (_buttonPosition == null)
          ? buttonType != ButtonTypes.oval
          ? BorderRadius.circular(borderRadius - 2)
          : BorderRadius.all(Radius.elliptical(chicletWidth, height))
          : (_buttonPosition == ButtonPositions.start)
          ? BorderRadius.horizontal(
          left: buttonType != ButtonTypes.oval
              ? Radius.circular(borderRadius - 2)
              : Radius.elliptical(chicletWidth * 2, height))
          : (_buttonPosition == ButtonPositions.between)
          ? BorderRadius.zero
          : BorderRadius.horizontal(
          right: buttonType != ButtonTypes.oval
              ? Radius.circular(borderRadius - 2)
              : Radius.elliptical(chicletWidth * 2, height)),
    )
        : const CircleBorder(eccentricity: 0);
    return Container(
        width: chicletWidth,
        height: (isPressed || isDisabled) ? height : height + buttonHeight,
        margin:
        EdgeInsets.only(top: (isPressed || isDisabled) ? buttonHeight : 0),
        padding: EdgeInsets.fromLTRB(
          (_buttonPosition != null && _buttonPosition != ButtonPositions.start)
              ? 1
              : 0,
          0,
          (_buttonPosition != null && _buttonPosition != ButtonPositions.end)
              ? 1
              : 0,
          isPressed || isDisabled ? 0 : buttonHeight,
        ),
        decoration: BoxDecoration(
          color: buttonColor ??
              (backgroundColor != null
                  ? shadeColor(backgroundColor ?? Colors.black, 0.4)
                  : isDisabled
                  ? null
                  : shadeColor(Theme
                  .of(context)
                  .colorScheme
                  .primary, 0.4)),
          borderRadius: (_buttonPosition == null)
              ? buttonType != ButtonTypes.oval
              ? BorderRadius.circular(chicletBorderRadius)
              : BorderRadius.all(Radius.elliptical(chicletWidth, height))
              : (_buttonPosition == ButtonPositions.start)
              ? BorderRadius.horizontal(
              left: buttonType != ButtonTypes.oval
                  ? Radius.circular(borderRadius - 2)
                  : Radius.elliptical(chicletWidth * 2, height))
              : (_buttonPosition == ButtonPositions.between)
              ? BorderRadius.zero
              : BorderRadius.horizontal(
              right: buttonType != ButtonTypes.oval
                  ? Radius.circular(borderRadius - 2)
                  : Radius.elliptical(chicletWidth * 2, height)),
        ),
        child: Theme
            .of(context)
            .useMaterial3 == true
            ? FilledButton(
            onPressed: onPressed,
            style: FilledButton.styleFrom(
              shape: chicletShape,
              minimumSize: minimumSize,
              maximumSize: maximumSize,
              splashFactory: splashFactory,
              foregroundColor: foregroundColor,
              backgroundColor: backgroundColor,
              disabledForegroundColor: disabledForegroundColor,
              disabledBackgroundColor: disabledBackgroundColor,
              padding: (padding != null)
                  ? const EdgeInsets.all(0).add(padding!)
                  : const EdgeInsets.all(0),
            ).copyWith(
                elevation: WidgetStateProperty.all(0),
                overlayColor: WidgetStateProperty.all(
                    splashFactory == NoSplash.splashFactory
                        ? Colors.transparent
                        : Theme
                        .of(context)
                        .splashColor)),
            child: child)
            : ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
                shape: chicletShape,
                minimumSize: minimumSize,
                maximumSize: maximumSize,
                splashFactory: splashFactory,
                foregroundColor: foregroundColor,
                backgroundColor: backgroundColor,
                disabledForegroundColor: disabledForegroundColor,
                disabledBackgroundColor: disabledBackgroundColor,
                padding: (padding != null)
                    ? const EdgeInsets.all(0).add(padding!)
                    : const EdgeInsets.all(0))
                .copyWith(
                elevation: WidgetStateProperty.all(0),
                overlayColor: WidgetStateProperty.all(
                    splashFactory == NoSplash.splashFactory
                        ? Colors.transparent
                        : Theme
                        .of(context)
                        .splashColor)),
            child: child));
  }
}
