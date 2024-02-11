// ignore_for_file: prefer_const_constructors

import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/screens/tabs/more/earn_reward.dart';
import 'package:provider/provider.dart';
import 'package:spring/spring.dart';

import '../../utils/app_export.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({super.key});

  @override
  State<MoreScreen> createState() => _MoreScreenState();
}

class _MoreScreenState extends State<MoreScreen> {
  final SpringController springController =
      SpringController(initialAnim: Motion.play);
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Consumer<Authentication>(builder: (context, auth, _) {
        return MainBackgroundWidget(
          horizontal: 0,
          sizes: sizes,
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      width: MediaQuery.of(context).size.width,
                      height: 60,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              color: Colors.purple.shade50, width: 2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: EarnReward(), withNavBar: false);
                            },
                            child: Container(
                              height: 60,
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  color: Colors.purple.shade50,
                                  border:
                                      Border.all(color: Colors.purple.shade50)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'My Rewards Program',
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: GoogleFonts.roboto(
                                      color: Color(0XFF712B8F),
                                      fontWeight: FontWeight.normal,
                                      fontSize: 14.sp,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Image.asset(
                                    'assets/images/logoo.png',
                                    scale: 2.5,
                                  )
                                ],
                              ),
                            ),
                          ),
                          Container(
                            height: 60,
                            padding: EdgeInsets.symmetric(horizontal: 4),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      'Points Earned:',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        color: Color(0XFF712B8F),
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    Text(
                                      '+20',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: GoogleFonts.roboto(
                                        color: Colors.amber,
                                        fontWeight: FontWeight.normal,
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                Image.asset(
                                  'assets/images/girl.png',
                                  scale: 2.5,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 30, left: 20, right: 20),
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: ColorConstant.gainsboro,
                        ),
                        borderRadius:
                            const BorderRadius.all(Radius.circular(25)),
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white,
                            ColorConstant.dawnPink,
                          ],
                        ),
                      ),
                      child: Column(
                        children: [
                          TitleDescWithIconsOptionWidget(
                              title: TextValue.userNamme,
                              desc: auth.currentUser!.data.name),
                          const SizedBox(
                            height: 15,
                          ),
                          TitleDescWithIconsOptionWidget(
                              title: TextValue.phoneNumber,
                              desc: auth.currentUser!.data.phone),
                          const SizedBox(
                            height: 15,
                          ),
                          TitleDescWithIconsOptionWidget(
                              title: TextValue.email,
                              desc: auth.currentUser!.data.email),
                          const SizedBox(
                            height: 10,
                          ),
                          TitleDescWithIconsOptionWidget(
                            titleIcon: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                FontAwesomeIcons.facebook,
                                color: ColorConstant.azure,
                                size: 20,
                              ),
                            ),
                            title: TextValue.facebook,
                            desc: TextValue.linked,
                            descTextColor: ColorConstant.purpleJam,
                            descIcon: Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Transform.rotate(
                                angle: 90,
                                child: Icon(
                                  Icons.link,
                                  color: ColorConstant.purpleJam,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TitleDescWithIconsOptionWidget(
                            titleIcon: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Image.asset(
                                'assets/images/gmail.png',
                                fit: BoxFit.contain,
                                height: 15,
                              ),
                            ),
                            title: TextValue.gooleAccount,
                            desc: TextValue.unlink,
                            descIcon: Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Transform.rotate(
                                angle: 90,
                                child: Icon(
                                  Icons.link_off,
                                  color: ColorConstant.santaGrey,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          TitleDescWithIconsOptionWidget(
                            titleIcon: Padding(
                              padding: const EdgeInsets.only(right: 5),
                              child: Icon(
                                FontAwesomeIcons.apple,
                                color: ColorConstant.darkJungleGreen,
                                size: 20,
                              ),
                            ),
                            title: TextValue.appleAccount,
                            desc: TextValue.unlink,
                            descIcon: Padding(
                              padding: const EdgeInsets.only(left: 2),
                              child: Transform.rotate(
                                angle: 90,
                                child: Icon(
                                  Icons.link_off,
                                  color: ColorConstant.santaGrey,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ContainerWhiteRoundedWidget(
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: firstone.length,
                            separatorBuilder: (context, index) => Divider(
                                  height: 0,
                                  color: ColorConstant.gainsboro,
                                  thickness: 2,
                                ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: firstone[index]["navigator"],
                                      withNavBar: false);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: TitleDescWithIconsOptionWidget(
                                    isMedium: true,
                                    titleIcon: Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: firstone[index]["icon"]),
                                    title: firstone[index]["title"],
                                    desc: "",
                                    descIcon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ColorConstant.purpleJam,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: ContainerWhiteRoundedWidget(
                        child: ListView.separated(
                            physics: const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.all(0),
                            shrinkWrap: true,
                            itemCount: 1,
                            separatorBuilder: (context, index) => Divider(
                                  height: 0,
                                  color: ColorConstant.gainsboro,
                                  thickness: 2,
                                ),
                            itemBuilder: (BuildContext context, int index) {
                              return InkWell(
                                onTap: () {
                                  PersistentNavBarNavigator.pushNewScreen(
                                      context,
                                      screen: MyProfileScreen(),
                                      withNavBar: false);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(12),
                                  child: TitleDescWithIconsOptionWidget(
                                    isMedium: true,
                                    titleIcon: Padding(
                                      padding: const EdgeInsets.only(right: 10),
                                      child: Icon(
                                        Icons.settings_outlined,
                                        color: ColorConstant.santaGrey,
                                        size: 25,
                                      ),
                                    ),
                                    title: 'Settings',
                                    desc: "",
                                    descIcon: Icon(
                                      Icons.arrow_forward_ios,
                                      color: ColorConstant.purpleJam,
                                      size: 20,
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Provider.of<Authentication>(context, listen: false)
                            .logout();
                      },
                      child: Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 25),
                          child: RoundedBorderWithIconTextWidget(
                              icon: Icons.power_settings_new_outlined,
                              title: TextValue.logOut),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
              Container(
                height: 19.h,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/header_cut.png'),
                      fit: BoxFit.cover),
                ),
                padding: const EdgeInsets.only(left: 25, top: 20),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: Colors.white,
                          ),
                          shape: BoxShape.circle,
                        ),
                        child: ProfileGradientWidget(
                          margin: 0,
                          size: 70,
                          imageUrl: auth.currentUser!.data.image,
                        ),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              TextValue.hello,
                              style: AppStyle.txtRobotoBold20PurpleJam(context)
                                  .copyWith(fontSize: 18.sp),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Text(
                              auth.currentUser!.data.name,
                              style: AppStyle.txtRobotoBold20PurpleJam(context)
                                  .copyWith(
                                      fontSize: 18.sp, color: Colors.white),
                            ),
                            SizedBox(
                              height: 0.7.h,
                            ),
                            const LocationWithIconWidget(
                                location: TextValue.yourLocationNow)
                          ],
                        ),
                      )
                    ]),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AppBar(
                    automaticallyImplyLeading: false,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    actions: [
                      Spring.slide(
                        springController: springController,
                        slideType: SlideType.slide_in_left,
                        delay: Duration(milliseconds: 500),
                        animDuration: Duration(milliseconds: 1000),
                        curve: Curves.linearToEaseOut,
                        extend: 30,
                        withFade: true,
                        animStatus: (AnimStatus status) {},
                        child: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Image.asset(
                            'assets/images/Weather.png',
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      }),
    );
  }

  List firstone = [
    {
      "title": 'Notification',
      "icon": Icon(
        Icons.notifications_none,
        color: ColorConstant.santaGrey,
        size: 25,
      ),
      "navigator": NotificationScreen(),
    },
    {
      "title": 'My Ads',
      "icon": Image.asset(
        'assets/images/Icon open-list-rich.png',
        color: ColorConstant.santaGrey,
        height: 25,
      ),
      "navigator": MyAdsScreen(),
    },
    {
      "title": 'My Tickets',
      "icon": Icon(
        Icons.airplane_ticket,
        color: ColorConstant.santaGrey,
        size: 25,
      ),
      "navigator": MyTicketsScreen(),
    },
    {
      "title": 'My Reviews',
      "icon": Icon(
        Icons.reviews_outlined,
        color: ColorConstant.santaGrey,
        size: 25,
      ),
      "navigator": MyTicketsScreen(),
    },
  ];
}

class ConatainerWithDataWidget extends StatelessWidget {
  final String image;
  final String title;
  final String? desc;
  final bool isShowIcon;
  final bool isSelected;
  const ConatainerWithDataWidget({
    super.key,
    required this.image,
    required this.title,
    this.desc,
    this.isShowIcon = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return ContainerWidget(
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              image,
              width: 30,
              height: 30,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Text(title,
              style: AppStyle.txtRobotoMedium16DarkJungleGreen(context)
                  .copyWith(color: ColorConstant.fuscousGrey)),
          Spacer(),
          isShowIcon
              ? Icon(
                  Icons.check_circle,
                  color: isSelected
                      ? ColorConstant.irishGreen
                      : ColorConstant.lightGrey,
                )
              : Container(),
          Text(desc ?? "",
              style: AppStyle.txtRobotoBold16DarkJungleGreen(context)
                  .copyWith(color: ColorConstant.purpleJam)),
        ],
      ),
    );
  }
}

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient:
                LinearGradient(colors: [Colors.white, ColorConstant.dawnPink])),
        child: child);
  }
}
