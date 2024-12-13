import 'package:flutter/material.dart';

class GradientText extends StatefulWidget {
  const GradientText({super.key});

  @override
  State<GradientText> createState() => _GradientTextState();
}

class _GradientTextState extends State<GradientText> {
  late AnimationController animationController;
  late Animation animation;

  @override
  void initState() {
    animation
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ShaderMask(
                shaderCallback: (bounds) => const RadialGradient(
                  center: Alignment.topRight,
                  radius: 1.0,
                  colors: [
                    Colors.orangeAccent,
                    Colors.redAccent,
                  ],
                  tileMode: TileMode.mirror,
                ).createShader(bounds),
                child: const Text(
                  'Text',
                  style: TextStyle(
                    fontSize: 56,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                "Hello, Good Morning Everyone!",
                style: TextStyle(
                  fontSize: 30.0,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()
                    ..shader = const LinearGradient(
                      colors: <Color>[
                        Colors.pinkAccent,
                        Colors.deepPurpleAccent,
                        Colors.red
                        //add more color here.
                      ],
                    ).createShader(
                      const Rect.fromLTWH(0.0, 0.0, 200.0, 100.0),
                    ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
