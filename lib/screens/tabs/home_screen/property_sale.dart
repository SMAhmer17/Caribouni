// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, prefer_const_literals_to_create_immutables, prefer_if_null_operators

import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/provider/PropertyData.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/add_rent.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/tab1.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/tab2.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/tab3.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class PropertyForSale extends StatefulWidget {
  final index;
  const PropertyForSale({super.key, this.index});

  @override
  State<PropertyForSale> createState() => _PropertyForSaleState();
}

class _PropertyForSaleState extends State<PropertyForSale>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final _tabs = [
    Tab(
      child: Image.asset(
        'assets/images/Group 1.png',
      ),
    ),
    Tab(
      child: Image.asset(
        'assets/images/Group 2.png',
      ),
    ),
    Tab(
      child: Image.asset(
        'assets/images/Group 3.png',
      ),
    ),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        // floatingActionButton: TextButton(
        //   onPressed: () {
        //      PersistentNavBarNavigator.pushNewScreen(
        //             context,
        //             screen: AddRent(

        //             ),withNavBar: false,);
        //   },
        //   child: Container(
        //     height: 10.h,
        //     width: 20.w,
        //     decoration: BoxDecoration(
        //       border: Border.all(
        //         width: 7,
        //         color: Colors.white.withOpacity(0.6),
        //       ),
        //       shape: BoxShape.circle,
        //     ),
        //     child: Container(
        //       margin: EdgeInsets.all(4),
        //       decoration: BoxDecoration(
        //         shape: BoxShape.circle,
        //         gradient: LinearGradient(
        //           begin: Alignment.topCenter,
        //           end: Alignment.bottomCenter,
        //           colors: [
        //             Color(0XFFE58628),
        //             Color(0xFF7E0EBD),
        //           ],
        //         ),
        //       ),
        //       child: Icon(
        //         Icons.add_rounded,
        //         color: Colors.white,
        //         size: 30,
        //       ),
        //     ),
        //   ),
        // ),
        body: Container(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 14.h,
              child: Wrap(
                children: [
                  Stack(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 14.h,
                            width: size.width,
                            child: Wrap(
                              children: [
                                Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: size.width,
                                          height: 14.h,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                                    'assets/images/Group 16435.png'),
                                                fit: BoxFit.cover),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 6.8.h,
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 5.w,
                                          ),
                                          child: Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Image(
                                                  image: AssetImage(
                                                      'assets/images/Group 16050.png'),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 5.w,
                                              ),
                                              Container(
                                                width: 50.w,
                                                child: Image.asset(
                                                    'assets/images/PRINT 1.png'),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            DefaultTabController(
              length: 3,
              initialIndex: widget.index == null ? 0 : widget.index,
              child: Column(
                children: [
                  Material(
                    child: TabBar(
                      indicatorColor: Color(0XFF712B8F),
                      tabs: _tabs,
                      labelColor: Color(0XFF712B8F),
                      indicator: MaterialIndicator(
                        horizontalPadding: 10,
                        height: 5,
                        topLeftRadius: 0,
                        topRightRadius: 0,
                        bottomLeftRadius: 0,
                        bottomRightRadius: 0,
                        tabPosition: TabPosition.bottom,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                      height: size.height,
                      width: size.width,
                      child: TabBarView(
                        children: [
                          Tab1(),
                          Tab2(),
                          Tab3(),
                        ],
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
