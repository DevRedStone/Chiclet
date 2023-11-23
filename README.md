<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/guides/libraries/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-library-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/developing-packages).
-->

Highly customizable island-style buttons known as Chiclet.

## Features

Chiclet provides you with highly customizable island-style buttons similar to those found in the popular language learning app Duolingo and Figma courses.

![Chiclet](https://github.com/DevRedStone/Chiclet/blob/master/assets/intro.jpg?raw=true)

## Getting started

In the ```dependencies:``` section of your ```pubspec.yaml```, add the following line:
```
dependencies:
  chiclet: <latest_version>
```

## Usage

1. Import `Chiclet` in your main.dart.
```dart
import 'package:chiclet/chiclet.dart';
```
2. Basic implementation:
```dart
ChicletOutlinedAnimatedButton(
onPressed: () {},
child: const Icon(Icons.download_rounded),
),
```

![Chiclet](https://github.com/DevRedStone/Chiclet/blob/master/assets/ChicletButtonTypes.roundedRectangle.jpg?raw=true)

## Buttons List

* ChicletButton
* ChicletAnimatedButton
* ChicletOutlinedButton
* ChicletAnimatedOutlinedButton
* ChicletSegmentedButton

## Button Types

### 1. RoundedRectangle (default type):
- You can either not specify it, or write ```ChicletButtonTypes.roundedRectangle``` in front of the ```buttonType``` property. In either case, the result will be the same. Example:
   ```dart
   ChicletOutlinedAnimatedButton(
     onPressed: () {},
     child: const Icon(Icons.download_rounded),
   ),
   ```
   ```dart
   ChicletOutlinedAnimatedButton(
     onPressed: () {},
     buttonType: ChicletButtonTypes.roundedRectangle,
     child: const Icon(Icons.download_rounded),
   ),
   ```

![Chiclet](https://github.com/DevRedStone/Chiclet/blob/master/assets/ChicletButtonTypes.roundedRectangle.jpg?raw=true)

### 2. Circle:
- You can create a circle shaped button by writing ```ChicletButtonTypes.circle``` in front of the ```buttonType``` property. Example:
   ```dart
   ChicletOutlinedAnimatedButton(
     onPressed: () {},
     buttonType: ChicletButtonTypes.circle,
     child: const Icon(Icons.download_rounded),
   ),
   ```

![Chiclet](https://github.com/DevRedStone/Chiclet/blob/master/assets/ChicletButtonTypes.circle.jpg?raw=true)

### 3. Oval:
- You can create an oval shaped button by writing ```ChicletButtonTypes.circle``` in front of the ```buttonType``` property. Example:
   ```dart
   ChicletOutlinedAnimatedButton(
     onPressed: () {},
     width: 65,
     buttonType: ChicletButtonTypes.oval,
     child: const Icon(Icons.download_rounded),
   ),
   ```

![Chiclet](https://github.com/DevRedStone/Chiclet/blob/master/assets/ChicletButtonTypes.oval.jpg?raw=true)

You can find more examples in the ```/example/lib/main.dart``` directory.

![Chiclet](https://github.com/DevRedStone/Chiclet/blob/master/assets/example.jpg?raw=true)

## Customizable Properties

### ChicletButton and ChicletAnimatedButton:

* padding,
* width (If not provided, it will be the same as `height`),
* height (default is 50),
* minimumSize,
* maximumSize,
* isPressed (default is false),
* buttonHeight (default is 4, and it applies in addition to the ```height```),
* borderRadius (default is 16),
* buttonColor (default is ```shade.900``` of ```ThemeData```'s ```primarySwatch```, unless you provide the ```backgroundColor``` property, then it will be ```shade.900``` of the ```backgroundColor``` property),
* foregroundColor (default is ```Colors.white```),
* backgroundColor (default is ```ThemeData```'s ```primarySwatch```),
* splashFactory (default is ```NoSplash.splashFactory```),
* buttonType (default is ```ChicletButtonTypes.roundedRectangle```),

### ChicletOutlinedButton and ChicletOutlinedAnimatedButton:

* padding,
* width (If not provided, it will be the same as `height`),
* height (default is 50),
* minimumSize,
* maximumSize,
* isPressed (default is false),
* buttonHeight (default is 4, and it applies in addition to the ```height```),
* borderWidth (default is 2),
* borderRadius (default is 16),
* borderColor (default is ```Colors.grey```),
* buttonColor (default is ```Colors.grey```),
* foregroundColor (default is ```ThemeData```'s ```primarySwatch```),
* backgroundColor (default is ```Colors.white```),
* splashFactory (default is ```NoSplash.splashFactory```),
* buttonType (default is ```ChicletButtonTypes.roundedRectangle```),

### ChicletSegmentedButton:

* padding
* width
* height
* minimumSize,
* maximumSize,
* isPressed (default is false),
* buttonHeight (default is 4, and it applies in addition to the ```height```),
* borderRadius (default is 16),
* buttonColor (default is ```Colors.grey```),
* foregroundColor (default is ```ThemeData```'s ```primarySwatch```),
* backgroundColor (default is ```Colors.white```),
* splashFactory (default is ```NoSplash.splashFactory```),
* buttonType (default is ```ChicletButtonTypes.roundedRectangle```),

### ChicletButtonSegment (Intended to be only used as ChicletSegmentedButton's child):

* padding
* width
* isPressed (default is false),
* buttonColor (default is ```Colors.grey```),
* foregroundColor (default is ```ThemeData```'s ```primarySwatch```),
* backgroundColor (default is ```Colors.white```),

> [!NOTE]
> When using Material 3, providing the ```primarySwatch``` doesn't affect the color properties. You should consider providing either ```colorScheme``` or ```ColorSchemeSeed```.

## Additional information

Suggestions, recommendations, bug reports, and issues:
[DevRedStone](https://github.com/DevRedStone/Chiclet)
