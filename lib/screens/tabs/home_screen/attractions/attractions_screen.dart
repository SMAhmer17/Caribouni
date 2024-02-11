// ignore_for_file: prefer_const_constructors
import 'package:caribouni/screens/tabs/home_screen/attractions/EntryTicketDetail.dart';

import '../../../../utils/app_export.dart';

class AttractionScreen extends StatefulWidget {
  const AttractionScreen({super.key});

  @override
  State<AttractionScreen> createState() => _AttractionScreenState();
}

class _AttractionScreenState extends State<AttractionScreen>
    with SingleTickerProviderStateMixin {
  List attractions = [
    {"title": "CITY TOUR", "image": "assets/images/CITY TOUR.png"},
    {"title": "DAY TRIPS", "image": "assets/images/DAY TRIPS.png"},
    {"title": "ADVENTURE", "image": "assets/images/ADVENTURE.png"},
    {"title": "THEME PARKS", "image": "assets/images/THEME PARKS.png"},
    {
      "title": "WATER ACTIVITIES",
      "image": "assets/images/WATER ACTIVITIES.png"
    },
    {"title": "SHOPPING MALLS", "image": "assets/images/SHOPPING MALLS.png"},
    {"title": "EXTREME SPORTS", "image": "assets/images/EXTREME SPORTS.png"},
    {"title": "ENTRY TICKETS", "image": "assets/images/ENTRY TICKETS.png"},
  ];

  final List<String> imgList = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];

  final List dummyData = List.generate(20, (index) => '$index');
  late TabController tabController;
  var selectedTabIndex = 0;
  @override
  void initState() {
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        selectedTabIndex = tabController.index;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: "EXPLORE MORE",
        title2: "ATTRACTIONS",
        isMultiText: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: ColorConstant.gainsboro,
                  borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30))),
              child: GridView.builder(
                  shrinkWrap: true,
                  padding:
                      EdgeInsets.only(left: 50, right: 50, top: 10, bottom: 10),
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      // childAspectRatio: 3 / 2,
                      crossAxisCount: 4,
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2),
                  itemCount: attractions.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return InkWell(
                      onTap: () =>
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: CategoryScreen(
                                title: attractions[index]["title"].toString(),
                              ),
                              withNavBar: false),
                      child: Column(
                        children: [
                          Image.asset(
                            attractions[index]["image"],
                            width: 40,
                            height: 40,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            attractions[index]["title"],
                            textAlign: TextAlign.center,
                            style: AppStyle.txtRobotoBold20PurpleJam(context)
                                .copyWith(fontSize: 12.sp),
                          ),
                        ],
                      ),
                    );
                  }),
            ),
            carouselSlider(context),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imgList.map((url) {
                  int index = imgList.indexOf(url);
                  return Container(
                    width: currentPos == index ? 30 : 10,
                    height: currentPos == index ? 10 : 10,
                    margin: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 1.0),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: ColorConstant.purpleJam),
                  );
                }).toList(),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(15),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    VerticalDivider(
                      thickness: 3,
                      color: ColorConstant.yellowOrange,
                      indent: 2,
                      endIndent: 2,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Top Sights",
                          textAlign: TextAlign.center,
                          style: AppStyle.txtRobotoBold20PurpleJam(context)
                              .copyWith(fontSize: 18.sp),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Trending attractions",
                          textAlign: TextAlign.center,
                          style:
                              AppStyle.txtRobotoMedium16DarkJungleGreen(context)
                                  .copyWith(color: ColorConstant.darkGold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Padding(
                  padding: EdgeInsets.all(15),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            height: 20.h,
                            width: 35.w,
                            child: ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              child: ImageWidget(
                                imageUrl:
                                    "https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80",
                                errorIconColor: ColorConstant.gainsboro,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Container(
                              height: 25,
                              width: 20,
                              color: ColorConstant.red,
                              child: Center(
                                child: Text(
                                  "#1",
                                  textAlign: TextAlign.center,
                                  style:
                                      AppStyle.txtRobotoMedium16DarkJungleGreen(
                                              context)
                                          .copyWith(
                                              fontSize: 14.sp,
                                              color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Burj Khalifa Sky Views",
                                  style:
                                      AppStyle.txtRobotoBold20PurpleJam(context)
                                          .copyWith(
                                              fontSize: 14.sp,
                                              color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      SizedBox(
                        height: 20.h,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: dummyData.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  childAspectRatio: 2 / 3.5,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10),
                          itemBuilder: (context, index) {
                            return Stack(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(13)),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            ColorConstant.purpleLight,
                                            ColorConstant.purpleJam
                                          ])),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: Container(
                                          height: double.infinity,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      topLeft:
                                                          Radius.circular(25),
                                                      bottomLeft:
                                                          Radius.circular(25))),
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(13),
                                                bottomLeft:
                                                    Radius.circular(13)),
                                            child: ImageWidget(
                                              imageUrl:
                                                  "https://fastly.picsum.photos/id/20/3670/2462.jpg?hmac=CmQ0ln-k5ZqkdtLvVO23LjVAEabZQx2wOaT4pyeG10I",
                                              errorIconColor:
                                                  ColorConstant.gainsboro,
                                            ),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 3,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10),
                                          child: Text(
                                            "Atlantis Aquaventure water park",
                                            style: AppStyle
                                                    .txtRobotoBold20PurpleJam(
                                                        context)
                                                .copyWith(
                                                    fontSize: 14.sp,
                                                    color: Colors.white),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Container(
                                    height: 30,
                                    width: 25,
                                    color: ColorConstant.red,
                                    child: Center(
                                      child: Text(
                                        "#${index + 2}",
                                        textAlign: TextAlign.center,
                                        style: AppStyle
                                                .txtRobotoMedium16DarkJungleGreen(
                                                    context)
                                            .copyWith(
                                                fontSize: 14.sp,
                                                color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                )),
            Padding(
              padding: EdgeInsets.all(15),
              child: IntrinsicHeight(
                child: Row(
                  children: [
                    VerticalDivider(
                      thickness: 3,
                      color: ColorConstant.yellowOrange,
                      indent: 2,
                      endIndent: 2,
                    ),
                    Text(
                      "Deluxe Experience",
                      textAlign: TextAlign.center,
                      style: AppStyle.txtRobotoBold20PurpleJam(context)
                          .copyWith(fontSize: 18.sp),
                    ),
                    Spacer(),
                    Text(
                      "See all",
                      textAlign: TextAlign.center,
                      style: AppStyle.txtRobotoMedium16DarkJungleGreen(context)
                          .copyWith(
                              fontSize: 14.sp,
                              color: ColorConstant.purpleLight),
                    ),
                    Icon(
                      Icons.arrow_forward_ios,
                      color: ColorConstant.purpleJam,
                      size: 12,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 32.h,
              child: ListView.separated(
                  padding: EdgeInsets.all(15),
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: 3,
                  separatorBuilder: (context, index) => SizedBox(
                        width: 5,
                      ),
                  itemBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 58.w,
                      child: GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: EntryTicketDetail(), withNavBar: false);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(13)),
                              gradient: LinearGradient(
                                  begin: Alignment.topCenter,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white,
                                    ColorConstant.lightGrey2
                                  ])),
                          child: Stack(
                            children: [
                              Column(
                                children: [
                                  Expanded(
                                    flex: 4,
                                    child: Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          borderRadius: const BorderRadius.only(
                                              topLeft: Radius.circular(25),
                                              topRight: Radius.circular(25))),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(13),
                                            topRight: Radius.circular(13)),
                                        child: ImageWidget(
                                          imageUrl:
                                              "https://fastly.picsum.photos/id/20/3670/2462.jpg?hmac=CmQ0ln-k5ZqkdtLvVO23LjVAEabZQx2wOaT4pyeG10I",
                                          errorIconColor:
                                              ColorConstant.gainsboro,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Padding(
                                      padding: const EdgeInsets.all(13),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Burj Khalifa level 124 + 125 & Sky Views Entry Ticket",
                                            style: AppStyle
                                                    .txtRobotoBold16DarkJungleGreen(
                                                        context)
                                                .copyWith(
                                                    fontSize: 15.sp,
                                                    color: ColorConstant
                                                        .fuscousGrey),
                                          ),
                                          Row(
                                            children: [
                                              RatingBar.builder(
                                                initialRating: 3,
                                                minRating: 1,
                                                direction: Axis.horizontal,
                                                allowHalfRating: true,
                                                itemCount: 5,
                                                itemSize: 10,
                                                itemBuilder: (context, _) =>
                                                    Icon(
                                                  Icons.star,
                                                  color: ColorConstant
                                                      .yellowOrange,
                                                ),
                                                onRatingUpdate: (rating) {
                                                  print(rating);
                                                },
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Text(
                                                'Review (123)',
                                                style: AppStyle
                                                        .txtRobotoRegular16SantaGrey(
                                                            context)
                                                    .copyWith(
                                                        fontSize: 13.sp,
                                                        color: ColorConstant
                                                            .yellowOrange,
                                                        decoration:
                                                            TextDecoration
                                                                .underline),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.end,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              RichText(
                                                text: TextSpan(children: [
                                                  TextSpan(
                                                      text: 'From',
                                                      style: AppStyle
                                                              .txtRobotoBold16DarkJungleGreen(
                                                                  context)
                                                          .copyWith(
                                                              fontSize: 15.sp,
                                                              color: ColorConstant
                                                                  .darkGold)),
                                                  TextSpan(
                                                      text: ' AED 182',
                                                      style: AppStyle
                                                              .txtRobotoBold16DarkJungleGreen(
                                                                  context)
                                                          .copyWith(
                                                              fontSize: 15.sp,
                                                              color: ColorConstant
                                                                  .darkGold)),
                                                ]),
                                              ),
                                              Text(' Per Person',
                                                  style: AppStyle
                                                          .txtRobotoBold16DarkJungleGreen(
                                                              context)
                                                      .copyWith(
                                                          fontSize: 12.sp,
                                                          color: ColorConstant
                                                              .darkGold))
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Align(
                                alignment: Alignment.topRight,
                                child: FavoriteIconWidget(
                                  onPressed: () {},
                                ),
                              ),
                              Container(
                                alignment: Alignment.center,
                                margin: EdgeInsets.only(top: 15.h, left: 13),
                                height: 2.5.h,
                                width: 20.w,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    color: ColorConstant.purpleJam),
                                child: Text('Entry Ticket',
                                    style: AppStyle
                                            .txtRobotoMedium16DarkJungleGreen(
                                                context)
                                        .copyWith(
                                            fontSize: 14.sp,
                                            color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              alignment: Alignment.center,
              height: 20.h,
              width: double.infinity,
              decoration: BoxDecoration(color: ColorConstant.gainsboro),
              child: Text('Google Ads',
                  style: AppStyle.txtRobotoMedium16DarkJungleGreen(context)
                      .copyWith(fontSize: 20.sp, color: Colors.blueGrey)),
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 12.h,
                    width: double.infinity,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(color: ColorConstant.gainsboro),
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        gradient: LinearGradient(
                            colors: [Colors.white, ColorConstant.lightGrey2])),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Reserve now pay later.',
                                  style:
                                      AppStyle.txtRobotoBold20PurpleJam(context)
                                          .copyWith(fontSize: 16.sp)),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                  'Secure the experiences without being locked in.',
                                  style:
                                      AppStyle.txtRobotoMedium16DarkJungleGreen(
                                              context)
                                          .copyWith(
                                              fontSize: 15.sp,
                                              color: ColorConstant.grey3))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      "assets/images/onboarding_screen_assets/character_man-06.png",
                      height: 23.h,
                    ),
                  )
                ],
              ),
            ),
            Material(
              color: Colors.white,
              shadowColor: ColorConstant.grey3.withOpacity(0.3),
              elevation: 5.0,
              child: TabBar(
                  isScrollable: true,
                  controller: tabController,
                  indicatorColor: ColorConstant.yellowOrange,
                  indicatorWeight: 5,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: [
                    Tab(
                      child: Text('Recommended',
                          style: AppStyle.txtRobotoBold20PurpleJam(context)
                              .copyWith(
                                  fontSize: 16.sp,
                                  color: selectedTabIndex == 0
                                      ? ColorConstant.purpleJam
                                      : ColorConstant.palePurple)),
                    ),
                    Tab(
                      child: Text('Locale Guide',
                          style: AppStyle.txtRobotoBold20PurpleJam(context)
                              .copyWith(
                                  fontSize: 16.sp,
                                  color: selectedTabIndex == 1
                                      ? ColorConstant.purpleJam
                                      : ColorConstant.palePurple)),
                    ),
                    Tab(
                      child: Text('Locale Guide',
                          style: AppStyle.txtRobotoBold20PurpleJam(context)
                              .copyWith(
                                  fontSize: 16.sp,
                                  color: selectedTabIndex == 2
                                      ? ColorConstant.purpleJam
                                      : ColorConstant.palePurple)),
                    ),
                    Tab(
                      child: Text('Entry Tickets',
                          style: AppStyle.txtRobotoBold20PurpleJam(context)
                              .copyWith(
                                  fontSize: 16.sp,
                                  color: selectedTabIndex == 3
                                      ? ColorConstant.purpleJam
                                      : ColorConstant.palePurple)),
                    ),
                    Tab(
                      child: Text('Water Activities',
                          style: AppStyle.txtRobotoBold20PurpleJam(context)
                              .copyWith(
                                  fontSize: 16.sp,
                                  color: selectedTabIndex == 4
                                      ? ColorConstant.purpleJam
                                      : ColorConstant.palePurple)),
                    ),
                  ]),
            ),
            SizedBox(
              height: 100.h,
              child: TabBarView(controller: tabController, children: [
                TabsDataListWidget(),
                TabsDataListWidget(),
                TabsDataListWidget(),
                TabsDataListWidget(),
                TabsDataListWidget(),
              ]),
            )
          ],
        ),
      ),
    );
  }

  int currentPos = 0;
  Widget carouselSlider(BuildContext context) {
    return imgList.isNotEmpty
        ? Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            CarouselSlider.builder(
              itemCount: imgList.length,
              options: CarouselOptions(
                  autoPlayInterval: const Duration(seconds: 5),
                  pageSnapping: true,
                  autoPlay: true,
                  height: 200,
                  enableInfiniteScroll: true,
                  autoPlayAnimationDuration: const Duration(milliseconds: 3000),
                  viewportFraction: 1,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentPos = index;
                    });
                  }),
              itemBuilder: ((context, index, realIndex) => Padding(
                    padding: EdgeInsets.only(left: 15, right: 15, top: 10),
                    child: SliderImageWidget(
                      imagePath: imgList[index],
                      topLeftRound: 30,
                      topRightRound: 30,
                    ),
                  )),
            ),
          ])
        : Container();
  }
}

class TabsDataListWidget extends StatelessWidget {
  const TabsDataListWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        padding: EdgeInsets.all(15),
        shrinkWrap: true,
        itemCount: 3,
        separatorBuilder: (context, index) => SizedBox(
              height: 10,
            ),
        itemBuilder: (BuildContext context, int index) {
          return Container(
            height: 30.h,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(13)),
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.white, ColorConstant.lightGrey2])),
            child: Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      flex: 4,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(25),
                                topRight: Radius.circular(25))),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(13),
                              topRight: Radius.circular(13)),
                          child: ImageWidget(
                            imageUrl:
                                "https://fastly.picsum.photos/id/42/3456/2304.jpg?hmac=dhQvd1Qp19zg26MEwYMnfz34eLnGv8meGk_lFNAJR3g",
                            errorIconColor: ColorConstant.gainsboro,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "MIRACLE GARDEN",
                              style: AppStyle.txtRobotoBold16DarkJungleGreen(
                                      context)
                                  .copyWith(
                                      fontSize: 15.sp,
                                      color: ColorConstant.fuscousGrey),
                            ),
                            Text(
                              "Instant Confirmation • Flexible • Free Cancellation",
                              style: AppStyle.txtRobotoMedium16DarkJungleGreen(
                                      context)
                                  .copyWith(
                                      fontSize: 13.sp,
                                      color: ColorConstant.santaGrey),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(children: [
                                    TextSpan(
                                        text: 'From',
                                        style: AppStyle
                                                .txtRobotoBold16DarkJungleGreen(
                                                    context)
                                            .copyWith(
                                                fontSize: 15.sp,
                                                color: ColorConstant.darkGold)),
                                    TextSpan(
                                        text: ' AED 182 / ',
                                        style: AppStyle
                                                .txtRobotoBold16DarkJungleGreen(
                                                    context)
                                            .copyWith(
                                                fontSize: 15.sp,
                                                color: ColorConstant.darkGold)),
                                  ]),
                                ),
                                Text('Per Person',
                                    style:
                                        AppStyle.txtRobotoBold16DarkJungleGreen(
                                                context)
                                            .copyWith(
                                                fontSize: 12.sp,
                                                color: ColorConstant.darkGold))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: FavoriteIconWidget(
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          );
        });
  }
}
