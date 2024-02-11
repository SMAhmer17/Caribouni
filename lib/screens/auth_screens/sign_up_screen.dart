// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, prefer_is_not_empty, non_constant_identifier_names, annotate_overrides

import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/screens/auth_screens/sign_in_screen.dart';
import 'package:caribouni/utils/MysnackBar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

import '../../utils/app_export.dart';
import 'contact_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final Duration initialDelay = Duration(seconds: 1);
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _form = GlobalKey<FormState>();
  bool email_valid = false;
  bool pass_valid = false;
  bool isVisible = true;
  Future<void> _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    FocusManager.instance.primaryFocus!.unfocus();
    print('submit');
    try {
      final error = await Provider.of<Authentication>(context, listen: false)
          .signUp(_name.text, _email.text, _password.text);

      //     .then((value) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   print('login Done');
      // });
      if (error.contains('The email has already been taken.')) {
        MySnackBar.errorSnackbar('The email has already been taken.', context);
      }
    } catch (e) {
      // setState(() {
      //   _isLoading = false;
      // });
      MySnackBar.errorSnackbar(
          'Somthing went wrong please try again later', context);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Wrap(
        children: [
          Container(
            height: sizes.height,
            width: sizes.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/bg.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: sizes.width,
                      height: 19.h,
                      margin: EdgeInsets.symmetric(horizontal: 1.h),
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/images/logooo.png',
                        scale: 2,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        left:
                            // 20,
                            40.w,
                        right: 5.w,
                      ),
                      height: 40.h,
                      // sizes.height - 300,
                      width: sizes.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/Gulf_character-02.png',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height:
                          // sizes.height - 276,
                          72.5.h,
                      width: sizes.width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                      child: Stack(
                        children: [
                          Positioned(
                            top: 0,
                            right: 0,
                            left: 0,
                            child: Form(
                              key: _form,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 30,
                                      right: 30,
                                      top: 20,
                                      bottom: 20,
                                    ),
                                    padding: EdgeInsets.all(0),
                                    width: sizes.width,
                                    decoration: BoxDecoration(
                                      color: Color(0XFFDED6E3),
                                      // border:
                                      //     Border.all(color: Color(0XFFC68716)),
                                      borderRadius: BorderRadius.circular(40),
                                      // boxShadow: <BoxShadow>[
                                      //   BoxShadow(
                                      //     color: Colors.black54,
                                      //     blurRadius: 3.0,
                                      //   )
                                      // ],
                                    ),
                                    child: Row(
                                      children: [
                                        Expanded(
                                          child: DefaultButtonWidget(
                                              horizontal: 5,
                                              vertical: 5,
                                              height: 35,
                                              textColor: Color(0XFF574F4F),
                                              singleColor: Colors.transparent,
                                              buttonText: TextValue.logIn,
                                              textSize: 18,
                                              onPressed: () => RouteTransition(
                                                  context: context,
                                                  child: SignInScreen(),
                                                  animation:
                                                      AnimationType.fadeIn,
                                                  duration: const Duration(
                                                      seconds: 1),
                                                  repacement: true)),
                                        ),
                                        Expanded(
                                          child: DefaultButtonWidget(
                                              textSize: 18,
                                              horizontal: 5,
                                              vertical: 5,
                                              height: 35,
                                              textColor: Color(0XFFC68716),
                                              singleColor: Colors.white,
                                              buttonText: TextValue.signUp,
                                              onPressed: () {}),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: sizes.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 0),
                                    height:
                                        // 60,
                                        7.2.h,
                                    child: TextFormField(
                                      style: GoogleFonts.roboto(
                                          color: Color(0XFF707070),
                                          fontSize: 15),
                                      controller: _name,
                                      decoration: InputDecoration(
                                        suffix: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: 2.h,
                                          ),
                                        ),
                                        labelText: 'Name',
                                        contentPadding: EdgeInsets.all(0),
                                        labelStyle: GoogleFonts.roboto(
                                            color: Color(0XFF707070),
                                            fontSize: 16.sp),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter a valid name";
                                        }
                                        email_valid = true;
                                      },
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height: 0.6.h,
                                  // ),
                                  Container(
                                    width: sizes.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 0),
                                    height:
                                        // 60,
                                        7.2.h,
                                    child: TextFormField(
                                      style: GoogleFonts.roboto(
                                          color: Color(0XFF707070),
                                          fontSize: 15),
                                      controller: _email,
                                      decoration: InputDecoration(
                                        hintStyle: GoogleFonts.roboto(
                                            color: Color(0XFF707070),
                                            fontSize: 15),
                                        suffix: AnimatedContainer(
                                          duration: Duration(milliseconds: 500),
                                          child: Icon(
                                            Icons.check_circle,
                                            color: Colors.green,
                                            size: 2.h,
                                          ),
                                        ),
                                        labelText: 'Email',
                                        contentPadding: EdgeInsets.all(0),
                                        labelStyle: GoogleFonts.roboto(
                                            color: Color(0XFF707070),
                                            fontSize: 16.sp),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                      keyboardType: TextInputType.emailAddress,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Enter a valid email address";
                                        }
                                        if (!RegExp(
                                                r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$")
                                            .hasMatch(val)) {
                                          return "Enter a valid email address";
                                        }
                                        email_valid = true;
                                      },
                                    ),
                                  ),
                                  // SizedBox(
                                  //   height:
                                  //       // 10,
                                  //       0.6.h,
                                  // ),
                                  Container(
                                    width: sizes.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 0),
                                    height: 7.2.h,
                                    child: TextFormField(
                                      style: GoogleFonts.roboto(
                                          color: Color(0XFF707070),
                                          fontSize: 15),
                                      controller: _password,
                                      obscuringCharacter: '*',
                                      decoration: InputDecoration(
                                        suffix: IconButton(
                                          icon: isVisible
                                              ? Icon(
                                                  Icons.remove_red_eye_rounded,
                                                  color: Color(0XFF712B8F),
                                                )
                                              : Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: Colors.grey.shade400,
                                                ),
                                          onPressed: () {
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          },
                                        ),
                                        labelText: 'Password',
                                        contentPadding: EdgeInsets.all(0),
                                        labelStyle: GoogleFonts.roboto(
                                            color: Color(0XFF707070),
                                            fontSize: 16.sp),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                      obscureText: isVisible,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Please enter your password";
                                        }
                                        if (val.length < 6 || val.length > 12) {
                                          return "Please enter 6 to 12 character";
                                        }
                                        pass_valid = true;
                                      },
                                    ),
                                  ),
                                  SizedBox(
                                    height:
                                        // 10,
                                        1.h,
                                  ),
                                  Container(
                                    width: sizes.width,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 0),
                                    height: 7.2.h,
                                    child: TextFormField(
                                      style: GoogleFonts.roboto(
                                          color: Color(0XFF707070),
                                          fontSize: 15),
                                      obscuringCharacter: '*',
                                      decoration: InputDecoration(
                                        suffix: IconButton(
                                          icon: !isVisible
                                              ? Icon(
                                                  Icons.remove_red_eye_outlined,
                                                  color: Colors.grey.shade400,
                                                )
                                              : Icon(
                                                  Icons.remove_red_eye_rounded,
                                                  color: Color(0XFF712B8F),
                                                ),
                                          onPressed: () {
                                            setState(() {
                                              isVisible = !isVisible;
                                            });
                                          },
                                        ),
                                        labelText: 'Repeat Password',
                                        contentPadding: EdgeInsets.all(0),
                                        labelStyle: GoogleFonts.roboto(
                                            color: Color(0XFF707070),
                                            fontSize: 16.sp),
                                        border: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            width: 1,
                                            color: Color(0XFF707070)
                                                .withOpacity(0.6),
                                          ),
                                        ),
                                      ),
                                      obscureText: isVisible,
                                      validator: (val) {
                                        if (val!.isEmpty) {
                                          return "Please re-enter your password";
                                        }
                                        if (val != _password.text) {
                                          return "The confirm-password and password must match";
                                        }
                                        pass_valid = true;
                                      },
                                    ),
                                  ),
                                  DefaultButtonWidget(
                                      textSize: 16,
                                      buttonText: (TextValue.getStarted
                                              .substring(
                                                  0,
                                                  TextValue.getStarted.length -
                                                      1))
                                          .toUpperCase(),
                                      onPressed: () {
                                        _submit();
                                        // RouteTransition(
                                        //     context: context,
                                        //     child: ContactScreen(),
                                        //     animation: AnimationType.fadeIn,
                                        //     duration: const Duration(seconds: 1),
                                        //     repacement: true);
                                      }),
                                  Text(
                                    'Or Sign up with',
                                    style: GoogleFonts.roboto(
                                        color:
                                            Color(0XFF712B8F).withOpacity(0.7),
                                        fontWeight: FontWeight.w700,
                                        fontSize:
                                            // 13,
                                            16),
                                  ),
                                  SizedBox(
                                      height:

                                          //  25.0,
                                          2.h),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        height:
                                            // 45,
                                            6.h,
                                        width:
                                            // 45,
                                            12.3.w,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: Image.asset(
                                            'assets/images/gmail.png',
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            FontAwesomeIcons.facebook,
                                            color: Color(0XFF039be5),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: 30.0,
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            width: 1.5,
                                            color: Colors.grey.shade300,
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            FontAwesomeIcons.apple,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 1.2.w,
                                        vertical:
                                            // 25,
                                            2.h),
                                    width: sizes.width,
                                    child: RichText(
                                      textAlign: TextAlign.center,
                                      text: TextSpan(
                                          text:
                                              "By creating an account or signing you agree to our\n",
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFF707070),
                                            fontSize: 12,
                                          ),
                                          children: [
                                            // By creating an account or signing you agree to our Terms and Conditions and Privacy Policy
                                            TextSpan(
                                              text: "Terms and Conditions ",
                                              style: GoogleFonts.roboto(
                                                  color: Color(0XFF712B8F),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            TextSpan(
                                              text: "and ",
                                              style: GoogleFonts.roboto(
                                                color: Color(0XFF707070),
                                                fontSize: 12,
                                              ),
                                            ),
                                            TextSpan(
                                              text: "Privacy Policy",
                                              style: GoogleFonts.roboto(
                                                  color: Color(0XFF712B8F),
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                          ]),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                // Column(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   crossAxisAlignment: CrossAxisAlignment.start,
                //   children: [
                //     GestureDetector(
                //       onTap: () {
                //         RouteTransition(
                //             context: context,
                //             child: SignInScreen(),
                //             animation: AnimationType.fadeIn,
                //             duration: const Duration(seconds: 1),
                //             repacement: true);
                //       },
                //       child: Container(
                //         alignment: Alignment.center,
                //         margin: EdgeInsets.symmetric(
                //             horizontal: 3.w, vertical: 16.h),
                //         height: 4.5.h,
                //         width: 15.w,
                //         decoration: BoxDecoration(
                //           shape: BoxShape.circle,
                //           color: Colors.white.withOpacity(
                //             0.5,
                //           ),
                //         ),
                //         child: Icon(
                //           Icons.arrow_back_ios_new_rounded,
                //           color: Color(0XFF712B8F),
                //         ),
                //       ),
                //     ),
                //   ],
                // )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
