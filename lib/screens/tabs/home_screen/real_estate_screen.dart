// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, avoid_unnecessary_containers, unused_import

import 'package:caribouni/provider/PropertyData.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale.dart';
import 'package:caribouni/screens/tabs/home_screen/real_estate.dart/nakheel-1.dart';
import 'package:caribouni/widgets/PropertyTile.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widgets/widgets.dart';
import 'attractions/attractions_screen.dart';

class RealEstateScreen extends StatefulWidget {
  const RealEstateScreen({super.key});

  @override
  State<RealEstateScreen> createState() => _RealEstateScreenState();
}

class _RealEstateScreenState extends State<RealEstateScreen> {
  var currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<PropertyData>(context, listen: false)
              .getAllProperties(),
          builder: (context, snap) {
            if (snap.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snap.error != null) {
              return const Center(
                child: Text('Please check your internet'),
              );
            } else {
              return Container(
                height: sizes.height,
                width: sizes.width,
                child: SingleChildScrollView(child:
                    Consumer<PropertyData>(builder: (context, proper, _) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 29.h,
                        width: sizes.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Rectangle header2.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Image.asset(
                                'assets/images/Vector Bulding.png',
                              ),
                            ),
                            //  Positioned(child: )
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 4.h,
                                ),
                                Container(
                                  // height: 6.h,
                                  width: sizes.width,
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                      'assets/images/Union logo.png'),
                                ),
                              ],
                            ),
                            Positioned(
                              bottom: 1.h,
                              left: 42.w,
                              right: 42.w,
                              child: Container(
                                alignment: Alignment.center,
                                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.black.withOpacity(0.3)),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: List.generate(
                                    5,
                                    (index) => buildDot(index, context),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              // left: 2.w,right: 3.w,
                              // top: 3.h,
                              // bottom: 3.h,
                              bottom: 0, top: 8.h, left: 7.w, right: 00.w,
                              child: Container(
                                // height: 16.h,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'easy way to find'.toUpperCase(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'a perfect'.toUpperCase(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'property'.toUpperCase(),
                                      style: GoogleFonts.roboto(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 10.h,
                        width: sizes.width,
                        margin: EdgeInsets.symmetric(horizontal: 10.w),
                        child: FittedBox(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton(
                                onPressed: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: PropertyForSale(
                                      index: 0,
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/Group 1.png',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: PropertyForSale(
                                      index: 1,
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/Group 2.png',
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                    context,
                                    screen: PropertyForSale(
                                      index: 2,
                                    ),
                                  );
                                },
                                child: Image.asset(
                                  'assets/images/Group 3.png',
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ListTile(
                        title: Text(
                          'Top Deals',
                          style: GoogleFonts.roboto(
                            color: Color(0XFF712B8F),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        subtitle: Text(
                          'Best value at our most  popular places',
                          style: GoogleFonts.roboto(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFFC68716),
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0XFFC68716),
                          size: 20,
                        ),
                      ),
                      Container(
                        height: 19.h,
                        width: sizes.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 3,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20)),
                              margin: EdgeInsets.symmetric(horizontal: 3.w),
                              width: 80.w,
                              child: Image.asset(
                                'assets/images/homeScreen/download.png',
                                fit: BoxFit.contain,
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      ListTile(
                        title: Text(
                          'Project by Company',
                          style: GoogleFonts.roboto(
                            color: Color(0XFF712B8F),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        subtitle: Text(
                          'Find the best new buildings and properties',
                          style: GoogleFonts.roboto(
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700,
                            color: Color(0XFFC68716),
                          ),
                        ),
                        trailing: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0XFFC68716),
                          size: 20,
                        ),
                      ),
                      Container(
                        height: 20.h,
                        width: sizes.width,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: list1.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: index == 2
                                  ? () {
                                      RouteTransition(
                                          context: context,
                                          child: Nakheel_1(),
                                          animation: AnimationType.fadeIn,
                                          duration: Duration(milliseconds: 200),
                                          repacement: true);
                                    }
                                  : () {},
                              child: Image.asset(
                                list1[index],
                              ),
                            );
                          },
                        ),
                      ),
                      ListTile(
                        title: Text(
                          'Property for Sale',
                          style: GoogleFonts.roboto(
                            color: Color(0XFF712B8F),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        trailing: Container(
                          width: 20.w,
                          child: FittedBox(
                            child: Row(
                              children: [
                                Text(
                                  'Show all',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFFC68716),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0XFFC68716),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 32.h,
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                                left: 14, right: 14, bottom: 10),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: proper.listOfProperties.length,
                            itemBuilder: (context, index) => Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: PropertyTile(
                                    property: proper.listOfProperties[index],
                                  ),
                                )),
                      ),
                      ListTile(
                        title: Text(
                          'Property for Rents',
                          style: GoogleFonts.roboto(
                            color: Color(0XFF712B8F),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        trailing: Container(
                          width: 20.w,
                          child: FittedBox(
                            child: Row(
                              children: [
                                Text(
                                  'Show all',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFFC68716),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0XFFC68716),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 32.h,
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                                left: 14, right: 14, bottom: 10),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: proper.listOfProperties.length,
                            itemBuilder: (context, index) => Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: PropertyTile(
                                    property: proper.listOfProperties[index],
                                  ),
                                )),
                      ),
                      ListTile(
                        title: Text(
                          'Room for Sale',
                          style: GoogleFonts.roboto(
                            color: Color(0XFF712B8F),
                            fontWeight: FontWeight.bold,
                            fontSize: 18.sp,
                          ),
                        ),
                        trailing: Container(
                          width: 20.w,
                          child: FittedBox(
                            child: Row(
                              children: [
                                Text(
                                  'Show all',
                                  style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0XFFC68716),
                                  ),
                                ),
                                Icon(
                                  Icons.arrow_forward_ios,
                                  color: Color(0XFFC68716),
                                  size: 18,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 32.h,
                        child: ListView.builder(
                            padding: EdgeInsets.only(
                                left: 14, right: 14, bottom: 10),
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: proper.listOfProperties.length,
                            itemBuilder: (context, index) => Container(
                                  padding: EdgeInsets.only(right: 10),
                                  child: PropertyTile(
                                    property: proper.listOfProperties[index],
                                  ),
                                )),
                      ),
                    ],
                  );
                })),
              );
            }
          }),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 0.7.h,
      width: 2.w,
      margin: EdgeInsets.all(1),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentIndex == index ? Color(0XFF7E0EBD) : Color(0XFFDED6E3),
      ),
    );
  }

  List list1 = [
    'assets/images/binghatti  logo.png',
    'assets/images/AZIZI logo.png',
    'assets/images/nakheel-properties-logo.png'
  ];
}
