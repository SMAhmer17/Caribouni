// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, depend_on_referenced_packages, import_of_legacy_library_into_null_safe, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, unused_element, prefer_typing_uninitialized_variables, annotate_overrides

import 'dart:async';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:pinput/pinput.dart';
import 'package:timer_builder/timer_builder.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../widgets/widgets.dart';
import '../main_home_screen.dart';

class OTPScreen extends StatefulWidget {
  final code, contactnumber;
  const OTPScreen({super.key, this.contactnumber, this.code});

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  final smartAuth = SmartAuth();
  final pinputController = TextEditingController();
  late DateTime alert;
  @override
  void initState() {
    super.initState();
    getAppSignature();
    alert = DateTime.now().add(Duration(seconds: 30));
  }

  @override
  void dispose() {
    smartAuth.removeSmsListener();
    pinputController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return TimerBuilder.scheduled([alert], builder: (context) {
      var now = DateTime.now();
      var reached = now.compareTo(alert) >= 0;
      return Scaffold(
        body: Wrap(
          children: [
            Container(
              height: sizes.height,
              width: sizes.width,
              margin: EdgeInsets.symmetric(
                horizontal: 3.h,
              ),
              child: Stack(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: sizes.width,
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1,
                              color: Color(0XFFDDDDDD),
                            ),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              'Enter authentication code',
                              style: GoogleFonts.roboto(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              'Enter the 4-digit that we have sent via the phone number ${widget.code} ${widget.contactnumber}',
                              style: GoogleFonts.roboto(
                                color: Color(0XFF707070),
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                          ],
                        ),
                      ),
                      Pinput(
                        controller: pinputController,
                        defaultPinTheme: defaultPinTheme,
                        onCompleted: (String verificationCode) {
                          dialogueBox(context);
                          Timer(Duration(seconds: 1), () {
                            PersistentNavBarNavigator.pushNewScreen(context,
                                screen: MainHomeScreen(
                                  index: 0,
                                ),
                                withNavBar: false);
                            // RouteTransition(
                            //     context: context,
                            //     child: MainHomeScreen(),
                            //     animation: AnimationType.fadeIn,
                            //     duration: Duration(milliseconds: 500),
                            //     repacement: true);
                          });
                        },
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Container(
                        height: 6.h,
                        width: 70.w,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 1.5.w),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0XFFDDDDDD),
                        ),
                        child: FittedBox(
                          child: TimerBuilder.periodic(
                            Duration(seconds: 1),
                            alignment: Duration.zero,
                            builder: (context) {
                              var now = DateTime.now();
                              var remaining = alert.difference(now);
                              return Text(
                                reached
                                    ? "I don't receive a code (00:00)"
                                    : formatDuration(remaining),
                                textAlign: TextAlign.left,
                                style: GoogleFonts.roboto(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              );
                            },
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Re-send OTP',
                          style: GoogleFonts.roboto(
                            fontWeight: FontWeight.bold,
                            fontSize: 17.sp,
                            color: reached ? Color(0XFF712B8F) : Colors.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: sizes.width,
                        margin: EdgeInsets.symmetric(
                          horizontal: 20.w,
                        ),
                        height: 10.h,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/Icone_Caribouni-01.png',
                            ),
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.symmetric(
                            // horizontal: 1.2.w,
                            vertical:
                                // 25,
                                1.2.h),
                        width: sizes.width,
                        child: RichText(
                          textAlign: TextAlign.center,
                          text: TextSpan(
                            text:
                                "By creating an account or signing you agree to our\n",
                            style: GoogleFonts.roboto(
                              color: Color(0XFF707070),
                              fontSize: 15.sp,
                            ),
                            children: [
                              TextSpan(
                                text: "Terms and Conditions ",
                                style: GoogleFonts.roboto(
                                    color: Color(0XFF712B8F),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                              TextSpan(
                                text: "and ",
                                style: GoogleFonts.roboto(
                                  color: Color(0XFF707070),
                                  fontSize: 15.sp,
                                ),
                              ),
                              TextSpan(
                                text: "Privacy Policy",
                                style: GoogleFonts.roboto(
                                    color: Color(0XFF712B8F),
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  void getAppSignature() async {
    final res = await smartAuth.getAppSignature();
    debugPrint('Signature: $res');
  }

  String formatDuration(Duration d) {
    String f(int n) {
      return n.toString().padLeft(2, '0');
    }

    // We want to round up the remaining time to the nearest second
    d += Duration(seconds: 30);
    return "${f(d.inMinutes)}:${f(d.inSeconds % 30)}";
  }

  final defaultPinTheme = PinTheme(
    width: 12.w,
    height: 12.h,
    textStyle: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
    decoration: BoxDecoration(
        color: Color(0XFFDDDDDD),
        border: Border.all(color: Colors.grey),
        shape: BoxShape.circle),
  );
}
