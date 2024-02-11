// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

void dialogueBox(context) {
  final size = MediaQuery.of(context).size;

  showDialog(
    context: context,
    builder: (ctx) => AlertDialog(
      contentPadding: EdgeInsets.all(1),
      backgroundColor: Colors.transparent,
      content: Container(
        height: 40.h,
        width: size.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Rectangle_471.png'),
            fit: BoxFit.contain,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 12.h,
              width: size.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/Group_16107.png'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
            SizedBox(
              height: 3.h,
            ),
            Text('Congratulations!',
                style: GoogleFonts.roboto(
                  color: Color(0XFF712B8F),
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: 1.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 1.h,
                horizontal: 4.w,
              ),
              child: Text(
                'Your account has been verified successfully',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

List imgList = [
  'assets/images/homeScreen/jay-wennington-N_Y88TWmGwA-unsplash.png',
  'assets/images/homeScreen/1310x814.png',
  'assets/images/homeScreen/Dubai-Marina.png',
  'assets/images/homeScreen/download.png',
  'assets/images/homeScreen/anthony-delanoix-hzgs56Ze49s-unsplash.png',
];
List imgList2 = [
  'assets/images/homeScreen/154895324618404506245c53269e29dd2.png',
  'assets/images/homeScreen/chastity-cortijo-R-w5Q-4Mqm0-unsplash.png',
  'assets/images/homeScreen/david-rodrigo-Fr6zexbmjmc-unsplash',
  'assets/images/homeScreen/francesca-tosolini-hCU4fimRW-c-unsplash.png',
  'assets/images/homeScreen/real-estate-market-uae-283290920.png'
];
List imgList3 = [
  'assets/images/homeScreen/topattraction/christoph-schulz-7tb-b37yHx4-unsplash.png',
  'assets/images/homeScreen/topattraction/christoph-schulz-7tb-b37yHx4-unsplash1.png',
  'assets/images/homeScreen/topattraction/Group 16084.png',
  'assets/images/homeScreen/topattraction/christoph-schulz-7tb-b37yHx4-unsplash.png',
  'assets/images/homeScreen/topattraction/christoph-schulz-7tb-b37yHx4-unsplash1.png',
  'assets/images/homeScreen/topattraction/Group 16084.png',
];
List textOpt = [
  'All',
  'Music',
  'Art',
  'Exhibitions',
  'Show',
];
final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: EdgeInsets.symmetric(horizontal: 1.w),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: [
                  Image.asset(item, fit: BoxFit.cover, width: 300.w),
                ],
              )),
        ))
    .toList();

final List<Widget> withoutindicator = imgList2
    .map(
      (item) => Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              alignment: Alignment.topRight,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(
                      item,
                    ),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              height: 20.h,
              width: 70.w,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white.withOpacity(0.5),
                ),
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
                child: Icon(
                  Icons.favorite_border,
                  color: Color(0XFF707070),
                  size: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 1.h),
              child: Text(
                '3 BHK at Jumeirah lake Tower',
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Container(
              width: 70.w,
              child: Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 5.w,
                ),
                child: Text(
                  'Luxury Furnishing | Near Metro | Ready to Move in',
                  style: GoogleFonts.roboto(
                    fontSize: 12,
                    color: Color(0XFF707070),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    )
    .toList();
final List<Widget> lastslider = imgList
    .map((item) => Container(
          margin: EdgeInsets.symmetric(horizontal: 1.w),
          child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
              child: Stack(
                children: [
                  Image.asset(item, fit: BoxFit.cover, width: 300.w),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.5),
                        ),
                        padding: EdgeInsets.all(2),
                        margin: EdgeInsets.symmetric(
                            vertical: 1.h, horizontal: 2.w),
                        child: Icon(
                          Icons.favorite_border,
                          color: Color(0XFF712B8F),
                          size: 20,
                        ),
                      ),
                      Image.asset('assets/images/Rectangle 485.png',
                          fit: BoxFit.contain, width: 300.w),
                    ],
                  )
                ],
              )),
        ))
    .toList();

List img = [
  'assets/images/Rectangle.png',
  'assets/images/img_add.png',
  'assets/images/Rectangle empty 3.png',
  'assets/images/Rectangle empty 3.png',
  'assets/images/Rectangle empty 3.png',
];

final List<String> list1 = [
  'Rent property',
  'Rent room',
];
final List<String> list2 = [
  'Apartment',
  'Villa',
  'Commercial',
];
final List<String> list3 = [
  'Furnished',
  'Unfurnished',
];
final List<String> list4 = [
  'Daily',
  'Monthly',
  'Yearly',
];

class Option1 {
  final id;
  final name;

  Option1({
    this.id,
    this.name,
  });
}

class Option2 {
  final id;
  final name;

  Option2({
    this.id,
    this.name,
  });
}

class Option3 {
  final id;
  final name;

  Option3({
    this.id,
    this.name,
  });
}
