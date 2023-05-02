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

This package provides you with highly customizable buttons known as Chiclet. Commonly seen in the language learning app Duolingo.

![Chiclet](/assets/intro.jpg)

## Getting started

In the ```dependencies:``` section of your ```pubspec.yaml```, add the following line:
```
dependencies:
  chiclet: <latest_version>
```

## Usage

1. Import Chiclet in your main.dart.
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

![Chiclet](/assets/ChicletButtonTypes.roundedRectangle.jpg)

## Button Types

1. RoundedRectangle (default type):
   - You can either not specifiy it, or write ```ChicletButtonTypes.roundedRectangle``` in front of the ```buttonType``` property. Either case result will be the same. Example:
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
   
   ![Chiclet](/assets/ChicletButtonTypes.roundedRectangle.jpg)
   
2. Circle:
   - You can create a circle shaped button by writing ```ChicletButtonTypes.circle``` in front of the ```buttonType``` property. Example:
   ```dart
   ChicletOutlinedAnimatedButton(
     onPressed: () {},
     buttonType: ChicletButtonTypes.circle,
     child: const Icon(Icons.download_rounded),
   ),
   ```
   
   ![Chiclet](/assets/ChicletButtonTypes.circle.jpg)
   
3. Oval
   - You can create an oval shaped button by writing ```ChicletButtonTypes.circle``` in front of the ```buttonType``` property. Example:
   ```dart
   ChicletOutlinedAnimatedButton(
     onPressed: () {},
     width: 65,
     buttonType: ChicletButtonTypes.oval,
     child: const Icon(Icons.download_rounded),
   ),
   ```
   
   ![Chiclet](/assets/ChicletButtonTypes.oval.jpg)
   
You can find more examples in the ```/example/lib/main.dart``` directory.

![Chiclet](/assets/example.jpg)

## Costumizable Properties

ChicletButton and ChicletAnimatedButton:

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

ChicletOutlinedButton and ChicletOutlinedAnimatedButton:

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
* buttonColor (default is ```Color.grey```),
* foregroundColor (default is ```ThemeData```'s ```primarySwatch```),
* backgroundColor (default is ```Colors.white```),
* splashFactory (default is ```NoSplash.splashFactory```),
* buttonType (default is ```ChicletButtonTypes.roundedRectangle```),

## Additional information

Suggestions, recommendations, bug reports, and issues:
[DevRedStone](DevRedStone.github.io)
