// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:dotted_border/dotted_border.dart';

import '../../../../utils/app_export.dart';
import 'add_rent.dart';

class DetailsAdRent extends StatefulWidget {
  const DetailsAdRent({super.key});

  @override
  State<DetailsAdRent> createState() => _DetailsAdRentState();
}

class _DetailsAdRentState extends State<DetailsAdRent> {
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          "6,500 AED",
                          style: AppStyle.txtRobotoBold18White(context)
                              .copyWith(color: ColorConstant.darkGold),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Master bedroom available in JVC ! All bill included",
                        style: AppStyle.txtRobotoBold18White(context).copyWith(
                            color: ColorConstant.darkJungleGreen,
                            fontSize: 19.sp),
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
                          location:
                              "JVC District 10, Jumeirah Village Circle (JVC), Dubai",
                          color: ColorConstant.santaGrey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        TextValue.propertyDetails,
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
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
                            return Column(
                              children: [
                                Padding(
                                  padding:
                                      const EdgeInsets.only(top: 20, bottom: 8),
                                  child: TitleDescWithIconsOptionWidget(
                                    title: list[index]["title"],
                                    desc: list[index]["desc"],
                                  ),
                                ),
                              ],
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
                        TextValue.description,
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
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        TextValue.amenties,
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.all(10),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: amenties.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ChipWidget(
                            label: amenties[index],
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          childAspectRatio: 3,
                          crossAxisCount: 2),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Tenants Allowed',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GridView.builder(
                      padding: EdgeInsets.all(10),
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: tennuts.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 5),
                          child: ChipWidget(
                            label: tennuts[index],
                          ),
                        );
                      },
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          childAspectRatio: 3,
                          crossAxisCount: 2),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Center(
                      child: RoundedBorderWithIconTextWidget(
                          icon: Icons.delete_forever,
                          title: TextValue.deleteAd),
                    ),
                  ],
                ),
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 10.h,
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            Container(
              height: 6.h,
              color: Color(0XFFDED6E3),
            ),
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
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 3.h,
                      ),
                      TextButton(
                        onPressed: () {
                          RouteTransition(
                              context: context,
                              child: AddRent(),
                              animation: AnimationType.fadeIn,
                              duration: Duration(milliseconds: 200),
                              repacement: true);
                        },
                        child: DottedBorder(
                          borderType: BorderType.RRect,
                          radius: Radius.circular(12),
                          dashPattern: [
                            4,
                            3,
                          ],
                          strokeWidth: 2,
                          padding: EdgeInsets.all(6),
                          color: Color(0XFF712B8F),
                          child: ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 2.w),
                              child: Text(
                                'Edit your Ad',
                                style: GoogleFonts.roboto(
                                  color: Color(0XFF712B8F),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  FloatingActionButton(
                    onPressed: () {},
                    heroTag: "1",
                    child: Container(
                      height: 8.h,
                      width: 18.w,
                      padding: EdgeInsets.symmetric(horizontal: 3.5.w),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFF8DA68),
                            Color(0xFFB37A2B),
                          ],
                        ),
                      ),
                      child: Image.asset(
                        'assets/images/Group 161800.png',
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  FloatingActionButton(
                    heroTag: "2",
                    onPressed: () {},
                    backgroundColor: Colors.white,
                    child: Image.asset('assets/images/Group 161788.png'),
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
