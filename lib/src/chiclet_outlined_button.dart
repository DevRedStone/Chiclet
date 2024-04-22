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
    this.disabledBorderColor,
    this.disabledForegroundColor,
    this.disabledBackgroundColor,
    this.splashFactory = NoSplash.splashFactory,
    this.buttonType = ButtonTypes.roundedRectangle,
    required this.child,
  }) : super(key: key);

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
    Color? outlinedButtonThemeColor;
    double? outlinedButtonThemeWidth;
    if (Theme.of(context).outlinedButtonTheme.style?.side != null) {
      outlinedButtonThemeColor = Theme.of(context)
          .outlinedButtonTheme
          .style
          ?.side
          ?.resolve(<MaterialState>{})?.color;
      outlinedButtonThemeColor = (outlinedButtonThemeColor != Colors.black)
          ? outlinedButtonThemeColor
          : Colors.grey;
      outlinedButtonThemeWidth = Theme.of(context)
          .outlinedButtonTheme
          .style
          ?.side
          ?.resolve(<MaterialState>{})?.width;
      outlinedButtonThemeWidth =
          (outlinedButtonThemeWidth != 1) ? outlinedButtonThemeWidth : 2;
    } else {
      outlinedButtonThemeColor = Colors.grey;
      outlinedButtonThemeWidth = 2;
    }
    final Color defaultDisabledBorderColor =
        Theme.of(context).colorScheme.onSurface.withOpacity(0.12);
    return Container(
      width: chicletWidth,
      height: (isPressed || isDisabled) ? height : height + buttonHeight,
      margin:
          EdgeInsets.only(top: (isPressed || isDisabled) ? buttonHeight : 0),
      padding: EdgeInsets.fromLTRB(
          0, 0, 0, (isPressed || isDisabled) ? 0 : buttonHeight),
      decoration: BoxDecoration(
          color: isDisabled
              ? disabledBorderColor ?? defaultDisabledBorderColor
              : (buttonColor != null)
                  ? buttonColor
                  : (borderColor != Colors.grey)
                      ? borderColor ?? Colors.grey
                      : outlinedButtonThemeColor ?? Colors.grey,
          borderRadius: buttonType == ButtonTypes.oval
              ? BorderRadius.all(Radius.elliptical(chicletWidth, height))
              : BorderRadius.circular(chicletBorderRadius)),
      child: Padding(
        padding: (borderWidth != 2)
            ? EdgeInsets.all(borderWidth)
            : EdgeInsets.all(outlinedButtonThemeWidth!),
        child: OutlinedButton(
            onPressed: onPressed,
            style: OutlinedButton.styleFrom(
              minimumSize: minimumSize,
              maximumSize: maximumSize,
              splashFactory: splashFactory,
              foregroundColor: foregroundColor,
              backgroundColor:
                  isDisabled ? disabledBackgroundColor : backgroundColor,
              disabledBackgroundColor: disabledBackgroundColor,
              disabledForegroundColor: disabledForegroundColor,
              padding: (padding != null)
                  ? const EdgeInsets.all(0).add(padding!)
                  : const EdgeInsets.all(0),
              shape: RoundedRectangleBorder(
                  borderRadius: buttonType == ButtonTypes.oval
                      ? BorderRadius.all(
                          Radius.elliptical(chicletWidth, height))
                      : BorderRadius.circular(
                          buttonType == ButtonTypes.roundedRectangle
                              ? isDisabled
                                  ? (borderRadius != 0)
                                      ? borderRadius -
                                          (outlinedButtonThemeWidth! - 2) -
                                          2
                                      : 0
                                  : borderRadius - (borderWidth - 2) - 2
                              : chicletBorderRadius - 2)),
            ).copyWith(
              elevation: MaterialStateProperty.all(0),
              overlayColor: MaterialStateProperty.all(
                  splashFactory == NoSplash.splashFactory
                      ? Colors.transparent
                      : Theme.of(context).splashColor),
              side: MaterialStateProperty.resolveWith<BorderSide>(
                (Set<MaterialState> states) {
                  return BorderSide(
                    style: BorderStyle.solid,
                    width: (borderWidth != 2)
                        ? borderWidth
                        : outlinedButtonThemeWidth ?? 2,
                    color: isDisabled
                        ? disabledBorderColor ?? Colors.transparent
                        : (borderColor != Colors.grey)
                            ? borderColor ?? Colors.grey
                            : outlinedButtonThemeColor ?? Colors.grey,
                    strokeAlign: BorderSide.strokeAlignOutside,
                  );
                },
              ),
            ),
            child: child),
      ),
    );
  }
}
