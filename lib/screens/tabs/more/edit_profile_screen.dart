// ignore_for_file: prefer_const_constructors, sort_child_properties_last, sized_box_for_whitespace

import 'dart:io';
import 'dart:ui';

import 'package:caribouni/screens/main_home_screen.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../utils/utils.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  bool forusername = false;
  bool forcontact = false;
  bool forpass = false;
  File? image;

  void selectImage() async {
    image = await pickImageFromGallery(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: sizes.height,
        width: sizes.width,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/2023-02-21.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 6.h,
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  image == null
                      ? Container(
                          height: 16.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/Photo Profile.png',
                                ),
                                fit: BoxFit.contain),
                          ),
                        )
                      : Container(
                          height: 16.h,
                          width: 45.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                            image: DecorationImage(
                                image: FileImage(image!), fit: BoxFit.cover),
                          ),
                        ),
                  Positioned(
                    top: 1.h,
                    left: 27.w,
                    child: IconButton(
                      onPressed: selectImage,
                      icon: Container(
                        height: 5.h,
                        width: 11.w,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: ClipRect(
                          child: BackdropFilter(
                            filter: ImageFilter.blur(
                              sigmaX: 10.0,
                              sigmaY: 10.0,
                              
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.shade200.withOpacity(0.5),
                              ),
                              child: FaIcon(
                                FontAwesomeIcons.penToSquare,
                                size: 20,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: sizes.width,
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.symmetric(
                      horizontal: 5.w,
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 2.h,
                        ),
                        IconButton(
                          onPressed: () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: MainHomeScreen(
                                  index: 3,
                                ),
                                withNavBar: false);
                          },
                          icon: Container(
                            height: 7.h,
                            width: 10.w,
                            decoration: BoxDecoration(
                              color: Color(
                                0XFFDDDDDD,
                              ),
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.arrow_back_ios_new_rounded,
                              color: Color(0XFFC68716),
                              size: 24,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              Text(
                'Edit Profile',
                style: GoogleFonts.roboto(
                    color: Color(0XFF712B8F),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.w800),
              ),
              TextButton(
                onPressed: () {},
                child: Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 3.w, vertical: 0.5.h),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(
                      color: Colors.red,
                      width: 2,
                    ),
                  ),
                  child: Text(
                    'Delete Account',
                    style: GoogleFonts.roboto(
                        color: Colors.red,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 8.h,
                width: sizes.width,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                alignment: Alignment.center,
                child: Material(
                  child: ListTile(
                    trailing: forusername == false
                        ? IconButton(
                            onPressed: () {
                              setState(() {
                                forusername = !forusername;
                              });
                            },
                            icon: Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Colors.black,
                            ))
                        : Container(
                            width: 20.w,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.penToSquare,
                                  size: 20,
                                  color: Color(0XFFC68716),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      forusername = !forusername;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          ),
                    title: forusername == false
                        ? Text(
                            textAlign: TextAlign.left,
                            'Username ',
                            style: GoogleFonts.roboto(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                            ),
                          )
                        : DelayedDisplay(
                            delay: Duration(milliseconds: 0),
                            child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  text: 'Name ',
                                  style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 18.sp),
                                  children: [
                                    TextSpan(
                                      text: "Username ",
                                      style: GoogleFonts.roboto(
                                          color: Color(0XFFC68716),
                                          fontWeight: FontWeight.w700,
                                          fontSize: 18.sp),
                                    ),
                                  ]),
                            ),
                          ),
                  ),
                  elevation: 2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                height: forusername ? 0 : 8.h,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color: forusername
                            ? Colors.transparent
                            : Color(0XFFDDDDDD),
                      ),
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Name',
                      suffixIcon: Container(
                        height: 1.h,
                        width: 3.w,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.penToSquare,
                          color: forusername ? Colors.transparent : Colors.grey,
                          size: 20,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      labelStyle: GoogleFonts.roboto(
                          color: Color(0XFF707070),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 200,
                ),
                curve: Curves.fastOutSlowIn,
                height: forusername ? 0 : 7.h,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: sizes.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    padding: EdgeInsets.symmetric(
                      vertical: 1.2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                        color: Color(0XFFC68716),
                      ),
                    ),
                    child: Text(
                      'Update Name',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFC68716),
                      ),
                    ),
                  ),
                ),
              ),
              //
              //
              //
              //
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 8.h,
                width: sizes.width,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                alignment: Alignment.center,
                child: Material(
                  child: ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            forcontact = !forcontact;
                          });
                        },
                        icon: forcontact
                            ? Icon(
                                Icons.keyboard_arrow_up_rounded,
                                color: Colors.black,
                              )
                            : Icon(
                                Icons.keyboard_arrow_down_rounded,
                                color: Colors.black,
                              ),
                      ),
                      title: Text(
                        textAlign: TextAlign.left,
                        'Mobile number ',
                        style: GoogleFonts.roboto(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                        ),
                      )),
                  elevation: 2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                height: forcontact ? 0 : 8.h,
                child: Container(
                  alignment: Alignment.bottomCenter,
                  margin: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        width: 1.5,
                        color:
                            forcontact ? Colors.transparent : Color(0XFFDDDDDD),
                      ),
                    ),
                  ),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: '+971 1111111111',
                      suffixIcon: Container(
                        height: 1.h,
                        width: 3.w,
                        alignment: Alignment.center,
                        child: FaIcon(
                          FontAwesomeIcons.penToSquare,
                          color: forcontact ? Colors.transparent : Colors.grey,
                          size: 20,
                        ),
                      ),
                      contentPadding: EdgeInsets.all(0),
                      labelStyle: GoogleFonts.roboto(
                          color: Color(0XFF707070),
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                      focusedBorder: InputBorder.none,
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 200,
                ),
                curve: Curves.fastOutSlowIn,
                height: forcontact ? 0 : 7.h,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: sizes.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    padding: EdgeInsets.symmetric(
                      vertical: 1.2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                        color: Color(0XFFC68716),
                      ),
                    ),
                    child: Text(
                      'Send Verification OTP',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFC68716),
                      ),
                    ),
                  ),
                ),
              ),
              //
              //

              //
              //
              //
              SizedBox(
                height: 2.h,
              ),
              Container(
                height: 8.h,
                width: sizes.width,
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                alignment: Alignment.center,
                child: Material(
                  child: ListTile(
                    trailing: IconButton(
                      onPressed: () {
                        setState(() {
                          forpass = !forpass;
                        });
                      },
                      icon: forpass
                          ? Icon(
                              Icons.keyboard_arrow_up_rounded,
                              color: Colors.black,
                            )
                          : Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: Colors.black,
                            ),
                    ),
                    title: Text(
                      textAlign: TextAlign.left,
                      'Change password',
                      style: GoogleFonts.roboto(
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  elevation: 2,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
              ),
              AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                curve: Curves.ease,
                height: forpass ? 0 : 20.h,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.5,
                              color: forpass
                                  ? Colors.transparent
                                  : Color(0XFFDDDDDD),
                            ),
                          ),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Current password',
                            contentPadding: EdgeInsets.all(0),
                            labelStyle: GoogleFonts.roboto(
                                color: Color(0XFF707070),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.5,
                              color: forpass
                                  ? Colors.transparent
                                  : Color(0XFFDDDDDD),
                            ),
                          ),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'New password',
                            suffixIcon: Container(
                              height: 1.h,
                              width: 3.w,
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.penToSquare,
                                color:
                                    forpass ? Colors.transparent : Colors.grey,
                                size: 20,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(0),
                            labelStyle: GoogleFonts.roboto(
                                color: Color(0XFF707070),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: EdgeInsets.symmetric(
                          horizontal: 5.w,
                        ),
                        padding: EdgeInsets.symmetric(
                          horizontal: 3.w,
                        ),
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.5,
                              color: forpass
                                  ? Colors.transparent
                                  : Color(0XFFDDDDDD),
                            ),
                          ),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Re-type new password',
                            suffixIcon: Container(
                              height: 1.h,
                              width: 3.w,
                              alignment: Alignment.center,
                              child: FaIcon(
                                FontAwesomeIcons.penToSquare,
                                color:
                                    forpass ? Colors.transparent : Colors.grey,
                                size: 20,
                              ),
                            ),
                            contentPadding: EdgeInsets.all(0),
                            labelStyle: GoogleFonts.roboto(
                                color: Color(0XFF707070),
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600),
                            focusedBorder: InputBorder.none,
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              AnimatedContainer(
                duration: Duration(
                  milliseconds: 200,
                ),
                curve: Curves.fastOutSlowIn,
                height: forpass ? 0 : 7.h,
                child: TextButton(
                  onPressed: () {},
                  child: Container(
                    width: sizes.width,
                    alignment: Alignment.center,
                    margin: EdgeInsets.symmetric(horizontal: 5.w),
                    padding: EdgeInsets.symmetric(
                      vertical: 1.2.h,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border: Border.all(
                        width: 2,
                        color: Color(0XFFC68716),
                      ),
                    ),
                    child: Text(
                      'Update',
                      style: GoogleFonts.roboto(
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFC68716),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 4.h,
              ),
              Container(
                width: sizes.width,
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
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
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
