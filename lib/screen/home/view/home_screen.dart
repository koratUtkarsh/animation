import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation? alignTween;
  Animation? sizeTween;
  Animation? colorTween;
  Animation? rotateTween;

  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 3));

    alignTween = Tween<Alignment>(
            begin: Alignment.topCenter, end: Alignment.bottomCenter)
        .animate(animationController!);
    sizeTween =
        Tween<double>(begin: 50, end: 200).animate(animationController!);
    rotateTween =
        Tween<double>(begin: 100, end: 360).animate(animationController!);
    colorTween = ColorTween(begin: Colors.red, end: Colors.amber)
        .animate(animationController!);

    animationController!.repeat(reverse: true);
    animationController!.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Align(
          alignment: alignTween!.value,
          child: AnimatedBuilder(
            animation: animationController!,
            builder: (context, child) {
              return Transform.rotate(
                angle: pi*2*animationController!.value,
                child: child,
              );
            },
            child: Container(
              height: sizeTween!.value,
              width: sizeTween!.value,
              color: colorTween!.value,
            ),
          ),
        ),
      ),
    );
  }
}
