// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_final_fields, unused_field

import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/add_rent.dart';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Tab3 extends StatefulWidget {
  const Tab3({super.key});

  @override
  State<Tab3> createState() => _Tab3State();
}

class _Tab3State extends State<Tab3> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            height: 6.h,
            width: size.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(
                width: 3,
                color: Color(0xffEBE8ED).withOpacity(0.8),
              ),
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xffEBE8ED),
                  Colors.white,
                ],
              ),
            ),
            child: TextFormField(
              scrollPadding: EdgeInsets.all(0),
              decoration: InputDecoration(
                prefixIcon: Image.asset(
                  'assets/images/Group 16097.png',
                ),
                suffixIcon: Image.asset(
                  'assets/images/filter.png',
                ),
                border: InputBorder.none,
                errorBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                hintText: 'Search property for rent',
                helperStyle: GoogleFonts.roboto(
                  color: Colors.grey.shade200,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 2.h,
          ),
          Container(
            width: size.width,
            height: 4.h,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.swap_horiz_outlined,
                  color: Colors.grey,
                  size: 26,
                ),
                SizedBox(
                  width: 4.w,
                ),
                Container(
                  width: size.width - 50,
                  child: ListView.builder(
                      itemCount: _text.length,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.symmetric(horizontal: 1.w),
                          padding: EdgeInsets.symmetric(
                              horizontal: 4.w, vertical: 0.5.h),
                          decoration: index == 0
                              ? BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Color(0XFF712B8F),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0XFF712B8F),
                                  ),
                                )
                              : BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(
                                    width: 1,
                                    color: Color(0XFF712B8F),
                                  )),
                          child: Text(
                            _text[index],
                            style: GoogleFonts.roboto(
                              color:
                                  index == 0 ? Colors.white : Color(0XFF712B8F),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        );
                      }),
                ),
              ],
            ),
          ),
          Container(
            height: size.height - 270,
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              // physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container(
                  margin: EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 20,
                  ),
                  height: 42.h,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      30,
                    ),
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Color(0xffEBE8ED),
                        Colors.white,
                      ],
                    ),
                  ),
                  child: Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          RouteTransition(
                              context: context,
                              child: AddRent(),
                              animation: AnimationType.fadeIn,
                              duration: Duration(milliseconds: 200),
                              repacement: true);
                        },
                        child: Container(
                          height: 25.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.png',
                              ),
                              fit: BoxFit.cover,
                            ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                        ),
                      ),
                      //
                      //
                      Expanded(
                          child: Container(
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 0.5.h),
                        child: FittedBox(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                '10000 AED',
                                style: GoogleFonts.roboto(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Color(0XFF712B8F),
                                ),
                              ),
                              SizedBox(
                                height: 0.8.h,
                              ),
                              Text(
                                'Property title',
                                style: GoogleFonts.roboto(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                height: 0.8.h,
                              ),
                              Text(
                                'Address and location',
                                style: GoogleFonts.roboto(
                                  fontSize: 13.sp,
                                  color: Color(0XFF574F4F),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )),
                      //
                      Container(
                        width: size.width,
                        height: 7.h,
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.w,
                        ),
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30),
                          ),
                          color: Color(0XFFDED6E3),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                    'assets/images/carbonuser-avatar-filled3.png'),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  'Owner',
                                  style: GoogleFonts.roboto(
                                    color: Color(0XFFA3A3A3),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 40.w,
                              child: FittedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 14.w,
                                      height: 6.h,
                                      child: Image.asset(
                                          'assets/images/Group 16179.png'),
                                    ),
                                    Container(
                                      width: 14.w,
                                      height: 6.h,
                                      child: Image.asset(
                                          'assets/images/Group 16180.png'),
                                    ),
                                    Container(
                                      width: 14.w,
                                      height: 6.h,
                                      child: Image.asset(
                                          'assets/images/Group 16178.png'),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
          ),
          SizedBox(
            height: 30.h,
          )
        ],
      ),
    );
  }

  List _text = ['All', 'Master Room', 'Private Room', 'Bed Space', 'Sharing'];
}
