// ignore_for_file: unused_local_variable, prefer_const_constructors, use_full_hex_values_for_flutter_colors

import 'package:caribouni/provider/FoodData.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../widgets/widgets.dart';

class EarAndDrinkScreen extends StatefulWidget {
  const EarAndDrinkScreen({super.key});

  @override
  State<EarAndDrinkScreen> createState() => _EarAndDrinkScreenState();
}

class _EarAndDrinkScreenState extends State<EarAndDrinkScreen> {
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<FoodData>(context, listen: false).getAllFood(),
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
              return Consumer<FoodData>(builder: (context, food, _) {
                return Container(
                  height: size.height,
                  width: size.width,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Stack(
                          children: [
                            Container(
                              height: 20.h,
                              padding: EdgeInsets.symmetric(horizontal: 13),
                              width: size.width,
                              alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                  image: AssetImage(
                                    'assets/images/Rectangle header2.png',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Text(
                                'Eat & Drink',
                                style: GoogleFonts.roboto(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 23.sp,
                                  color: Colors.white.withOpacity(0.5),
                                ),
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 3.6.h,
                                ),
                                Container(
                                    height: 20.h,
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 10),
                                    width: size.width,
                                    alignment: Alignment.bottomRight,
                                    child: Image.asset(
                                        'assets/images/Gulf_character-02.png')),
                              ],
                            ),
                          ],
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
                                    _current = index;
                                  },
                                ),
                              ),
                              Container(
                                width: size.width,
                                height: 6.h,
                                margin: EdgeInsets.symmetric(horizontal: 5.w),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                                color: Colors.white
                                                    .withOpacity(0.6),
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
                                                color: Colors.white
                                                    .withOpacity(0.6),
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
                                onTap: () =>
                                    _controller.animateToPage(entry.key),
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
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          height: 15.h,
                          width: size.width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            itemCount: 5,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.all(5),
                                width: 30.w,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/images/homeScreen/jay-wennington-N_Y88TWmGwA-unsplash.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  color: Colors.grey.withOpacity(0.8),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          width: size.width - 180,
                          margin: EdgeInsets.symmetric(
                              horizontal: 5.w, vertical: 3.h),
                          child: Container(
                            height: 2.5.h,
                            decoration: BoxDecoration(
                              color: Color(0XFFDED6E3),
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40.h,
                          width: size.width,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: food.listOfFood.length,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (BuildContext context, int index) {
                                return Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            alignment: Alignment.topRight,
                                            decoration: BoxDecoration(
                                                image: food.listOfFood[index]
                                                        .images.isEmpty
                                                    ? DecorationImage(
                                                        image: AssetImage(
                                                          'assets/images/im3rd-media-CbZ4EDP__VQ-unsplash.png',
                                                        ),
                                                        fit: BoxFit.cover)
                                                    : DecorationImage(
                                                        image: NetworkImage(
                                                          food.listOfFood[index]
                                                              .images[0],
                                                        ),
                                                        fit: BoxFit.cover),
                                                //  DecorationImage(
                                                //           image: AssetImage(
                                                //               'assets/images/pablo-merchan-montes-Orz90t6o0e4-unsplash.png'),
                                                //           fit: BoxFit.cover),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            height: 20.h,
                                            width: size.width,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: Colors.white
                                                    .withOpacity(0.5),
                                              ),
                                              padding: EdgeInsets.all(2),
                                              margin: EdgeInsets.symmetric(
                                                  vertical: 1.h,
                                                  horizontal: 2.w),
                                              child: Icon(
                                                Icons.favorite_border,
                                                color: Color(0XFF712B8F),
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 0.5.h),
                                            child: Text(
                                              food.listOfFood[index].title,
                                              style: GoogleFonts.roboto(
                                                  fontSize: 17.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0XFF712B8F)),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                              horizontal: 5.w,
                                            ),
                                            child: Text(
                                              'Restaurant | Breakfast | café',
                                              style: GoogleFonts.roboto(
                                                fontSize: 12,
                                                color: Color(0XFF707070),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 5.w,
                                                vertical: 0.5.h),
                                            child: Text(
                                              '${food.listOfFood[index].restaurantName} ',
                                              style: GoogleFonts.roboto(
                                                fontSize: 14,
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Container(
                          color: Color(0XFFDED6E3),
                          height: 20.h,
                          width: size.width,
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 30),
                          height: 20.h,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Color(0XFFDED6E3),
                            borderRadius: BorderRadius.circular(
                              30,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                );
              });
            }
          }),
    );
  }
}
