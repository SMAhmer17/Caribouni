// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, body_might_complete_normally_nullable, prefer_is_not_empty, non_constant_identifier_names, annotate_overrides

import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/screens/NavBar.dart';
import 'package:caribouni/screens/auth_screens/sign_up_screen.dart';
import 'package:caribouni/utils/MysnackBar.dart';
import 'package:provider/provider.dart';

import '../../utils/app_export.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  TextEditingController _email = TextEditingController();
  TextEditingController _password = TextEditingController();
  final _form = GlobalKey<FormState>();
  final Duration initialDelay = Duration(seconds: 1);
  bool email_valid = false;
  bool pass_valid = false;
  bool isVisible = false;
  Future<void> _submit() async {
    final isValid = _form.currentState!.validate();
    if (!isValid) {
      return;
    }
    FocusManager.instance.primaryFocus!.unfocus();
    print('submit');
    try {
      final error = await Provider.of<Authentication>(context, listen: false)
          .login(_email.text, _password.text);

      //     .then((value) {
      //   setState(() {
      //     _isLoading = false;
      //   });
      //   print('login Done');
      // });
      if (error.contains('incorrect')) {
        MySnackBar.errorSnackbar('Email or  password is incorrect', context);
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
                image: AssetImage('assets/images/bg_golden.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              fit: StackFit.expand,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: sizes.width,
                      height: 19.h,
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/images/logooo.png',
                        scale: 2,
                      ),
                    ),
                  ],
                ),
                Positioned(
                  right: 13,
                  top: 80,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        alignment: Alignment.centerRight,
                        // margin: EdgeInsets.only(
                        //     left:
                        //         // 20,
                        //         6.w,
                        //     top: 1.8.h),
                        height: 40.h,
                        // sizes.height - 300,
                        width: sizes.width,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //     scale: 3,
                        //     image: AssetImage(
                        //       'assets/images/Group_16435.png',
                        //     ),
                        //     fit: BoxFit.contain,
                        //   ),
                        // )
                        //,
                        child: Image.asset(
                          'assets/images/Group_16435.png',
                          scale: 2,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height:
                            // sizes.height - 276,
                            68.5.h,
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
                                        // border: Border.all(
                                        //     color: Color(0XFFC68716)),
                                        borderRadius: BorderRadius.circular(40),
                                        // boxShadow: <BoxShadow>[
                                        //   BoxShadow(
                                        //     color: Colors.black54,
                                        //     blurRadius: 3.0,
                                        //   )
                                        //  ],
                                      ),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: DefaultButtonWidget(
                                                textSize: 18,
                                                horizontal: 5,
                                                vertical: 5,
                                                height: 35,
                                                textColor: Color(0XFFC68716),
                                                singleColor: Colors.white,
                                                buttonText: TextValue.logIn,
                                                onPressed: () {}),
                                          ),
                                          Expanded(
                                            child: DefaultButtonWidget(
                                                textSize: 18,
                                                horizontal: 5,
                                                vertical: 5,
                                                height: 35,
                                                textColor: Color(0XFF574F4F),
                                                singleColor: Colors.transparent,
                                                buttonText: TextValue.signUp,
                                                onPressed: () => RouteTransition(
                                                    context: context,
                                                    child: Consumer<Authentication>(
                                                        builder: (ctx, auth, _) => auth
                                                                .isAuth
                                                            ? const NavBar()
                                                            : FutureBuilder(
                                                                future: auth
                                                                    .tryAutoLogin(),
                                                                builder: (ctx,
                                                                        authResultSnapshot) =>
                                                                    authResultSnapshot.connectionState == ConnectionState.waiting
                                                                        ? const SplashScreen()
                                                                        : const SignUpScreen())),
                                                    animation:
                                                        AnimationType.fadeIn,
                                                    duration:
                                                        const Duration(seconds: 1),
                                                    repacement: true)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    // SizedBox(
                                    //     height:

                                    //         // 20,
                                    //         2.5.h),
                                    // Text(
                                    //   'Log In',
                                    //   style: GoogleFonts.roboto(
                                    //       fontSize:
                                    //           // 30,

                                    //           23.sp,
                                    //       color: Color(0XFFC68716),
                                    //       fontWeight: FontWeight.w700),
                                    // ),
                                    // SizedBox(
                                    //   height:
                                    //       // 8.0,
                                    //       1.h,
                                    // ),
                                    Container(
                                      width: sizes.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 0),
                                      height:
                                          // 60,
                                          7.5.h,
                                      child: TextFormField(
                                        style: GoogleFonts.roboto(
                                            color: Color(0XFF707070),
                                            fontSize: 15),
                                        controller: _email,
                                        decoration: InputDecoration(
                                          suffix: AnimatedContainer(
                                            duration:
                                                Duration(milliseconds: 500),
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
                                          // errorBorder: InputBorder.none,
                                        ),
                                        keyboardType:
                                            TextInputType.emailAddress,
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
                                    SizedBox(
                                      height:
                                          // 10,
                                          1.h,
                                    ),
                                    Container(
                                      width: sizes.width,
                                      margin: EdgeInsets.symmetric(
                                          horizontal: 30, vertical: 0),
                                      height: 7.5.h,
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
                                                    Icons
                                                        .remove_red_eye_rounded,
                                                    color: Color(0XFF712B8F),
                                                  )
                                                : Icon(
                                                    Icons
                                                        .remove_red_eye_outlined,
                                                    color: Color(0XFF707070),
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
                                          // errorBorder: InputBorder.none,
                                        ),
                                        obscureText: isVisible,
                                        validator: (val) {
                                          if (val!.isEmpty) {
                                            return "Please enter your password";
                                          }

                                          pass_valid = true;
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: sizes.width,
                                      alignment: Alignment.centerRight,
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 20),
                                      child: TextButton(
                                        child: Text(
                                          'Forgot Password?',
                                          style: GoogleFonts.roboto(
                                            color: Color(0XFFC68716),
                                            fontSize: 13,
                                          ),
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                    DefaultButtonWidget(
                                      textSize: 16,
                                      buttonText:
                                          TextValue.continueText.toUpperCase(),
                                      onPressed: () {
                                        _submit();
                                      },
                                    ),
                                    Text(
                                      'Or Log In Using Email',
                                      style: GoogleFonts.roboto(
                                          color: Color(0XFF712B8F)
                                              .withOpacity(0.7),
                                          fontWeight: FontWeight.w700,
                                          fontSize:
                                              // 13,
                                              16),
                                    ),
                                    SizedBox(
                                        height:

                                            //  25.0,
                                            3.h),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                                          horizontal: 10,
                                          vertical:
                                              // 25,
                                              3.h),
                                      width: sizes.width,
                                      child: RichText(
                                        text: TextSpan(
                                            text: "Don’t have an account? ",
                                            style: GoogleFonts.roboto(
                                              color: Color(0XFF200A4D),
                                              fontSize: 16,
                                            ),
                                            children: [
                                              TextSpan(
                                                recognizer: TapGestureRecognizer()
                                                  ..onTap = () => RouteTransition(
                                                      context: context,
                                                      child: Consumer<Authentication>(
                                                          builder: (ctx, auth, _) => auth
                                                                  .isAuth
                                                              ? const NavBar()
                                                              : FutureBuilder(
                                                                  future: auth
                                                                      .tryAutoLogin(),
                                                                  builder: (ctx, authResultSnapshot) => authResultSnapshot.connectionState == ConnectionState.waiting
                                                                      ? const SplashScreen()
                                                                      : const SignUpScreen())),
                                                      animation:
                                                          AnimationType.fadeIn,
                                                      duration: const Duration(
                                                          seconds: 1),
                                                      repacement: true),
                                                text: "Create Account",
                                                style: GoogleFonts.roboto(
                                                    color: Color(0XFF712B8F),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                            ]),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
