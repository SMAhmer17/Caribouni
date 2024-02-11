// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, sort_child_properties_last, unused_import

import 'dart:async';

import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spring/spring.dart';

import 'nakheel-1.dart';

class Nakheel extends StatefulWidget {
  const Nakheel({super.key});

  @override
  State<Nakheel> createState() => _NakheelState();
}

class _NakheelState extends State<Nakheel> with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  bool istrue = false;

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
      Duration(seconds: 2),
      () {
        setState(
          () {
            animationController!.forward();
            istrue = true;
          },
        );
      },
    );
  }

  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        alignment: Alignment.center,
        width: size.width,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: size.width,
              height: 30.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                        'assets/images/nakheel-properties-logo2.png'),
                    fit: BoxFit.contain),
              ),
            ),
            istrue == true
                ? CircularRevealAnimation(
                    child:  Nakheel_1(),
                      // child: DelayedDisplay(
                      //   delay: Duration(seconds: 4),
                      //   child: Container(
                      //     margin: EdgeInsets.symmetric(horizontal: 80),
                      //     height: size.height - 700,
                      //     width: size.width,
                      //     decoration: BoxDecoration(
                      //       image: DecorationImage(
                      //         image: AssetImage(
                      //           'assets/images/Layer_1.png',
                      //         ),
                      //         fit: BoxFit.contain,
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    
                    animation: animation!,
                    centerAlignment: Alignment.center,
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
