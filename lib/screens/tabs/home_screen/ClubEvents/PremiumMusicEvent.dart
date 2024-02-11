import 'package:caribouni/screens/tabs/home_screen/ClubEvents/SelectTicket.dart';
import 'package:caribouni/screens/tabs/home_screen/ClubEvents/SpotliteDetail.dart';
import 'package:caribouni/screens/tabs/home_screen/property_sale_tabs/add_rent.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:dotted_border/dotted_border.dart';

class PremiumMusicEvent extends StatefulWidget {
  const PremiumMusicEvent({super.key});

  @override
  State<PremiumMusicEvent> createState() => _PremiumMusicEventState();
}

class _PremiumMusicEventState extends State<PremiumMusicEvent> {
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
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 00,
        automaticallyImplyLeading: false,
        toolbarHeight: 0,
        backgroundColor: Colors.transparent,
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(
                      context,
                      SlideTransitionScreen(
                        enterPage: const PremiumMusicEvent(),
                        exitPage: const SpotliteDetail(),
                      ),
                    );
                  },
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.keyboard_arrow_up_outlined,
                          color: Colors.orange.shade300,
                        ),
                        Text(
                          'Previous',
                          style: GoogleFonts.poppins(
                              color: Colors.orange.shade300,
                              fontWeight: FontWeight.bold,
                              fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Music Event',
                    style: AppStyle.txtRobotoBold18White(context)
                        .copyWith(color: ColorConstant.darkViolet),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Premium Staycation Package at Pan Pacific',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  'assets/images/Group 16470.png',
                  scale: 2,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 0,
                    color: ColorConstant.gainsboro,
                    thickness: 5,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.calendar_today,
                        size: 18,
                      ),
                      Text(
                        'Sun, Mar 22, 2023',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '8:30 PM - 10:00 PM',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.notifications_active_outlined,
                        size: 18,
                        color: Colors.grey,
                      ),
                      Text(
                        'Reminder',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.purple,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Divider(
                    height: 0,
                    color: ColorConstant.gainsboro,
                    thickness: 5,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    TextValue.location,
                    style: AppStyle.txtRobotoBold18White(context)
                        .copyWith(color: ColorConstant.darkViolet),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Image.asset(
                    'assets/images/Google Map.png',
                    // height: 20.h,
                    // fit: BoxFit.fill,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Center(
                    child: LocationWithIconWidget(
                      location: "",
                      color: ColorConstant.santaGrey,
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 18,
                        color: Colors.purple,
                      ),
                      Text(
                        'Reminder',
                        textAlign: TextAlign.start,
                        style: GoogleFonts.roboto(
                          fontSize: 16,
                          fontWeight: FontWeight.normal,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    '   Barasti, Mina Siyahi, Marina',
                    textAlign: TextAlign.start,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
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
                    'About',
                    style: AppStyle.txtRobotoBold18White(context)
                        .copyWith(color: ColorConstant.darkViolet),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea rebum.",
                    style: AppStyle.txtRobotoRegular16SantaGrey(context)
                        .copyWith(color: Colors.black),
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
                ListTile(
                  title: Text(
                    'Events May You Like',
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
                              color: Color(0XFF712B8F).withOpacity(0.6),
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0XFF712B8F).withOpacity(0.6),
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
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: GestureDetector(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: SpotliteDetail(), withNavBar: false);
                            },
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  decoration: BoxDecoration(
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/homeScreen/tijs-van-leur-So6YckShOVA-unsplash.png'),
                                          fit: BoxFit.cover),
                                      borderRadius: BorderRadius.circular(20)),
                                  height: 20.h,
                                  width: 70.w,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.white.withOpacity(0.5),
                                    ),
                                    padding: const EdgeInsets.all(2),
                                    margin: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 2.w),
                                    child: const Icon(
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
                                        const Icon(
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
                                            color: const Color(0XFF707070),
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
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          )
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
                          'Buy ticket',
                          style: GoogleFonts.poppins(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: const SelectTicket(), withNavBar: false);
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
    {
      "title": "Room for rent",
      "desc": "Apartment",
    },
    {
      "title": "Room Type",
      "desc": "Private Room",
    },
    {
      "title": "Preferred Tenants",
      "desc": "Don’t Mind",
    },
    {
      "title": "Security Deposit",
      "desc": "1000 AED",
    },
    {
      "title": "Posted On",
      "desc": "8 Feb",
    },
  ];
  List<String> amenties = [
    'Cleaning Including',
    'FreeWifi',
    'Washer',
    'Pool',
    'Kitchen Appliances',
    'Gym'
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
