import 'package:flutter/material.dart';
import 'package:chiclet/chiclet.dart';

void main() {
  runApp(const Chiclet());
}

class Chiclet extends StatelessWidget {
  const Chiclet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chiclet',
      theme: ThemeData(
        colorSchemeSeed: Colors.red,
        useMaterial3: false,
      ),
      home: const MyHomePage(title: 'Chiclet'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;

  const MyHomePage({required this.title, Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChicletOutlinedAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      borderRadius: 0,
                      child: const Icon(Icons.keyboard_return)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      borderRadius: 0,
                      child: const Icon(Icons.keyboard_return)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      width: 140,
                      borderRadius: 0,
                      child: const Icon(Icons.keyboard_return)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChicletOutlinedAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      child: const Icon(Icons.keyboard_return_rounded)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      child: const Icon(Icons.keyboard_return_rounded)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      width: 140,
                      child: const Icon(Icons.keyboard_return_rounded)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChicletOutlinedAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      buttonType: ChicletButtonTypes.circle,
                      child: const Icon(Icons.keyboard_return_rounded)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      height: 64,
                      buttonType: ChicletButtonTypes.circle,
                      child: const Icon(Icons.keyboard_return_rounded)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      width: 140,
                      height: 64,
                      borderRadius: 64,
                      buttonType: ChicletButtonTypes.roundedRectangle,
                      child: const Icon(Icons.keyboard_return_rounded)),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ChicletOutlinedAnimatedButton(
                      onPressed: () {},
                      height: 50,
                      width: 65,
                      buttonType: ChicletButtonTypes.oval,
                      child: const Icon(Icons.keyboard_return_rounded)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      height: 50,
                      width: 65,
                      buttonType: ChicletButtonTypes.oval,
                      child: const Icon(Icons.keyboard_return_rounded)),
                  ChicletAnimatedButton(
                      onPressed: () {},
                      height: 50,
                      width: 140,
                      buttonType: ChicletButtonTypes.oval,
                      child: const Icon(Icons.keyboard_return_rounded)),
                ],
              ),
              ChicletSegmentedButton(
                height: 66,
                buttonHeight: 6,
                padding: EdgeInsets.zero,
                children: [
                  ChicletButtonSegment(
                    onPressed: () {},
                    child: const Icon(Icons.shuffle_rounded),
                  ),
                  ChicletButtonSegment(
                    onPressed: () {},
                    child: const Icon(Icons.skip_previous_rounded),
                  ),
                  ChicletButtonSegment(
                    onPressed: () {},
                    child: const Icon(Icons.play_arrow),
                  ),
                  ChicletButtonSegment(
                    onPressed: () {},
                    child: const Icon(Icons.skip_next_rounded),
                  ),
                  ChicletButtonSegment(
                    onPressed: () {},
                    child: const Icon(Icons.repeat_rounded),
                  ),
                ],
              ),
              ChicletSegmentedButton(
                width: 330,
                height: 66,
                buttonHeight: 6,
                children: [
                  Expanded(
                    child: ChicletButtonSegment(
                      onPressed: () {},
                      child: const Text("Submit"),
                    ),
                  ),
                  ChicletButtonSegment(
                    onPressed: () {},
                    padding: EdgeInsets.zero,
                    child: const Icon(Icons.edit_rounded),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
