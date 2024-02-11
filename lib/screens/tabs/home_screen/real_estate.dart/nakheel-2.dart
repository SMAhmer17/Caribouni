// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widgets/custom_button.dart';
import 'nakheel-1.dart';

class Nakheel_2 extends StatefulWidget {
  const Nakheel_2({super.key});
// 7E0EBD
  @override
  State<Nakheel_2> createState() => _Nakheel_2State();
}

class _Nakheel_2State extends State<Nakheel_2> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        alignment: Alignment.center,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/img_2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: size.height + 50,
                width: size.width,
                child: ClipRRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(
                      sigmaX: 5.0,
                      sigmaY: 5.0,
                    ),
                    child: Container(
                      color: Colors.white.withOpacity(0.1),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          RouteTransition(
                              context: context,
                              child: Nakheel_1(),
                              animation: AnimationType.fadeIn,
                              duration: Duration(milliseconds: 200),
                              repacement: true);
                        },
                        child: Container(
                          height: 4.5.h,
                          alignment: Alignment.center,
                          width: 20.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios_new_rounded,
                            color: Color(0XFF712B8F),
                            size: 23,
                          ),
                        ),
                      ),
                      Container(
                        height: 15.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/images/nakheel-properties-logo2.png'),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(
                      vertical: 2.h,
                    ),
                    width: size.width,
                    child: Text(
                      'Dubai Islands',
                      style: GoogleFonts.roboto(
                        fontSize: 22.sp,
                        color: Color(0XFF712B8F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    width: size.width,
                    child: Text(
                      'Wake up to fresh perspective',
                      style: GoogleFonts.roboto(
                        fontSize: 16.sp,
                        color: Color(0XFF574F4F),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      'Dubai Islands will redefine the concept of waterfront living. Comprised of five islands with a total area of 17 square kilometres, Dubai Islands will enhance the wellbeing and lifestyles of residents and visitors.   Each island will have its own unique offerings, with innovative living experiences, cultural hubs, recreational sport beaches and beach clubs – all in one interconnected location within easy access of the city and airport.',
                      style: GoogleFonts.roboto(
                        fontSize: 14.8.sp,
                        color: Color(0XFF574F4F),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 4.w,
                      vertical: 2.h,
                    ),
                    width: size.width,
                    // height: 18.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Container(
                      width: size.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerLeft,
                            width: size.width,
                            child: Text(
                              'Amenities',
                              style: GoogleFonts.roboto(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF9D039E),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon awesome-umbrella-beach.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Beach',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon material-local-cafe.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Cafe',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon awesome-swimming-pool.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Pool',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon map-gym.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Gym',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon awesome-tree.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Park',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon awesome-train.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Metro',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon material-spa.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Spa',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      children: [
                                        Container(
                                          width: 10.w,
                                          height: 4.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/images/Icon map-amusement-park.png',
                                              ),
                                              fit: BoxFit.contain,
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 0.6.h,
                                        ),
                                        Text(
                                          'Park',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF9D039E),
                                            fontSize: 14.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin:
                        EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                    width: size.width,
                    child: Text(
                      'Why We Like It',
                      style: GoogleFonts.roboto(
                        fontSize: 18.sp,
                        color: Color(0XFF9D039E),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(horizontal: 4.w),
                    child: Text(
                      'Dubai Islands will redefine the concept of waterfront living. Comprised of five islands with a total area of 17 square kilometres, Dubai Islands will enhance the wellbeing and lifestyles of residents and visitors.   Each island will have its own unique offerings, with innovative living experiences, cultural hubs, recreational sport beaches and beach clubs – all in one interconnected location within easy access of the city and airport.',
                      style: GoogleFonts.roboto(
                        fontSize: 14.8.sp,
                        color: Color(0XFF574F4F),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    color: Colors.white,
                    width: size.width,
                    height: 30.h,
                    padding: EdgeInsets.all(20),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 1,
                          color: Color(0XFF574F4F),
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Icon(
                        Icons.play_circle_rounded,
                        color: Colors.grey.withOpacity(0.5),
                        size: 70,
                      ),
                      // child: Center(
                      //   child: Padding(
                      //     padding: EdgeInsets.all(60),
                      //     child: Container(
                      //       decoration: BoxDecoration(
                      //           color: Colors.grey.withOpacity(0.5),
                      //           shape: BoxShape.circle,),

                      //     child: Icon(Icons.),
                      // ),
                      // ),
                      // ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    height: 50.h,
                    width: size.width,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/Path 11729.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
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
