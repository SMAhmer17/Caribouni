// ignore_for_file: unused_local_variable, prefer_const_constructors, avoid_unnecessary_containers, depend_on_referenced_packages, import_of_legacy_library_into_null_safe, unnecessary_brace_in_string_interps, unnecessary_string_interpolations, prefer_const_literals_to_create_immutables, deprecated_member_use, annotate_overrides, sized_box_for_whitespace

import 'package:caribouni/screens/auth_screens/otp_screen.dart';
import 'package:country_calling_code_picker/picker.dart';
import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ContactScreen extends StatefulWidget {
  const ContactScreen({super.key});

  @override
  State<ContactScreen> createState() => _ContactScreenState();
}

class _ContactScreenState extends State<ContactScreen> {
  Country? _selectedCountry;
  TextEditingController contactnumber = TextEditingController();

  @override
  void initState() {
    initCountry();
    super.initState();
  }

  void initCountry() async {
    final country = await getDefaultCountry(context);
    setState(() {
      _selectedCountry = country;
    });
  }

  Widget build(BuildContext context) {
    final country = _selectedCountry;
    final sizes = MediaQuery.of(context).size;
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
                      child: Container(margin: EdgeInsets.only(bottom: 2.h),
                        child: Text(
                          'Enter your mobile number',
                          style: GoogleFonts.roboto(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.6.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 5.h,
                      ),
                      child: Row(
                        children: [
                          country == null
                              ? CircularProgressIndicator()
                              : GestureDetector(
                                  onTap: _onPressedShowBottomSheet,
                                  child: Container(
                                    height: 6.h,
                                    alignment: Alignment.center,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 1.5.w),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0XFFDDDDDD),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 3.5.h,
                                          width: 3.5.h,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            image: DecorationImage(
                                              image: AssetImage(
                                                country.flag,
                                                package: countryCodePackageName,
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.5.w),
                                          color: Colors.grey.shade500,
                                          width: 1,
                                          height: 5.5.h,
                                        ),
                                        Container(
                                          padding: EdgeInsets.all(2),
                                          decoration: BoxDecoration(
                                            color: Colors.black,
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.keyboard_arrow_down_rounded,
                                            color: Colors.white,
                                            size: 19,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Container(
                            height: 6.h,
                            width: 60.w,
                            alignment: Alignment.center,
                            padding: EdgeInsets.symmetric(
                              horizontal: 3.w,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Color(0XFFDDDDDD),
                            ),
                            child: FittedBox(
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    country!.callingCode.toString(),
                                    style: GoogleFonts.roboto(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2.w,
                                  ),
                                  Container(
                                    width: 50.w,
                                    height: 6.h,
                                    child: TextFormField(
                                      controller: contactnumber,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.all(0),
                                        hintText: 'Enter Phone Number',
                                        hintStyle: GoogleFonts.roboto(
                                          color: Colors.grey.shade500,
                                        ),
                                        border: InputBorder.none,
                                        errorBorder: InputBorder.none,
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        disabledBorder: InputBorder.none,
                                        focusedErrorBorder: InputBorder.none,
                                      ),
                                      keyboardType: TextInputType.number,
                                      validator: (val) {
                                        if (contactnumber.value.text.isEmpty) {
                                          return "Empty Field";
                                        }
                                        return val;
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 2.5.h,
                    ),
                     
                    Container(
                      width: 500,
                      height:
                          //  50,
                          6.h,
                      margin: EdgeInsets.only(
                        bottom: 20,
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFB37A2B),
                            Color(0xFFF8DA68),
                          ],
                        ),
                        borderRadius: BorderRadius.circular(
                          40,
                        ),
                      ),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                        ),
                        child: Text(
                          "Continue",
                          style: GoogleFonts.roboto(
                              color: Colors.white, fontSize: 18.sp),
                        ),
                        onPressed:  () {
                                RouteTransition(
                                    context: context,
                                    child: OTPScreen(
                                      contactnumber: contactnumber.value.text,
                                      code: country.callingCode,
                                    ),
                                    animation: AnimationType.fadeIn,
                                    duration: const Duration(milliseconds: 500),
                                    repacement: true);
                              },
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
                              // By creating an account or signing you agree to our Terms and Conditions and Privacy Policy
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
                            ]),
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
  }

  void _onPressedShowBottomSheet() async {
    final country = await showCountryPickerSheet(context,
        title: Text(
          'Select Country',
          style:
              GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 16.sp),
        ));
    if (country != null) {
      setState(() {
        _selectedCountry = country;
      });
    }
  }
}
