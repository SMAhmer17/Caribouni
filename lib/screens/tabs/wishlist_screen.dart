// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:caribouni/utils/app_export.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../main_home_screen.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: sizes.height,
        width: sizes.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Group 16436.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 13.h,
                  width: sizes.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30),
                        bottomRight: Radius.circular(30)),
                    image: DecorationImage(
                        image: AssetImage('assets/images/Rectangle 492.png'),
                        fit: BoxFit.cover),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 0.5.h,
                ),
                AppBar(
                  centerTitle: true,
                  title: Text(
                    'My Wishlist',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  // leading: IconButton(
                  //     onPressed: () {
                  //       PersistentNavBarNavigator.pushNewScreen(context,
                  //           screen: MainHomeScreen(
                  //             index: 3,
                  //           ),
                  //           withNavBar: false);
                  //     },
                  //     icon: Image.asset('assets/images/btn_back.png')),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: 23.h,
                  width: 60.w,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0XFFDDDDDD),
                  ),
                  child: Icon(
                    Icons.favorite_border_rounded,
                    color: Colors.white,
                    size: 80,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  'You have no wishlist at the moment',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.sp,
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  'To add a favorite, simply tap the heart on any item.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: ColorConstant.santaGrey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                // DefaultButtonWidget(
                //   width: 170,
                //   height: 40,
                //   buttonText: "Go back to explore",
                //   onPressed: () {},
                //   textSize: 16,
                //   singleColor: ColorConstant.purpleJam,
                // ),
              ],
            ),
            Column(
              children: [
                Container(
                  width: sizes.width,
                  margin: EdgeInsets.symmetric(
                    horizontal: 20.w,
                  ),
                  height: 6.h,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/Icone_Caribouni-01.png',
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
            )
          ],
        ),
      ),
    );
  }
}
