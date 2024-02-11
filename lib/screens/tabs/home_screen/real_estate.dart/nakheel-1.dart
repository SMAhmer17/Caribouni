// ignore_for_file: camel_case_types, prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'dart:ui';

import 'package:caribouni/screens/tabs/home_screen/real_estate.dart/nakheel-2.dart';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../widgets/custom_button.dart';

class Nakheel_1 extends StatefulWidget {
  const Nakheel_1({super.key});
// 7E0EBD
  @override
  State<Nakheel_1> createState() => _Nakheel_1State();
}

class _Nakheel_1State extends State<Nakheel_1> {
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
            image: AssetImage('assets/images/real-estate-market-uae.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          color: Colors.white.withOpacity(0.8),
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Container(
                  height: size.height + 50,
                  width: size.width,
                  child: ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(
                        sigmaX: 10.0,
                        sigmaY: 10.0,
                      ),
                      child: Container(),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      height: 16.h,
                      width: size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/images/nakheel-properties-logo2.png'),
                        ),
                      ),
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
                        'Come home to the exceptional every day at the Palm Beach Towers, with a wide range of world-class amenities that are tailored to complement your life, the way you want to live it',
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
                        color: Colors.white.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Container(
                        width: size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 2.h),
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
                                  color: Colors.black,
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
                                              color: Color(0XFF574F4F),
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
                                              color: Color(0XFF574F4F),
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
                                              color: Color(0XFF574F4F),
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
                                              color: Color(0XFF574F4F),
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
                                              color: Color(0XFF574F4F),
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
                                              color: Color(0XFF574F4F),
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
                                              color: Color(0XFF574F4F),
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
                                              color: Color(0XFF574F4F),
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
                      padding: EdgeInsets.only(left: 15, bottom: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Why We Like It',
                        style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          color: Color(0XFF712B8F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dubai Islands will redefine the concept of waterfront living. Comprised of five islands with a total area of 17 square kilometres, Dubai Islands will enhance the wellbeing and lifestyles of residents and visitors. Each island will have its own unique offerings, with innovative living experiences, cultural hubs, recreational sport beaches and beach clubs – all in one interconnected location within easy access of the city and airport.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    Container(
                      width: size.width,
                      height: 35.h,
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: img.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                              margin: EdgeInsets.symmetric(horizontal: 6.w),
                              width: 65.w,
                              height: 20.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    height: 20.h,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(img[index]),
                                        fit: BoxFit.cover,
                                      ),
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 8.w, vertical: 2.h),
                                    child: Wrap(
                                      children: [
                                        FittedBox(
                                            child: Text(
                                          'Dubai Island Project',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF712B8F),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18.sp,
                                          ),
                                        )),
                                        SizedBox(
                                          height: 4.h,
                                        ),
                                        Material(
                                          color: Colors.transparent,
                                          child: CustomButton(
                                            width: double.infinity,
                                            child: FittedBox(
                                              child: Text(
                                                "Discover more...",
                                                style: GoogleFonts.roboto(
                                                  fontSize: 17.sp,
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ),
                                            onPressed: index == 0
                                                ? () {
                                                    RouteTransition(
                                                        context: context,
                                                        child: Nakheel_2(),
                                                        animation: AnimationType
                                                            .fadeIn,
                                                        duration: Duration(
                                                            milliseconds: 500),
                                                        repacement: true);
                                                  }
                                                : () {},
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ));
                        },
                      ),
                    ),
                    SizedBox(
                      height: 3.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, bottom: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Payment plan',
                        style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          color: Color(0XFF712B8F),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15, bottom: 15, right: 15),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Dubai Islands will redefine the concept of waterfront living. Comprised of five islands with a total area of 17 square kilometres, Dubai Islands will enhance the wellbeing and lifestyles of residents and visitors. Each island will have its own unique offerings, with innovative living experiences, cultural hubs, recreational sport beaches and beach clubs – all in one interconnected location within easy access of the city and airport.',
                        textAlign: TextAlign.justify,
                        style: GoogleFonts.roboto(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 60,
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List img = [
    'assets/images/img.png',
    'assets/images/img3.png',
    'assets/images/img.png',
    'assets/images/img3.png',
  ];
}
