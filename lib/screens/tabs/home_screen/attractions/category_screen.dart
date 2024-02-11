// ignore_for_file: prefer_const_constructors
import '../../../../utils/app_export.dart';

class CategoryScreen extends StatefulWidget {
  final String title;
  const CategoryScreen({super.key, required this.title});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  List attractions = [
    {"title": "CITY TOUR", "image": "assets/images/Group 16072.png"},
    {"title": "DAY TRIPS", "image": "assets/images/Group 16072.png"},
    {"title": "ADVENTURE", "image": "assets/images/Group 16072.png"},
    {"title": "THEME PARKS", "image": "assets/images/Group 16072.png"},
    {"title": "WATER ACTIVITIES", "image": "assets/images/Group 16072.png"},
    {"title": "SHOPPING MALLS", "image": "assets/images/Group 16072.png"},
    {"title": "EXTREME SPORTS", "image": "assets/images/Group 16072.png"},
    {"title": "ENTRY TICKETS", "image": "assets/images/Group 16072.png"},
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
        title: widget.title,
        isColorChange: true,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.all(15),
                shrinkWrap: true,
                itemCount: 10,
                separatorBuilder: (context, index) => SizedBox(
                      height: 10,
                    ),
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 28.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: ColorConstant.lightGrey1.withOpacity(0.5)),
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
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(13)),
                                    child: ImageWidget(
                                      imageUrl:
                                          "https://fastly.picsum.photos/id/57/2448/3264.jpg?hmac=ewraXYesC6HuSEAJsg3Q80bXd1GyJTxekI05Xt9YjfQ",
                                      errorIconColor: ColorConstant.gainsboro,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "MIRACLE GARDEN",
                                      style: AppStyle
                                              .txtRobotoBold16DarkJungleGreen(
                                                  context)
                                          .copyWith(
                                              fontSize: 15.sp,
                                              color: ColorConstant.fuscousGrey),
                                    ),
                                    Text(
                                      "Instant Confirmation • Flexible • Free Cancellation",
                                      style: AppStyle
                                              .txtRobotoMedium16DarkJungleGreen(
                                                  context)
                                          .copyWith(
                                              fontSize: 13.sp,
                                              color: ColorConstant.santaGrey),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        RatingBar.builder(
                                          initialRating: 3,
                                          minRating: 1,
                                          direction: Axis.horizontal,
                                          allowHalfRating: true,
                                          itemCount: 5,
                                          itemSize: 15,
                                          itemBuilder: (context, _) => Icon(
                                            Icons.star,
                                            color: ColorConstant.yellowOrange,
                                          ),
                                          onRatingUpdate: (rating) {
                                            print(rating);
                                          },
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          "3.0",
                                          style: AppStyle
                                                  .txtRobotoMedium16DarkJungleGreen(
                                                      context)
                                              .copyWith(
                                                  fontSize: 15.sp,
                                                  color:
                                                      ColorConstant.santaGrey),
                                        ),
                                        Spacer(),
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
                                                text: ' AED 220 / ',
                                                style: AppStyle
                                                        .txtRobotoBold16DarkJungleGreen(
                                                            context)
                                                    .copyWith(
                                                        fontSize: 15.sp,
                                                        color: ColorConstant
                                                            .darkGold)),
                                          ]),
                                        ),
                                        Text('Per Person',
                                            style: AppStyle
                                                    .txtRobotoBold16DarkJungleGreen(
                                                        context)
                                                .copyWith(
                                                    fontSize: 12.sp,
                                                    color:
                                                        ColorConstant.darkGold))
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.all(5),
                          child: FavoriteIconWidget(
                            onPressed: () {},
                          ),
                        ),
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
