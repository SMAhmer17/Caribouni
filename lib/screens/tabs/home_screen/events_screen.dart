// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, unused_import, body_might_complete_normally_nullable, avoid_unnecessary_containers

import 'package:caribouni/provider/EventData.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/ArtCulture.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/Club.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/Exhibitions.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/Meeting.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/Music.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/Show.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/SpotliteDetail.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:provider/provider.dart';

import '../../../widgets/widgets.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  List<String> images = [
    'Group 17440',
    'Icon ionic-ios-musical-notes',
    'Health Icons',
    'Layer 2',
    'group alt',
    'Path 13552'
  ];
  List<String> text = [
    'Club',
    'Music',
    'Meeting',
    'Art & Culture',
    'Exhibitions',
    'Show'
  ];
  List screens = [
    Club(),
    Music(),
    Meeting(),
    ArtCulture(),
    Exhibitions(),
    Show(),
  ];
  int _current = 0;
  final CarouselController _controller = CarouselController();
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: FutureBuilder(
          future: Provider.of<EventData>(context, listen: false).getAllEvent(),
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
              return SingleChildScrollView(
                child: Consumer<EventData>(builder: (context, event, _) {
                  return Container(
                      height: sizes.height,
                      width: sizes.width,
                      child: SingleChildScrollView(
                        child: Stack(
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  color: Colors.grey,
                                  child: Container(
                                    height: 13.h,
                                    width: sizes.width,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(30),
                                          bottomRight: Radius.circular(30)),
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/images/eventAppBar.png'),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.centerLeft,
                                  height: 75,
                                  padding: EdgeInsets.only(
                                      left: 20, top: 10, bottom: 10),
                                  width: sizes.width,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(30),
                                        bottomRight: Radius.circular(30)),
                                  ),
                                  child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: images.length,
                                      padding: EdgeInsets.only(right: 10),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) => InkWell(
                                            onTap: () {
                                              PersistentNavBarNavigator
                                                  .pushNewScreen(context,
                                                      screen: screens[index],
                                                      withNavBar: false);
                                            },
                                            child: Container(
                                              padding:
                                                  EdgeInsets.only(left: 20),
                                              child: Column(
                                                children: [
                                                  Image.asset(
                                                    'assets/images/${images[index]}.png',
                                                    scale: 2,
                                                  ),
                                                  SizedBox(
                                                    height: 10,
                                                  ),
                                                  Text(
                                                    text[index].toString(),
                                                    style: GoogleFonts.roboto(
                                                      color: Color(0XFF712B8F),
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 14.sp,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )),
                                ),
                              ],
                            ),
                            AppBar(
                              backgroundColor: Colors.transparent,
                              elevation: 0,
                              actions: [
                                Image.asset(
                                  'assets/images/Weather.png',
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 24.h,
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
                                        margin: EdgeInsets.symmetric(
                                            horizontal: 5.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            _current == 0
                                                ? Container()
                                                : IconButton(
                                                    onPressed: () {
                                                      _controller
                                                          .previousPage();
                                                    },
                                                    icon: Container(
                                                      height: 5.h,
                                                      alignment:
                                                          Alignment.center,
                                                      width: 8.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_back_ios_rounded,
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
                                                      alignment:
                                                          Alignment.center,
                                                      width: 8.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.white
                                                            .withOpacity(0.6),
                                                        shape: BoxShape.circle,
                                                      ),
                                                      child: Icon(
                                                        Icons
                                                            .arrow_forward_ios_rounded,
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
                                SizedBox(
                                  height: 5.h,
                                ),
                                // Container(
                                //   height: 4.h,
                                //   width: sizes.width,
                                //   child: ListView.builder(
                                //       shrinkWrap: true,
                                //       itemCount: textOpt.length,
                                //       scrollDirection: Axis.horizontal,
                                //       itemBuilder: (BuildContext context, int index) {
                                //         return Container(
                                //           alignment: Alignment.center,
                                //           margin: EdgeInsets.symmetric(horizontal: 1.w),
                                //           padding: EdgeInsets.symmetric(
                                //               horizontal: 3.w, vertical: 1.h),
                                //           decoration: BoxDecoration(
                                //             color: Color(0XFF712B8F),
                                //             borderRadius: BorderRadius.circular(30),
                                //           ),
                                //           child: Text(
                                //             textOpt[index],
                                //             textAlign: TextAlign.center,
                                //             style: GoogleFonts.roboto(
                                //               color: Colors.white,
                                //             ),
                                //           ),
                                //         );
                                //       }),
                                // ),
                                Divider(
                                  thickness: 3,
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                DelayedDisplay(
                                  delay: Duration(milliseconds: 500),
                                  child: Column(
                                    children: [
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
                                                    color: Color(0XFF712B8F)
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0XFF712B8F)
                                                      .withOpacity(0.6),
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 33.h,
                                        width: sizes.width,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: 5,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: GestureDetector(
                                                  onTap: () {
                                                    PersistentNavBarNavigator
                                                        .pushNewScreen(context,
                                                            screen:
                                                                SpotliteDetail(),
                                                            withNavBar: false);
                                                  },
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Container(
                                                        alignment:
                                                            Alignment.topRight,
                                                        decoration: BoxDecoration(
                                                            image: DecorationImage(
                                                                image: AssetImage(
                                                                    'assets/images/homeScreen/tijs-van-leur-So6YckShOVA-unsplash.png'),
                                                                fit: BoxFit
                                                                    .cover),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        20)),
                                                        height: 20.h,
                                                        width: 70.w,
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            shape:
                                                                BoxShape.circle,
                                                            color: Colors.white
                                                                .withOpacity(
                                                                    0.5),
                                                          ),
                                                          padding:
                                                              EdgeInsets.all(2),
                                                          margin: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 1.h,
                                                                  horizontal:
                                                                      2.w),
                                                          child: Icon(
                                                            Icons
                                                                .favorite_border,
                                                            color: Color(
                                                                0XFF712B8F),
                                                            size: 20,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5.w,
                                                                vertical:
                                                                    0.5.h),
                                                        child: Text(
                                                          'Tomorrow at 10:00 - 12:00 AM',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 14,
                                                            color: Colors.red,
                                                          ),
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 5.w,
                                                                vertical:
                                                                    0.5.h),
                                                        child: Text(
                                                          'The Romanian – Solo Exhibition',
                                                          style: GoogleFonts
                                                              .roboto(
                                                            fontSize: 14,
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                        ),
                                                      ),
                                                      Container(
                                                        width: 70.w,
                                                        child: Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                            horizontal: 5.w,
                                                          ),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Icon(
                                                                Icons
                                                                    .location_on_outlined,
                                                                color: Color(
                                                                    0XFF707070),
                                                              ),
                                                              SizedBox(
                                                                width: 2.w,
                                                              ),
                                                              Text(
                                                                'Vicas Art Studio',
                                                                style:
                                                                    GoogleFonts
                                                                        .roboto(
                                                                  fontSize: 12,
                                                                  color: Color(
                                                                      0XFF707070),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Upcoming Events',
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
                                                    color: Color(0XFF712B8F)
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0XFF712B8F)
                                                      .withOpacity(0.6),
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        height: 37.h,
                                        width: sizes.width,
                                        child: ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: imgList2.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 5.w,
                                                    vertical: 2.h),
                                                child: Material(
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                  elevation: 10,
                                                  child: Padding(
                                                    padding: EdgeInsets.only(
                                                        left: 2.w,
                                                        right: 2.w,
                                                        top: 1.h),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          alignment: Alignment
                                                              .topRight,
                                                          decoration:
                                                              BoxDecoration(
                                                                  image:
                                                                      DecorationImage(
                                                                          image:
                                                                              AssetImage(
                                                                            imgList2[index],
                                                                          ),
                                                                          fit: BoxFit
                                                                              .cover),
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              20)),
                                                          height: 20.h,
                                                          width: 74.w,
                                                          child: Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                              color: Colors
                                                                  .white
                                                                  .withOpacity(
                                                                      0.5),
                                                            ),
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            margin: EdgeInsets
                                                                .symmetric(
                                                                    vertical:
                                                                        1.h,
                                                                    horizontal:
                                                                        2.w),
                                                            child: Icon(
                                                              Icons
                                                                  .favorite_border,
                                                              color: Color(
                                                                  0XFF712B8F),
                                                              size: 20,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 74.w,
                                                          alignment: Alignment
                                                              .centerLeft,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        2.w,
                                                                    vertical:
                                                                        0.5.h),
                                                            child: Text(
                                                              'International Band Music Concert',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 18.sp,
                                                                color: Color(
                                                                    0XFF712B8F),
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 70.w,
                                                          child: Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 1.w,
                                                            ),
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .location_on_outlined,
                                                                  color: Color(
                                                                      0XFF707070),
                                                                ),
                                                                SizedBox(
                                                                  width: 2.w,
                                                                ),
                                                                Text(
                                                                  '36 Guild Street Jumeirah',
                                                                  style:
                                                                      GoogleFonts
                                                                          .roboto(
                                                                    fontSize:
                                                                        12,
                                                                    color: Color(
                                                                        0XFF707070),
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                      ),
                                      ListTile(
                                        title: Text(
                                          'Events Today',
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
                                                    color: Color(0XFF712B8F)
                                                        .withOpacity(0.6),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons.arrow_forward_ios,
                                                  color: Color(0XFF712B8F)
                                                      .withOpacity(0.6),
                                                  size: 18,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.symmetric(
                                          horizontal: 5.w,
                                        ),
                                        child: Expanded(
                                          child: ListView.builder(
                                              physics:
                                                  NeverScrollableScrollPhysics(),
                                              shrinkWrap: true,
                                              itemCount:
                                                  event.listOfEvents.length,
                                              scrollDirection: Axis.vertical,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                String link =
                                                    "https://caribouni.com${event.listOfEvents[index].images[0]}";
                                                print(link);
                                                return Column(
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              0.0),
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Container(
                                                            alignment: Alignment
                                                                .topRight,
                                                            decoration: BoxDecoration(
                                                                image: DecorationImage(
                                                                    image: NetworkImage(
                                                                      link,
                                                                    ),
                                                                    fit: BoxFit.cover),
                                                                borderRadius: BorderRadius.circular(20)),
                                                            height: 20.h,
                                                            width: sizes.width,
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.5),
                                                              ),
                                                              padding:
                                                                  EdgeInsets
                                                                      .all(2),
                                                              margin: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          1.h,
                                                                      horizontal:
                                                                          2.w),
                                                              child: Icon(
                                                                Icons
                                                                    .favorite_border,
                                                                color: Color(
                                                                    0XFF712B8F),
                                                                size: 20,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        5.w,
                                                                    vertical:
                                                                        0.5.h),
                                                            child: Text(
                                                              'Tomorrow at 10:00 - 12:00 AM',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 14,
                                                                color:
                                                                    Colors.red,
                                                              ),
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        5.w,
                                                                    vertical:
                                                                        0.5.h),
                                                            child: Text(
                                                              event
                                                                  .listOfEvents[
                                                                      index]
                                                                  .title,
                                                              //'The Romanian – Solo Exhibition',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                fontSize: 14,
                                                                color: Colors
                                                                    .black,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 70.w,
                                                            child: Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                horizontal: 5.w,
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Icon(
                                                                    Icons
                                                                        .location_on_outlined,
                                                                    color: Color(
                                                                        0XFF707070),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 2.w,
                                                                  ),
                                                                  Text(
                                                                    '${event.listOfEvents[index].address}',
                                                                    style: GoogleFonts
                                                                        .roboto(
                                                                      fontSize:
                                                                          12,
                                                                      color: Color(
                                                                          0XFF707070),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 2.h,
                                                          )
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              }),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ));
                }),
              );
            }
          }),
    );
  }
}
