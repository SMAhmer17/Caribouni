// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:caribouni/screens/tabs/home_screen/attractions/ExperieceDetail.dart';
import 'package:dotted_border/dotted_border.dart';

import '../../../../utils/app_export.dart';

class EntryTicketDetail extends StatefulWidget {
  const EntryTicketDetail({super.key});

  @override
  State<EntryTicketDetail> createState() => _EntryTicketDetailState();
}

class _EntryTicketDetailState extends State<EntryTicketDetail> {
  final ScrollController _scrollController = ScrollController();
  bool _isSliverAppBarExpanded = false;
  int totalAmount = 0;
  void _scrollListener() {
    if (_scrollController.hasClients &&
        _scrollController.offset > (120 - kToolbarHeight)) {
      setState(() {
        _isSliverAppBarExpanded = true;
      });
    } else {
      setState(() {
        _isSliverAppBarExpanded = false;
      });
    }
  }

  int currentPos = 0;
  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: [
              SliverAppBar(
                systemOverlayStyle: SystemUiOverlayStyle(
                  // Status bar color
                  statusBarColor: ColorConstant.darkGold,
                ),
                automaticallyImplyLeading: false,
                expandedHeight: 300,
                pinned: true,
                floating: true,
                title: _isSliverAppBarExpanded
                    ? Text(
                        "Master bedroom available in JVC ! All bill included",
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.white),
                      )
                    : Container(),
                backgroundColor: _isSliverAppBarExpanded
                    ? ColorConstant.darkGold
                    : Colors.transparent,
                leading: IconButton(
                  icon: CircleAvatar(
                      backgroundColor: ColorConstant.gainsboro,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.arrow_back_ios,
                          color: ColorConstant.purpleJam,
                          size: 20,
                        ),
                      )),
                  onPressed: () {
                    UIhelper.unFocus();
                    Navigator.of(context).pop();
                  },
                ),
                actions: [
                  IconButton(
                    icon: CircleAvatar(
                        backgroundColor: ColorConstant.gainsboro,
                        child: Icon(
                          Icons.share_outlined,
                          color: ColorConstant.purpleJam,
                          size: 20,
                        )),
                    onPressed: () {
                      // UIhelper.unFocus();
                      // Navigator.of(context).pop();
                    },
                  ),
                  FavoriteIconWidget(
                    onPressed: () {},
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                    titlePadding: EdgeInsets.zero,
                    background: Container(
                      // height: 300,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).padding.top),
                      child: Stack(
                        children: [
                          carouselSlider(context),
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: imgList.map((url) {
                                int index = imgList.indexOf(url);
                                return Container(
                                  width: currentPos == index ? 10 : 6.0,
                                  height: currentPos == index ? 10 : 6.0,
                                  margin: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 2.0),
                                  decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: currentPos == index
                                          ? ColorConstant.darkViolet
                                          : ColorConstant.lightGrey),
                                );
                              }).toList(),
                            ),
                          ),
                          Positioned(
                              bottom: 0,
                              left: 20,
                              child: Container(
                                alignment: Alignment.center,
                                width: 120,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  gradient: LinearGradient(
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Colors.purple,
                                      Color(0xFFB37A2B),
                                    ],
                                  ),
                                ),
                                child: Text(
                                  "Entry Ticket",
                                  style: AppStyle.txtRobotoBold18White(context)
                                      .copyWith(
                                          color: Colors.white, fontSize: 14.sp),
                                ),
                              )),
                        ],
                      ),
                    )),
              ),
              SliverList(
                delegate: SliverChildListDelegate(
                  [
                    const SizedBox(
                      height: 10,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Burj Khalifa level 124 + 125 & Sky Views entry ticket",
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.purple, fontSize: 21.sp),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.electric_bolt_outlined,
                            color: Colors.grey,
                            size: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "Instant Confirmation •  Flexible",
                            style: AppStyle.txtRobotoBold18White(context)
                                .copyWith(color: Colors.grey, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Icon(
                            Icons.access_time_filled_outlined,
                            color: Colors.grey,
                            size: 14,
                          ),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "1 to 2 hour",
                            style: AppStyle.txtRobotoBold18White(context)
                                .copyWith(color: Colors.grey, fontSize: 14.sp),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 0,
                      color: ColorConstant.gainsboro,
                      thickness: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'About this activity',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.edit_calendar_outlined,
                        color: Colors.purple.shade100,
                      ),
                      title: Text(
                        'Free cancellation',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Cancel up 24 hours in advance for full refund',
                        style: AppStyle.txtRobotoBold18White(context).copyWith(
                            color: Colors.grey.shade400, fontSize: 14),
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      dense: false,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.more_time_sharp,
                        color: Colors.purple.shade100,
                      ),
                      title: Text(
                        'Reserve now & pay later',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Keep your travel plans flexible',
                        style: AppStyle.txtRobotoBold18White(context).copyWith(
                            color: Colors.grey.shade400, fontSize: 14),
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      minVerticalPadding: 00,
                      dense: false,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.mobile_screen_share_outlined,
                        color: Colors.purple.shade100,
                      ),
                      title: Text(
                        'Mobile Ticketing',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Use your phone or print your voucher',
                        style: AppStyle.txtRobotoBold18White(context).copyWith(
                            color: Colors.grey.shade400, fontSize: 14),
                      ),
                    ),
                    ListTile(
                      visualDensity: VisualDensity.compact,
                      dense: false,
                      minLeadingWidth: 0,
                      leading: Icon(
                        Icons.date_range_outlined,
                        color: Colors.purple.shade100,
                      ),
                      title: Text(
                        'Valid 1 day',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.black, fontSize: 14),
                      ),
                      subtitle: Text(
                        'Use your phone or print your voucher',
                        style: AppStyle.txtRobotoBold18White(context).copyWith(
                            color: Colors.grey.shade400, fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 0,
                      color: ColorConstant.gainsboro,
                      thickness: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Overview',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'The world’s tallest building, Burj Khalifa, is not to be missed when visiting Dubai. Enjoy expansive views of the city from the 124th, 125th, and 148th floors with this admission ticket to “At The Top.” Head to the top in speedy elevators, get a closer look at your surroundings through high-powered telescopes, and enjoy an immersive virtual reality experience soaring above the clouds.',
                        textAlign: TextAlign.justify,
                        style: AppStyle.txtRobotoRegular16SantaGrey(context)
                            .copyWith(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        '\n\u2023 Head to the top of Burj Khalifa with “At The Top” entrance tickets.\n\u2023 Get uninterrupted 360° views of Dubai and its surroundings.\n\u2023 Upload memories of your experience with free Wi-Fi throughout.\n\u2023 Tour the 148th floor with a Guest Ambassador.',
                        textAlign: TextAlign.justify,
                        style: AppStyle.txtRobotoRegular16SantaGrey(context)
                            .copyWith(
                                color: Colors.black54,
                                fontSize: 14,
                                fontWeight: FontWeight.w300),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Divider(
                      height: 0,
                      color: ColorConstant.gainsboro,
                      thickness: 5,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Experience',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ListView.separated(
                          padding: const EdgeInsets.all(0),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: list.length,
                          separatorBuilder: (context, index) => Divider(
                                height: 0,
                                color: ColorConstant.gainsboro,
                                thickness: 2,
                              ),
                          itemBuilder: (BuildContext context, int index) {
                            return ListTile(
                              minLeadingWidth: 00,
                              onTap: () {
                                PersistentNavBarNavigator.pushNewScreen(context,
                                    screen: ExperienceDetail(),
                                    withNavBar: false);
                              },
                              title: Text(
                                list[index],
                                style: AppStyle.txtRobotoBold18White(context)
                                    .copyWith(
                                        color: Colors.black, fontSize: 14),
                              ),
                              trailing: Icon(Icons.arrow_forward_ios_outlined),
                            );
                          }),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Divider(
                        height: 0,
                        color: ColorConstant.gainsboro,
                        thickness: 2,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Divider(
                      height: 0,
                      color: ColorConstant.gainsboro,
                      thickness: 5,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Rating & Reviews',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Ratings based on reviews',
                            style: AppStyle.txtRobotoRegular16SantaGrey(context)
                                .copyWith(color: Colors.black),
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            scale: 3,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                '4.3',
                                style: AppStyle.txtRobotoRegular16SantaGrey(
                                        context)
                                    .copyWith(
                                        color:
                                            Color.fromARGB(255, 240, 194, 11),
                                        fontSize: 60),
                              ),
                              Text(
                                'out of 5',
                                style: AppStyle.txtRobotoRegular16SantaGrey(
                                        context)
                                    .copyWith(fontSize: 15),
                              ),
                            ],
                          ),
                          Image.asset(
                            'assets/images/stat.png',
                            scale: 2,
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Contribute',
                            style: AppStyle.txtRobotoRegular16SantaGrey(context)
                                .copyWith(color: Colors.amber, fontSize: 20),
                          ),
                          Image.asset(
                            'assets/images/star.png',
                            scale: 3.5,
                          ),
                          Container(
                            width: 120,
                            height: 30,
                            margin: const EdgeInsets.symmetric(
                              horizontal: 5,
                              vertical: 2,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.purple,
                              borderRadius: BorderRadius.circular(
                                40,
                              ),
                            ),
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  elevation: 0,
                                  backgroundColor: Colors.transparent,
                                ),
                                child: Row(
                                  children: [
                                    Text(
                                      'Write a review |',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal,
                                      ),
                                    ),
                                    Icon(
                                      Icons.edit_outlined,
                                      size: 12,
                                    )
                                  ],
                                ),
                                onPressed: () {
                                  showModalBottomSheet(
                                      shape: const RoundedRectangleBorder(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30))),
                                      context: context,
                                      builder: (context) => Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 30, vertical: 5),
                                            decoration: const BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(30),
                                                    topRight:
                                                        Radius.circular(30))),
                                            height: MediaQuery.of(context)
                                                    .copyWith()
                                                    .size
                                                    .height *
                                                0.75,
                                            child: Column(
                                              children: [
                                                const SizedBox(
                                                    width: 44,
                                                    child: Divider(
                                                      thickness: 3.5,
                                                    )),
                                                Text(
                                                  "Leave a Review",
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 20),
                                                ),
                                                const Divider(
                                                  thickness: 1.5,
                                                ),
                                                Text(
                                                  "How was your experience with Caribouni ?",
                                                  textAlign: TextAlign.center,
                                                  style: GoogleFonts.poppins(
                                                      fontWeight:
                                                          FontWeight.normal,
                                                      fontSize: 16),
                                                ),
                                                Image.asset(
                                                  'assets/images/star.png',
                                                  scale: 2,
                                                  alignment: Alignment.center,
                                                ),
                                                const SizedBox(
                                                  width: 20,
                                                ),
                                                const Divider(
                                                  thickness: 1.5,
                                                ),
                                                Container(
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Text(
                                                    "Write your review",
                                                    textAlign: TextAlign.left,
                                                    style: GoogleFonts.poppins(
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontSize: 16),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color:
                                                          Colors.grey.shade200,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: TextFormField(
                                                    maxLines: 5,
                                                    decoration:
                                                        const InputDecoration(
                                                            enabledBorder:
                                                                InputBorder
                                                                    .none,
                                                            border: InputBorder
                                                                .none),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Container(
                                                      width: 135,
                                                      height: 35,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                        /////  horizontal: 30,
                                                        vertical: 20,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors
                                                            .grey.shade100,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          40,
                                                        ),
                                                      ),
                                                      child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                          ),
                                                          child: Text(
                                                            'May be Later',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.purple,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          onPressed: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          }),
                                                    ),
                                                    const SizedBox(
                                                      width: 10,
                                                    ),
                                                    Container(
                                                      width: 135,
                                                      height: 35,
                                                      margin: const EdgeInsets
                                                          .symmetric(
                                                        /////  horizontal: 30,
                                                        vertical: 20,
                                                      ),
                                                      decoration: BoxDecoration(
                                                        color: Colors.purple,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                          40,
                                                        ),
                                                      ),
                                                      child: ElevatedButton(
                                                          style: ElevatedButton
                                                              .styleFrom(
                                                            elevation: 0,
                                                            backgroundColor:
                                                                Colors
                                                                    .transparent,
                                                          ),
                                                          child: Text(
                                                            'Submit',
                                                            style: GoogleFonts
                                                                .poppins(
                                                              color:
                                                                  Colors.white,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                            ),
                                                          ),
                                                          onPressed: () {}),
                                                    ),
                                                  ],
                                                )
                                              ],
                                            ),
                                          ));
                                }),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Text(
                        'This review is the subjective opinion of a Caribouni members, and not of Caribouni Portal LLC. We perform checks on reviews',
                        style: AppStyle.txtRobotoRegular16SantaGrey(context)
                            .copyWith(color: Colors.black),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context, index) => Card(
                        elevation: 5,
                        margin: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  CircleAvatar(
                                    radius: 25,
                                    backgroundImage:
                                        AssetImage('assets/images/Avatar.png'),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Helene Moore',
                                        style:
                                            AppStyle.txtRobotoBold20PurpleJam(
                                                    context)
                                                .copyWith(
                                                    color: Colors.black,
                                                    fontSize: 14),
                                      ),
                                      Image.asset(
                                        'assets/images/star.png',
                                        scale: 3,
                                      )
                                    ],
                                  )
                                ],
                              ),
                              Text(
                                '                         23 March,',
                                style: AppStyle.txtRobotoRegular16SantaGrey(
                                        context)
                                    .copyWith(
                                        color: Colors.black, fontSize: 10),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Text(
                                'Was planning to stay for about an hour, but ended up staying for 3 hours. Great views, relaxing and I found it calming. Friendly staff will bring coffee and food. Perhaps next time I would pay the extra to go to the higher floors and have the dining experience.',
                                textAlign: TextAlign.justify,
                                style: AppStyle.txtRobotoRegular16SantaGrey(
                                        context)
                                    .copyWith(
                                        color: Colors.black, fontSize: 14),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 11.h,
        padding: const EdgeInsets.all(10),
        color: const Color.fromARGB(255, 223, 220, 209),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 4.w,
              ),
              height: 10.h,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Icon(
                            Icons.price_change,
                            color: Colors.purple,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          Text(
                            'Price',
                            style: GoogleFonts.poppins(
                                color: Colors.black,
                                fontWeight: FontWeight.normal,
                                fontSize: 16),
                          ),
                        ],
                      ),
                      Text(
                        '250 AED',
                        style: GoogleFonts.poppins(
                            color: Colors.purple,
                            fontWeight: FontWeight.bold,
                            fontSize: 22),
                      ),
                    ],
                  ),
                  Container(
                    width: 130,
                    height: 50,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 30,
                      vertical: 20,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
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
                          'book now'.toUpperCase(),
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: const Scaffold(), withNavBar: false);
                        }),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List list = [
    "Including",
    "Meeting point",
    "Good to Know",
  ];
  List<String> amenties = [
    'Cleaning Including',
    'Free Wifi',
    'Washer',
    'Pool',
    'Kitchen Appliances',
    'Gym',
    'Free Parking'
  ];
  List<String> tennuts = [
    'Females',
    'Families',
  ];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  Widget carouselSlider(BuildContext context) {
    return imgList.isNotEmpty
        ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 5),
                  pageSnapping: true,
                  height: 300,
                  autoPlay: true,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  }),
              itemBuilder: ((context, index, realIndex) => SliderImageWidget(
                    imagePath: imgList[index],
                  )),
            ),
          ])
        : Container();
  }
}
