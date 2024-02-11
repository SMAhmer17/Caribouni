// ignore_for_file: unused_field, prefer_final_fields, prefer_const_constructors, prefer_if_null_operators, prefer_typing_uninitialized_variables

import 'dart:ui';

import 'package:caribouni/screens/tabs/home_screen.dart';
import 'package:caribouni/screens/tabs/more_screen.dart';
import 'package:caribouni/screens/tabs/wishlist_screen.dart';

import '../utils/app_export.dart';
import 'tabs/home_screen/property_sale_tabs/add_rent.dart';

class MainHomeScreen extends StatefulWidget {
  final index;
  const MainHomeScreen({
    super.key,
    this.index,
  });

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  List<Widget> _widgetOptions() {
    return [
      HomeScreen(),
      // EventsScreen(),
      WishListScreen(),
      AddRent(),
      MyProfileScreen(),
      MoreScreen(),
    ];
  }

  PersistentTabController _controller = PersistentTabController();

  List<PersistentBottomNavBarItem> _navBarsItems() => [
        PersistentBottomNavBarItem(
          opacity: 0.4,
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          activeColorPrimary: ColorConstant.purpleJam,
          inactiveColorPrimary: ColorConstant.fuscousGrey,
          title: 'Home',
          icon: Icon(
            Icons.home_outlined,
          ),
        ),
        PersistentBottomNavBarItem(
          opacity: 0.4,
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          activeColorPrimary: ColorConstant.purpleJam,
          inactiveColorPrimary: ColorConstant.fuscousGrey,
          title: 'Favorite',
          icon: Icon(
            Icons.favorite_border,
          ),
        ),
        PersistentBottomNavBarItem(
          opacity: 0.4,
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          activeColorPrimary: ColorConstant.purpleJam,
          inactiveColorPrimary: ColorConstant.fuscousGrey,
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        PersistentBottomNavBarItem(
          opacity: 0.4,
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          activeColorPrimary: ColorConstant.purpleJam,
          inactiveColorPrimary: ColorConstant.fuscousGrey,
          title: 'Profile',
          icon: Icon(
            Icons.person_outline,
          ),
        ),
        PersistentBottomNavBarItem(
          opacity: 0.4,
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          activeColorPrimary: ColorConstant.purpleJam,
          inactiveColorPrimary: ColorConstant.fuscousGrey,
          title: 'More',
          icon: Icon(
            Icons.more_vert,
          ),
        ),
      ];

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      controller: PersistentTabController(initialIndex: widget.index),
      context,
      backgroundColor: ColorConstant.lightGrey,
      hideNavigationBarWhenKeyboardShows: true,
      screens: _widgetOptions(),
      items: _navBarsItems(),
      navBarStyle: NavBarStyle.style15,
      floatingActionButton: Icon(
        Icons.add,
        size: 0,
      ),
      decoration: NavBarDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
    );
  }
}


// // ignore_for_file: prefer_const_constructors, prefer_final_fields, unused_field, prefer_const_literals_to_create_immutables, library_private_types_in_public_api, use_key_in_widget_constructors, prefer_typing_uninitialized_variables, annotate_overrides, avoid_unnecessary_containers
// import 'dart:ui';

// import 'package:caribouni/screens/tabs/events_screen.dart';
// import 'package:caribouni/screens/tabs/wishlist_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_nav_bar/google_nav_bar.dart';
// import 'package:line_icons/line_icons.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import 'tabs/home_screen.dart';
// import 'tabs/more.dart';

// class MainHomeScreen extends StatefulWidget {
//   final value;

//   const MainHomeScreen({super.key,  this.value});
//   @override
//   _MainHomeScreenState createState() => _MainHomeScreenState();
// }

// class _MainHomeScreenState extends State<MainHomeScreen> {
//   int? _selectedIndex;
//   static TextStyle optionStyle =
//       TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  // static List _widgetOptions = [
  //   HomeScreen(),
  //   EventsScreen(),
  //   WishListScreen(),
  //   MoreScreen()
  // ];

//   @override
// void initState() {
//     super.initState();

//     if(widget.value != null){setState(() {
//       _selectedIndex = widget.value;
//     });
    
    
//     }else{
//       setState(() {
//         _selectedIndex=0;
//       });
//     }
//   }

//   Widget build(BuildContext context) {
//     return Scaffold(
  
//       body:  _widgetOptions.elementAt(_selectedIndex!),
      
















      
//       bottomNavigationBar: ClipRect(
//         child: BackdropFilter(
//           filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
//           child: Container(
//             decoration: BoxDecoration(
//               color: Colors.grey.shade200.withOpacity(0.5),
//               boxShadow: [
//                 BoxShadow(
//                   blurRadius: 20,
//                   color: Colors.black.withOpacity(.1),
//                 )
//               ],
//             ),
//             child: SafeArea(
//               child: Container(
//                 child: Padding(
//                   padding: EdgeInsets.symmetric(vertical: 8,horizontal: 1.w),
//                   child: GNav(
//                     rippleColor: Colors.grey[300]!,
//                     hoverColor: Colors.grey[100]!,
//                     gap: 8,
//                     activeColor: Color(0XFF712B8F),
//                     iconSize: 24,
//                     padding: EdgeInsets.symmetric(vertical: 12),
//                     duration: Duration(milliseconds: 400),
//                     tabBackgroundColor: Colors.transparent,
//                     color: Colors.black,
//                     tabs: [
//                       GButton(
//                         icon: LineIcons.home,
//                         iconColor: Color(0XFF707070),
//                         text: 'Home',
//                         textColor:  Color(0XFF707070),textStyle: GoogleFonts.roboto(fontSize: 15.sp),
//                       ),
//                       GButton(
//                         icon: LineIcons.calendarAlt,
//                         iconColor: Color(0XFF707070),
//                         text: 'Events',
//                         textColor:  Color(0XFF707070),textStyle: GoogleFonts.roboto(fontSize: 15.sp),
//                       ),
//                       GButton(
//                         icon: LineIcons.heart,
//                         iconColor: Color(0XFF707070),
//                         text: 'Wishlist',
//                         textColor:  Color(0XFF707070),textStyle: GoogleFonts.roboto(fontSize: 15.sp),
//                       ),
//                       GButton(
//                         icon: Icons.add_to_photos_outlined,
//                         iconColor: Color(0XFF707070),
//                         text: 'More',
//                         textColor: Color(0XFF707070),textStyle: GoogleFonts.roboto(fontSize: 15.sp),
//                       ),
//                     ],
//                     selectedIndex: _selectedIndex!,
//                     onTabChange: (index) {
//                       setState(() {
//                         _selectedIndex = index;
//                       },);
//                     },
//                   ),
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
