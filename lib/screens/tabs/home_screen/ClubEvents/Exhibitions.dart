// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_import, body_might_complete_normally_nullable, avoid_unnecessary_containers

import 'package:caribouni/widgets/EventTile.dart';
import 'package:caribouni/widgets/widgets.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Exhibitions extends StatefulWidget {
  const Exhibitions({super.key});

  @override
  State<Exhibitions> createState() => _ExhibitionsState();
}

class _ExhibitionsState extends State<Exhibitions> {
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Exhibitions'.toUpperCase(),
          textAlign: TextAlign.end,
          style: GoogleFonts.roboto(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Image.asset(
            'assets/images/Weather.png',
          ),
        ],
      ),
      body: Container(
          height: sizes.height,
          width: sizes.width,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 13.h,
                  width: sizes.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/Group 17520.png'),
                        fit: BoxFit.cover),
                  ),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        child: ListView.builder(
                            padding: EdgeInsets.only(top: 20),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return EventTile(
                                sizes: sizes,
                                index: index,
                                eventName: 'Exhibitions',
                              );
                            }),
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
