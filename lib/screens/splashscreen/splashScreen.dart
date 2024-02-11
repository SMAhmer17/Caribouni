// ignore_for_file: depend_on_referenced_packages, file_names, prefer_const_constructors, annotate_overrides, unused_import

import 'dart:async';
import 'package:caribouni/screens/splashscreen/animation_controller.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spring/spring.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: sizes.height,
        alignment: Alignment.center,
        width: sizes.width,
        child: Stack(
          children: [
            ThirdWidgetAnimation(),
            
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spring.slide(
                  springController: springController,
                  slideType: SlideType.slide_in_top,
                  delay: Duration(milliseconds: 500),
                  animDuration: Duration(milliseconds: 1000),
                  curve: Curves.linearToEaseOut,
                  extend: 30,
                  withFade: true,
                  animStatus: (AnimStatus status) {},
                  child: FirstWidgetAmimation(),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Spring.slide(
                  springController: springController,
                  slideType: SlideType.slide_in_bottom,
                  delay: Duration(milliseconds: 500),
                  animDuration: Duration(milliseconds: 1000),
                  curve: Curves.linearToEaseOut,
                  extend: 30,
                  withFade: true,
                  animStatus: (AnimStatus status) {},
                  child: SecondWidgetAnimation(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
