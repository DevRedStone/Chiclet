library parent_class;

import 'package:chiclet/src/chiclet_segmented_button_segment.dart';
import 'package:chiclet/src/enums/button_group_positions.dart';
import 'package:chiclet/src/enums/button_types.dart';
import 'package:flutter/material.dart';

import 'package:chiclet/chiclet.dart';

class ChicletSegmentedButton<T> extends StatefulWidget {
  final List<Widget> _chicletButtonsList = [];

  ///
  final List<Widget> children;

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

  /// The padding between the button's boundary and its child.
  final EdgeInsetsGeometry? padding;

  /// Creates the InkWell splash factory, which defines the appearance of "ink" splashes that occur in response to taps.
  final InteractiveInkFeatureFactory? splashFactory;

  static const _text = Text("");
  static final Type _expandedType = const Expanded(child: _text).runtimeType;
  static final Type _chicletButtonSegmentType =
      ChicletButtonSegment(child: _text).runtimeType;

  ChicletSegmentedButton(
      {Key? key,
      this.padding,
      this.width,
      this.height = 50,
      this.minimumSize,
      this.maximumSize,
      this.buttonHeight = 4,
      this.borderRadius = 16,
      this.buttonColor,
      this.foregroundColor,
      this.backgroundColor,
      this.splashFactory = NoSplash.splashFactory,
      this.buttonType = ButtonTypes.roundedRectangle,
      required this.children})
      : super(key: key) {
    for (var child in children) {
      if (child.runtimeType == _expandedType) {
        if (child is! Expanded) {
          if ((child as Expanded).child.runtimeType !=
              _chicletButtonSegmentType) {
            throw ArgumentError(
                "Invalid child widget type. Only ChicletButtonSegment is allowed as Expanded's child.");
          }
        }
        _chicletButtonsList.add(child.child);
      } else if (child.runtimeType == _chicletButtonSegmentType) {
        _chicletButtonsList.add(child);
      } else {
        throw ArgumentError(
            "Invalid child widget type. Only Expanded and ChicletButtonSegment are allowed.");
      }
    }

    if (_chicletButtonsList.isNotEmpty) {
      var chicletButton = _chicletButtonsList.first as ChicletButtonSegment;
      chicletButton.buttonPosition = ButtonPositions.start;
      chicletButton = _chicletButtonsList.last as ChicletButtonSegment;
      chicletButton.buttonPosition = ButtonPositions.end;

      for (int index = 0; index < _chicletButtonsList.length; index++) {
        if (_chicletButtonsList[index] is ChicletButtonSegment) {
          chicletButton = _chicletButtonsList[index] as ChicletButtonSegment;
          chicletButton.height = height;
          chicletButton.buttonType = buttonType;
          chicletButton.buttonHeight = buttonHeight;
          chicletButton.padding ??= padding;
          chicletButton.buttonColor ??= buttonColor;
          chicletButton.foregroundColor =
              (chicletButton.foregroundColor == Colors.white &&
                      foregroundColor != null)
                  ? foregroundColor
                  : chicletButton.foregroundColor;
          chicletButton.backgroundColor ??= backgroundColor;
          chicletButton.splashFactory = splashFactory!;
          if (index != 0 && index != _chicletButtonsList.length - 1) {
            chicletButton.buttonPosition = ButtonPositions.between;
          } else {
            chicletButton.borderRadius = borderRadius;
          }
        }
      }
    }
  }

  @override
  State<ChicletSegmentedButton<T>> createState() =>
      _ChicletSegmentedButtonState<T>();
}

class _ChicletSegmentedButtonState<T> extends State<ChicletSegmentedButton<T>> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.width,
      height: widget.height + widget.buttonHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: widget.children,
      ),
    );
  }
}
