// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:caribouni/provider/PropertyData.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Tab2 extends StatefulWidget {
  const Tab2({super.key});

  @override
  State<Tab2> createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  String feature = 'All';
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Consumer<PropertyData>(builder: (context, proper, _) {
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
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        feature = 'All';
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: feature == 'All'
                              ? Color(0XFF712B8F)
                              : Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color(0XFF712B8F),
                          )),
                      child: Text(
                        'All',
                        style: GoogleFonts.roboto(
                          color: feature == 'All'
                              ? Colors.white
                              : Color(0XFF712B8F),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      proper.withFeatures('furnished');
                      setState(() {
                        feature = 'Furnished';
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: feature == 'Furnished'
                              ? Color(0XFF712B8F)
                              : Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color(0XFF712B8F),
                          )),
                      child: Text(
                        'Furnished',
                        style: GoogleFonts.roboto(
                          color: feature == 'Furnished'
                              ? Colors.white
                              : Color(0XFF712B8F),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      proper.withFeatures('Unfurnished');
                      setState(() {
                        feature = 'Unfurnished';
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                      padding: EdgeInsets.symmetric(
                          horizontal: 4.w, vertical: 0.5.h),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: feature == 'Unfurnished'
                              ? Color(0XFF712B8F)
                              : Colors.white,
                          border: Border.all(
                            width: 1,
                            color: Color(0XFF712B8F),
                          )),
                      child: Text(
                        'Unfurnished',
                        style: GoogleFonts.roboto(
                          color: feature == 'Unfurnished'
                              ? Colors.white
                              : Color(0XFF712B8F),
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: size.height - 270,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: feature == 'All'
                    ? proper.listOfProperties.length
                    : proper.filterdlist.length,
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
                        Container(
                          height: 25.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            image: proper.listOfProperties[index].images.isEmpty
                                ? DecorationImage(
                                    image: AssetImage(
                                      'assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.p',
                                    ),
                                    fit: BoxFit.cover)
                                : DecorationImage(
                                    image: NetworkImage(
                                      proper.listOfProperties[index].images[0],
                                    ),
                                    fit: BoxFit.cover),
                            //                DecorationImage(
                            //   image: AssetImage(
                            //       'assets/images/francesca-tosolini-hCU4fimRW-c-unsplash.png'),
                            //   fit: BoxFit.cover,
                            // ),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
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
                                  feature == 'All'
                                      ? '${proper.listOfProperties[index].price}  AED'
                                      : '${proper.filterdlist[index].price}  AED',
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
                                  feature == 'All'
                                      ? proper.listOfProperties[index].title
                                      : proper.filterdlist[index].title,
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
                                  feature == 'All'
                                      ? '${proper.listOfProperties[index].address} '
                                      : '${proper.filterdlist[index].address} ',
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
                                      'assets/images/carbonuser-avatar-filled.png'),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
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
    });
  }
}
