// ignore_for_file: prefer_const_constructors, unused_local_variable, unused_import, implementation_imports, unnecessary_import, unused_field, prefer_final_fields, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, sort_child_properties_last

import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/screens/main_home_screen.dart';
import 'package:caribouni/screens/tabs/home_screen/events_screen.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spring/spring.dart';

import '../../widgets/widgets.dart';
import 'home_screen/attractions/attractions_screen.dart';
import 'home_screen/eat_and_drink_screen.dart';
import 'home_screen/real_estate_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  final SpringController springController =
      SpringController(initialAnim: Motion.play);
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: sizes.height,
          width: sizes.width,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Material(
                      elevation: 5.0,
                      child: Container(
                        height: 60.h,
                        width: sizes.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                'assets/images/Group 16436.png',
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                      height: 45.h,
                      width: sizes.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(
                            'assets/images/Header-golden.png',
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 1.5.w, vertical: 14.h),
                        alignment: Alignment.topLeft,
                        width: sizes.width,
                        child: Consumer<Authentication>(
                            builder: (context, auth, _) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset(
                                'assets/images/Group Hello.png',
                              ),
                              Text(
                                auth.currentUser!.data.name,
                                style: GoogleFonts.poppins(
                                    fontSize: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          );
                        }),
                      ),
                    ),
                    Container(
                      width: sizes.width,
                      height: 8.h,
                      child: FittedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: RealEstateScreen(),
                                );
                              },
                              child: Container(
                                height: 10.h,
                                width: 20.w,
                                // color: Colors.yellow,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Group 16071.png'),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            TextButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: AttractionScreen(),
                                    withNavBar: false);
                              },
                              child: Container(
                                height: 10.h,
                                width: 20.w,
                                // color: Colors.yellow,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Group 16072.png'),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            TextButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: EventsScreen(), withNavBar: false);
                              },
                              child: Container(
                                height: 10.h,
                                width: 27.w,
                                // color: Colors.yellow,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Group 16073.png'),
                                      fit: BoxFit.contain),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.w,
                            ),
                            TextButton(
                              onPressed: () {
                                PersistentNavBarNavigator.pushNewScreen(
                                  context,
                                  screen: EarAndDrinkScreen(),
                                );
                              },
                              child: Container(
                                height: 10.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/Icone Eat.png'),
                                      fit: BoxFit.contain),
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
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10.w),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Path 11358.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          prefixIcon:
                              Image.asset('assets/images/Group 16434.png'),
                          suffixIcon:
                              Image.asset('assets/images/prefixIcon.png'),
                          hintText: 'Explore',
                          hintStyle: GoogleFonts.roboto(
                            color: Color(0XFF707070).withOpacity(0.5),
                            fontSize: 17.sp,
                          ),
                          border: InputBorder.none,
                          errorBorder: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          focusedBorder: InputBorder.none,
                          disabledBorder: InputBorder.none,
                          focusedErrorBorder: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          CarouselSlider(
                            items: imageSliders,
                            carouselController: _controller,
                            options: CarouselOptions(
                              autoPlay: false,
                              enlargeCenterPage: false,
                              aspectRatio: 20 / 8,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  _current = index;
                                });
                              },
                            ),
                          ),
                          Container(
                            width: sizes.width,
                            height: 6.h,
                            margin: EdgeInsets.symmetric(horizontal: 5.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                _current == 0
                                    ? Container()
                                    : IconButton(
                                        onPressed: () {
                                          _controller.previousPage();
                                        },
                                        icon: Container(
                                          height: 5.h,
                                          alignment: Alignment.center,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.arrow_back_ios_rounded,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                                _current == 5
                                    ? Container()
                                    : IconButton(
                                        onPressed: () {
                                          _controller.nextPage();
                                        },
                                        icon: Container(
                                          height: 5.h,
                                          alignment: Alignment.center,
                                          width: 8.w,
                                          decoration: BoxDecoration(
                                            color:
                                                Colors.white.withOpacity(0.6),
                                            shape: BoxShape.circle,
                                          ),
                                          child: Icon(
                                            Icons.arrow_forward_ios_rounded,
                                            color: Colors.white,
                                            size: 18,
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: imgList.asMap().entries.map((entry) {
                        return GestureDetector(
                            onTap: () => _controller.animateToPage(entry.key),
                            child: Container(
                                width: 8.0,
                                height: 8.0,
                                margin: EdgeInsets.symmetric(
                                    vertical: 6, horizontal: 4.0),
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _current == entry.key
                                      ? Color(0XFF712B8F)
                                      : Colors.grey,
                                )));
                      }).toList(),
                    ),
                    ListTile(
                      title: Text(
                        'Explore property for sale ',
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
                      height: 35.h,
                      child: CarouselSlider(
                        items: withoutindicator,
                        carouselController: _controller,
                        options: CarouselOptions(
                          autoPlay: false,
                          enlargeCenterPage: false,
                          aspectRatio: 10 / 6.5,
                          onPageChanged: (index, reason) {
                            setState(
                              () {
                                _current = index;
                              },
                            );
                          },
                        ),
                      ),
                    ),
                    ListTile(
                      title: Text(
                        'Top Attractions',
                        style: GoogleFonts.roboto(
                          color: Color(0XFF712B8F),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                      subtitle: Text(
                        'Popular activities from your location',
                        style: GoogleFonts.roboto(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
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
                      height: 36.h,
                      width: sizes.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: imgList3.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Container(
                              margin: EdgeInsets.all(8.0),
                              child: Material(
                                elevation: 10,
                                borderRadius: BorderRadius.circular(20),
                                child: Container(
                                  width: 60.w,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                      image: AssetImage(imgList3[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        width: 60.w,
                                        alignment: Alignment.centerRight,
                                        child: Container(
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color:
                                                Colors.white.withOpacity(0.5),
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
                                      ),
                                      Container(
                                        width: sizes.width,
                                        alignment: Alignment.centerLeft,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 4.w, vertical: 2.h),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Burj Al Arabe',
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 0.6.h,
                                            ),
                                            Text(
                                              'View on top place',
                                              style: GoogleFonts.roboto(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            );
                          }),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Divider(
                      thickness: 4,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Container(
                      height: 25.h,
                      width: sizes.width,
                      margin:
                          EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Get Visa.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    ListTile(
                      title: Text(
                        'Event Spotlight',
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
                      height: 36.h,
                      width: sizes.width,
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: 5,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (BuildContext context, int index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    alignment: Alignment.topRight,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                                'assets/images/homeScreen/tijs-van-leur-So6YckShOVA-unsplash.png'),
                                            fit: BoxFit.cover),
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    height: 20.h,
                                    width: 70.w,
                                    child: Container(
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
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 0.5.h),
                                    child: Text(
                                      'Tomorrow at 10:00 - 12:00 AM',
                                      style: GoogleFonts.roboto(
                                        fontSize: 14,
                                        color: Colors.red,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.w, vertical: 0.5.h),
                                    child: Text(
                                      'The Romanian – Solo Exhibition',
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
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.location_on_outlined,
                                            color: Color(0XFF707070),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Text(
                                            'Vicas Art Studio',
                                            style: GoogleFonts.roboto(
                                              fontSize: 12,
                                              color: Color(0XFF707070),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    ),
                    ListTile(
                      title: Text(
                        'Explore Eat & Drink ',
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
                    SizedBox(
                      height: 1.h,
                    ),
                    CarouselSlider(
                      items: lastslider,
                      carouselController: _controller,
                      options: CarouselOptions(
                        autoPlay: false,
                        enlargeCenterPage: false,
                        aspectRatio: 20 / 8,
                        onPageChanged: (index, reason) {
                          setState(() {
                            _current = index;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Container(
                      color: Color(0XFFDDDDDD),
                      height: 25.h,
                      width: sizes.width,
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(30),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 1,
                            color: Colors.black38,
                          ),
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        child: Text(
                          'Google Ads',
                          style: GoogleFonts.roboto(
                            color: Colors.black38,
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    ListTile(
                      title: Text(
                        'Dubai Metro',
                        style: GoogleFonts.roboto(
                          color: Color(0XFF712B8F),
                          fontWeight: FontWeight.bold,
                          fontSize: 18.sp,
                        ),
                      ),
                    ),
                    Stack(alignment: Alignment.bottomCenter, children: [
                      Image.asset('assets/images/MAP.png'),
                      SizedBox(
                        width: 80.w,
                        child: DefaultButtonWidget(
                            height: 40,
                            buttonText: "PLAN METRO",
                            onPressed: () {}),
                      ),
                    ]),
                    TextButton(
                      onPressed: () {},
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Container(
                          width: 30.w,
                          decoration: BoxDecoration(
                              color: Color(0XFF712B8F),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Back to top',
                                style: GoogleFonts.roboto(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14.sp,
                                ),
                              ),
                              Icon(Icons.arrow_drop_up, color: Colors.white)
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    AppBar(
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                      centerTitle: true,
                      title: Image.asset(
                        'assets/images/Union logo.png',
                      ),
                      leading: Spring.slide(
                        springController: springController,
                        slideType: SlideType.slide_in_right,
                        delay: Duration(milliseconds: 500),
                        animDuration: Duration(milliseconds: 1000),
                        curve: Curves.linearToEaseOut,
                        extend: 30,
                        withFade: true,
                        animStatus: (AnimStatus status) {},
                        child: Image.asset(
                          'assets/images/Weather.png',
                        ),
                      ),
                      actions: [
                        Image.asset(
                          'assets/images/notification.png',
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
