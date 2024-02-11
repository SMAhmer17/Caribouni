// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:caribouni/provider/PropertyData.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/details_ad_rent.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class Tab1 extends StatefulWidget {
  const Tab1({super.key});

  @override
  State<Tab1> createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
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
                  hintText: 'Search property for sale',
                  helperStyle: GoogleFonts.roboto(
                    color: Colors.grey.shade200,
                  ),
                ),
              ),
            ),
            Container(
              height: size.height - 235,
              child: ListView.builder(
                padding: EdgeInsets.only(bottom: 40),
                shrinkWrap: false,
                itemCount: proper.listOfProperties.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 20,
                    ),
                    height: 40.h,
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
                    child: GestureDetector(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: DetailsAdRent(), withNavBar: false);
                      },
                      child: Column(
                        children: [
                          Container(
                            height: 25.h,
                            width: size.width,
                            decoration: BoxDecoration(
                              image:
                                  proper.listOfProperties[index].images.isEmpty
                                      ? DecorationImage(
                                          image: AssetImage(
                                            'assets/images/im3rd-media-CbZ4EDP__VQ-unsplash.png',
                                          ),
                                          fit: BoxFit.cover)
                                      : DecorationImage(
                                          image: NetworkImage(
                                            proper.listOfProperties[index]
                                                .images[0],
                                          ),
                                          fit: BoxFit.cover),
                              //  DecorationImage(
                              //           image: AssetImage(
                              //               'assets/images/im3rd-media-CbZ4EDP__VQ-unsplash.png'),
                              //           fit: BoxFit.cover,
                              //         ),
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
                              horizontal: 2.w,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '${proper.listOfProperties[index].title} | ${proper.listOfProperties[index].address} | PRIME LOCATION',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w700,
                                    color: Colors.black,
                                  ),
                                ),
                                SizedBox(
                                  height: 0.8.h,
                                ),
                                Text(
                                  '${proper.listOfProperties[index].features} • ${proper.listOfProperties[index].category} • ${proper.listOfProperties[index].purpose} ',
                                  textAlign: TextAlign.left,
                                  style: GoogleFonts.roboto(
                                    fontSize: 15.sp,
                                    color: Color(0XFFC68716),
                                  ),
                                ),
                              ],
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
                              gradient: LinearGradient(
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                                colors: [
                                  Color(0XFFB37A2B),
                                  Color(0XFFF8DA68),
                                ],
                              ),
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
                                        'assets/images/Group 16226.png'),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Text(
                                      'Agent',
                                      style: GoogleFonts.roboto(
                                        color: Color(0XFFDED6E3),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    // TextButton(
                                    //   onPressed: () {},
                                    //   child:
                                    Container(
                                      height: 4.5.h,
                                      alignment: Alignment.center,
                                      width: 22.2.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0XFF712B8F),
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0XFF712B8F),
                                          )),
                                      child: FittedBox(
                                        child: Text(
                                          'Call'.toUpperCase(),
                                          style: GoogleFonts.roboto(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    // ),
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    // TextButton(
                                    //   onPressed: () {},
                                    //   child:
                                    Container(
                                      height: 4.5.h,
                                      alignment: Alignment.center,
                                      width: 22.2.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(
                                            width: 2,
                                            color: Color(0XFF712B8F),
                                          )),
                                      child: FittedBox(
                                        child: Text(
                                          'Email'.toUpperCase(),
                                          style: GoogleFonts.roboto(
                                              color: Color(0XFF712B8F),
                                              fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                    ),
                                    // ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
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
