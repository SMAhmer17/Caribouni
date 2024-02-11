// ignore_for_file: file_names

import 'package:caribouni/screens/tabs/addEvent.dart';
import 'package:caribouni/screens/tabs/home_screen.dart';
import 'package:caribouni/screens/tabs/home_screen/events_screen.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/add_rent.dart';
import 'package:caribouni/screens/tabs/more_screen.dart';
import 'package:caribouni/screens/tabs/profile/my_profile_screen.dart';
import 'package:caribouni/screens/tabs/wishlist_screen.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  static String routeName = '/AppNavBar';
  const NavBar({Key? key}) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int currentIndex = 0;
  final List _listOfScreens = ['Home', 'Favorite', 'Add Post', 'Account'];
  final List _listOfAssets = [
    'assets/images/home.png',
    'assets/images/fav.png',
    'assets/images/add.png',
    'assets/images/pro.png'
  ];
  final List _listOfIcons = [
    Icons.home_outlined,
    Icons.favorite_border,
    Icons.person_outline,
    Icons.account_circle_outlined,
  ];
  var pages = const [
    HomeScreen(),
    //EventsScreen(),
    WishListScreen(),
    AddEvent(),
    MoreScreen(),
  ];
  void functions() {
    showModalBottomSheet<void>(
        isDismissible: true,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        )),
        context: context,
        builder: (BuildContext context) {
          return StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(3),
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstant.santaGrey,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text('What do you want to create?',
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoBold20PurpleJam(context)
                          .copyWith(color: ColorConstant.fuscousGrey)),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const AddRent(), withNavBar: false);
                    },
                    child: const ConatainerWithDataWidget(
                      image: 'assets/images/hom.png',
                      title: "Rent out your Prperty",
                      isShowIcon: false,
                      isSelected: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                      PersistentNavBarNavigator.pushNewScreen(context,
                          screen: const AddEvent(), withNavBar: false);
                    },
                    child: const ConatainerWithDataWidget(
                      image: 'assets/images/cal.png',
                      title: "Create an event",
                      isShowIcon: false,
                      isSelected: false,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          });
        });
  }

  final _appPageController = PageController();

  setBottomBarIndex(index) {
    setState(() {
      currentIndex = index;
    });
    _appPageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (index) {
            setState(() {
              currentIndex = index;
            });
          },
          controller: _appPageController,
          children: pages,
        ),
        bottomNavigationBar: Container(
          width: size.width,
          margin: const EdgeInsets.all(10),
          alignment: Alignment.center,
          height: 55,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: const Color.fromARGB(255, 221, 221, 221).withOpacity(1)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              appBarIcon(0),
              appBarIcon(1),
              appBarIcon(2),
              appBarIcon(3),
            ],
          ),
        ));
  }

  GestureDetector appBarIcon(int currentIndexs) {
    return GestureDetector(
      onTap: () {
        currentIndexs == 2 ? functions() : setBottomBarIndex(currentIndexs);
      },
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: currentIndex == currentIndexs
                ? const LinearGradient(
                    end: Alignment.topCenter,
                    begin: Alignment.bottomCenter,
                    colors: [
                      Color(0xFFB37A2B),
                      Color(0xFFF8DA68),
                    ],
                  )
                : null),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            currentIndex == currentIndexs
                ? Icon(
                    _listOfIcons[currentIndexs],
                    color: Colors.white,
                  )
                : Image.asset(
                    _listOfAssets[currentIndexs],
                    height: 27,
                    width: 27,
                  ),
            Text(
              _listOfScreens[currentIndexs],
              style: AppStyle.txtRobotoBold20PurpleJam(context).copyWith(
                fontWeight: FontWeight.w400,
                fontSize: 11,
                color: currentIndex == currentIndexs
                    ? Colors.white
                    : Colors.black54,
              ),
            )
          ],
        ),
      ),
    );
  }
}
