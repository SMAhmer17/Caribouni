import '../../../utils/app_export.dart';
import '../home_screen/property_sale_tabs/details_ad_rent.dart';

class MyAdsScreen extends StatefulWidget {
  const MyAdsScreen({super.key});

  @override
  State<MyAdsScreen> createState() => _MyAdsScreenState();
}

class _MyAdsScreenState extends State<MyAdsScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: TextValue.myAds,
      ),
      body: MainBackgroundWidget(
        sizes: sizes,
        child: Column(
          children: [
            TabBar(
              controller: tabController,
              padding: const EdgeInsets.symmetric(vertical: 10),
              indicatorSize: TabBarIndicatorSize.label,
              labelStyle: AppStyle.txtRobotoMedium16DarkJungleGreen(context),
              indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: ColorConstant.purpleJam),
              labelColor: Colors.white,
              unselectedLabelColor: ColorConstant.purpleJam,
              tabs: [
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: ColorConstant.purpleJam, width: 1)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(TextValue.rents),
                    ),
                  ),
                ),
                Tab(
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        border: Border.all(
                            color: ColorConstant.purpleJam, width: 1)),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(TextValue.events),
                    ),
                  ),
                ),
              ],
            ),
            Divider(
              height: 0,
              color: ColorConstant.gainsboro,
              thickness: 2,
            ),
            Expanded(
              child: TabBarView(controller: tabController, children: [
                ListView.separated(
                    padding: EdgeInsets.only(top: 2.5.h, bottom: 2.5.h),
                    itemCount: 5,
                    separatorBuilder: (context, index) => SizedBox(
                          height: 2.5.h,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return ContainerWhiteRoundedWidget(
                        child: InkWell(
                          onTap: () => PersistentNavBarNavigator.pushNewScreen(
                            context,
                            screen: DetailsAdRent(),
                            withNavBar: false,
                          ),
                          child: SizedBox(
                            height: 20.h,
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Container(
                                      height: double.infinity,
                                      decoration: BoxDecoration(
                                        borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            bottomLeft: Radius.circular(25)),
                                        color: ColorConstant.boulder,
                                      ),
                                      child: const ClipRRect(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(25),
                                            bottomLeft: Radius.circular(25)),
                                        child: ImageWidget(
                                          imageUrl:
                                              "https://fastly.picsum.photos/id/20/3670/2462.jpg?hmac=CmQ0ln-k5ZqkdtLvVO23LjVAEabZQx2wOaT4pyeG10I",
                                        ),
                                      )),
                                ),
                                Expanded(
                                    flex: 4,
                                    child: Padding(
                                      padding: const EdgeInsets.all(10),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Expanded(
                                            flex: 1,
                                            child: Text(
                                              "Property title",
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                              style: AppStyle
                                                      .txtRobotoMedium16DarkJungleGreen(
                                                          context)
                                                  .copyWith(
                                                      color: ColorConstant
                                                          .purpleJam),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                "Description text",
                                                maxLines: 3,
                                                overflow: TextOverflow.ellipsis,
                                                style: AppStyle
                                                        .txtRobotoRegular16SantaGrey(
                                                            context)
                                                    .copyWith(
                                                        color: ColorConstant
                                                            .fuscousGrey,
                                                        fontSize: 14.sp),
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Row(
                                              children: [
                                                Expanded(
                                                  flex: 1,
                                                  child: Text(
                                                    "Last updated 3 mins ago",
                                                    maxLines: 3,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    style: AppStyle
                                                            .txtRobotoRegular16SantaGrey(
                                                                context)
                                                        .copyWith(
                                                            color: ColorConstant
                                                                .fuscousGrey,
                                                            fontSize: 12.sp),
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 1,
                                                  child: DefaultButtonWidget(
                                                    buttonText: "Edit your ad",
                                                    height: 45,
                                                    width: 45,
                                                    horizontal: 0,
                                                    vertical: 0,
                                                    onPressed: () {},
                                                    textColor:
                                                        ColorConstant.purpleJam,
                                                    textSize: 15.sp,
                                                    singleColor:
                                                        ColorConstant.gainsboro,
                                                  ),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ))
                              ],
                            ),
                          ),
                        ),
                      );
                    }),

                // EmptyWidget(),
                EmptyWidget(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
