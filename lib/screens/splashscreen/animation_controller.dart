// ignore_for_file: prefer_const_constructors, annotate_overrides, sort_child_properties_last, prefer_const_literals_to_create_immutables, depend_on_referenced_packages

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:spring/spring.dart';

class FirstWidgetAmimation extends StatefulWidget {
  const FirstWidgetAmimation({super.key});

  @override
  State<FirstWidgetAmimation> createState() => _FirstWidgetAmimationState();
}

class _FirstWidgetAmimationState extends State<FirstWidgetAmimation> {
  bool istrue = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        istrue = true;
      });
    });
  }

  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: istrue ? 0 : 1,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          height:  100,
          width: sizes.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/caribounilogo2.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondWidgetAnimation extends StatefulWidget {
  const SecondWidgetAnimation({super.key});

  @override
  State<SecondWidgetAnimation> createState() => _SecondWidgetAnimationState();
}

class _SecondWidgetAnimationState extends State<SecondWidgetAnimation> {
  bool istrue = false;
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      setState(() {
        istrue = true;
      });
    });
  }

  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return AnimatedOpacity(
      opacity: istrue ? 0 : 1,
      curve: Curves.easeInOut,
      duration: Duration(milliseconds: 1000),
      child: Center(
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 80,
          ),
          height: 100,
          width: sizes.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/caribounilogo1.png',
              ),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

class ThirdWidgetAnimation extends StatefulWidget {
  const ThirdWidgetAnimation({super.key});

  @override
  State<ThirdWidgetAnimation> createState() => _ThirdWidgetAnimationState();
}

class _ThirdWidgetAnimationState extends State<ThirdWidgetAnimation>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;

  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 2000),
    );
    animation = CurvedAnimation(
      parent: animationController!,
      curve: Curves.easeInToLinear,
    );
    Timer(
      Duration(seconds: 3),
      () {
        setState(
          () {
            animationController!.forward();
          },
        );
      },
    );
  }

  final Duration initialDelay = Duration(seconds: 1);
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircularRevealAnimation(
          child: Container(
            height: sizes.height,
            width: sizes.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('assets/images/Rectangle_41.png'),
                  fit: BoxFit.cover),
            
            ),
            child: DelayedDisplay(
              delay: Duration(seconds: initialDelay.inSeconds + 4),
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 80),
                height: sizes.height - 700,
                width: sizes.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                      'assets/images/Layer_1.png',
                    ),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          animation: animation!,
          centerAlignment: Alignment.center,
        ),
      ],
    );
  }
}
