// ignore_for_file: use_key_in_widget_constructors

import 'package:caribouni/provider/Authentication.dart';
import 'package:caribouni/screens/tabs/more_screen.dart';
import 'package:provider/provider.dart';

import '../../../utils/app_export.dart';

class MyProfileScreen extends StatefulWidget {
  @override
  State<MyProfileScreen> createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const AppBarWidget(title: TextValue.setting),
      body: SingleChildScrollView(
        child: MainBackgroundWidget(
          sizes: sizes,
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ContainerWhiteRoundedWidget(
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: ChangeNameScreen(), withNavBar: false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: TitleDescWithIconsOptionWidget(
                          isMedium: true,
                          title: "${TextValue.change} ${TextValue.name}",
                          desc: "",
                          descIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorConstant.purpleJam,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                      color: ColorConstant.gainsboro,
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: ChangePasswordScreen(), withNavBar: false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: TitleDescWithIconsOptionWidget(
                          isMedium: true,
                          title: "${TextValue.change} ${TextValue.password}",
                          desc: "",
                          descIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorConstant.purpleJam,
                          ),
                        ),
                      ),
                    ),
                    Divider(
                      height: 0,
                      color: ColorConstant.gainsboro,
                      thickness: 2,
                    ),
                    InkWell(
                      onTap: () {
                        PersistentNavBarNavigator.pushNewScreen(context,
                            screen: ChangePhoneNumberScreen(),
                            withNavBar: false);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(13),
                        child: TitleDescWithIconsOptionWidget(
                          titleFlex: 2,
                          isMedium: true,
                          title: "${TextValue.change} ${TextValue.phoneNumber}",
                          desc: "",
                          descIcon: Icon(
                            Icons.arrow_forward_ios,
                            color: ColorConstant.purpleJam,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(0),
                child: ContainerWhiteRoundedWidget(
                  child: ListView.separated(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.all(0),
                      shrinkWrap: true,
                      itemCount: secondone.length,
                      separatorBuilder: (context, index) => Divider(
                            height: 0,
                            color: ColorConstant.gainsboro,
                            thickness: 2,
                          ),
                      itemBuilder: (BuildContext context, int index) {
                        return InkWell(
                          onTap: () {
                            if (index == 0) {
                              bottomSheetWidget(context,
                                  "${TextValue.select} ${TextValue.currency}");
                            } else if (index == 1) {
                              bottomSheetWidget(context,
                                  "${TextValue.select} ${TextValue.language}");
                            } else if (index == 3) {
                              PersistentNavBarNavigator.pushNewScreen(context,
                                  screen: ChatWithUsScreen(),
                                  withNavBar: false);
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(12),
                            child: TitleDescWithIconsOptionWidget(
                              isMedium: true,
                              titleIcon: Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: secondone[index]["icon"]),
                              title: secondone[index]["title"],
                              desc: secondone[index]["desc"],
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
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: ColorConstant.darkGold,
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(25)),
                  ),
                  child: Text(
                    TextValue.deleteAccount,
                    style: AppStyle.txtRobotoBold16DarkJungleGreen(context)
                        .copyWith(color: ColorConstant.darkGold),
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: () {},
                      child: Image.asset('assets/images/Group 20.png')),
                  TextButton(
                      onPressed: () {},
                      child: Image.asset('assets/images/Group 21.png')),
                  TextButton(
                      onPressed: () {},
                      child: Image.asset('assets/images/Group 22.png')),
                ],
              ),
              const Spacer()
            ],
          ),
        ),
      ),
    );
  }

  List secondone = [
    {
      "title": 'Currency',
      "icon": Icon(
        Icons.currency_exchange_rounded,
        color: ColorConstant.santaGrey,
        size: 25,
      ),
      "desc": "AED"
    },
    {
      "title": 'Language',
      "icon": Image.asset(
        'assets/images/language.png',
        color: ColorConstant.santaGrey,
        height: 25,
      ),
      "desc": "English (US)"
    },
    {
      "title": 'Contact Us',
      "icon": Image.asset(
        'assets/images/Icon feather-mail.png',
        color: ColorConstant.santaGrey,
        height: 25,
      ),
      "desc": ""
    },
    {
      "title": 'Chat with Us',
      "icon": Icon(
        Icons.chat_bubble_outline,
        color: ColorConstant.santaGrey,
        size: 25,
      ),
      "desc": ""
    },
    {
      "title": 'Terms & Conditions',
      "icon": Image.asset(
        'assets/images/Group 16422.png',
        color: ColorConstant.santaGrey,
        height: 25,
      ),
      "desc": ""
    },
    {
      "title": 'Privacy Policy',
      "icon": Icon(
        Icons.privacy_tip_rounded,
        color: ColorConstant.santaGrey,
        size: 25,
      ),
      "desc": ""
    },
  ];
  void bottomSheetWidget(BuildContext context, String title) {
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
              padding: EdgeInsets.all(20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: EdgeInsets.all(3),
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: ColorConstant.santaGrey,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(title,
                      textAlign: TextAlign.left,
                      style: AppStyle.txtRobotoBold20PurpleJam(context)
                          .copyWith(color: ColorConstant.fuscousGrey)),
                  SizedBox(
                    height: 20,
                  ),
                  title.endsWith(TextValue.currency)
                      ? ConatainerWithDataWidget(
                          image: 'assets/images/197484.png',
                          title: "Dollar (USD)",
                          desc: "Dollar (USD)")
                      : ConatainerWithDataWidget(
                          image: 'assets/images/197484.png',
                          title: "English (US)",
                          isShowIcon: true,
                          isSelected: true,
                        ),
                  SizedBox(
                    height: 20,
                  ),
                  title.endsWith(TextValue.currency)
                      ? ConatainerWithDataWidget(
                          image: 'assets/images/flag_uae.png',
                          title: "Dirham Emirati",
                          desc: "AED")
                      : ConatainerWithDataWidget(
                          image: 'assets/images/flag_uae.png',
                          title: "English (US)Arabic",
                          isShowIcon: true,
                          isSelected: false,
                        ),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            );
          });
        });
  }
}
