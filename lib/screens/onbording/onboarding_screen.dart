// ignore_for_file: deprecated_member_use, prefer_const_constructors, sort_child_properties_last, prefer_const_literals_to_create_immutables, unused_import, use_key_in_widget_constructors, library_private_types_in_public_api, sized_box_for_whitespace, avoid_unnecessary_containers

import 'package:custom_route_transition_j/custom_route_transition_j.dart';
import 'package:spring/spring.dart';
import '../../utils/app_export.dart';
import '../auth_screens/sign_in_screen.dart';
import 'content_model.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  int currentIndex = 0;
  PageController? _controller;
  final SpringController springController =
      SpringController(initialAnim: Motion.play);

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller!.dispose();
    super.dispose();
  }

  List<String> topWatermark = [
    TextValue.buyOrRent,
    TextValue.restaurants,
    TextValue.nightLife
  ];
  List<String> bottomWatermark = [
    TextValue.realEstate,
    TextValue.attractions,
    TextValue.events
  ];

  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _controller,
              itemCount: contents.length,
              onPageChanged: (int index) {
                setState(() {
                  currentIndex = index;
                });
              },
              itemBuilder: (_, i) {
                return Padding(
                  padding: const EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Wrap(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: sizes.height,
                                width: sizes.width,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                      contents[i].image1,
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Spring.slide(
                            springController: springController,
                            slideType: SlideType.slide_in_left,
                            delay: Duration(milliseconds: 500),
                            animDuration: Duration(milliseconds: 1000),
                            curve: Curves.linearToEaseOut,
                            extend: 30,
                            withFade: true,
                            animStatus: (AnimStatus status) {},
                            child: Container(
                              height: currentIndex == 0
                                  ? sizes.height - 276
                                  : currentIndex == 2
                                      ? sizes.height - 320
                                      : sizes.height - 230,
                              width: sizes.width,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                    contents[i].image2,
                                  ),
                                  fit: BoxFit.contain,
                                ),
                              ),
                              child: currentIndex == 0
                                  ? Container()
                                  : Spring.slide(
                                      springController: springController,
                                      slideType: SlideType.slide_in_left,
                                      delay: Duration(milliseconds: 500),
                                      animDuration:
                                          Duration(milliseconds: 1000),
                                      curve: Curves.linearToEaseOut,
                                      extend: 30,
                                      withFade: true,
                                      animStatus: (AnimStatus status) {},
                                      child: Container(
                                        height: 200,
                                        width: 200,
                                        margin: currentIndex == 2
                                            ? EdgeInsets.only(
                                                left: 130, bottom: 30, top: 130)
                                            : EdgeInsets.only(
                                                left: 210,
                                                bottom: 90,
                                                top: 200),
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                            image: AssetImage(
                                              contents[i].image3,
                                            ),
                                            fit: BoxFit.contain,
                                          ),
                                        ),
                                      ),
                                    ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Spring.slide(
                            springController: springController,
                            slideType: currentIndex == 1
                                ? SlideType.slide_in_bottom
                                : SlideType.slide_in_left,
                            delay: Duration(milliseconds: 500),
                            animDuration: Duration(milliseconds: 1000),
                            curve: Curves.linearToEaseOut,
                            extend: 30,
                            withFade: true,
                            animStatus: (AnimStatus status) {},
                            child: Container(
                              width: sizes.width,
                              child: Text(
                                contents[i].title,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 20,
                                  color: Color(0XFF7E0EBD),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Spring.slide(
                            springController: springController,
                            slideType: SlideType.slide_in_right,
                            delay: Duration(milliseconds: 500),
                            animDuration: Duration(milliseconds: 1000),
                            curve: Curves.linearToEaseOut,
                            extend: 30,
                            withFade: true,
                            animStatus: (AnimStatus status) {},
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 30),
                              child: Text(
                                contents[i].discription,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: Color(0XFF574F4F),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: List.generate(
                                contents.length,
                                (index) => buildDot(index, context),
                              ),
                            ),
                          ),
                          Spring.slide(
                            springController: springController,
                            slideType: SlideType.slide_in_bottom,
                            delay: Duration(milliseconds: 500),
                            animDuration: Duration(milliseconds: 1000),
                            curve: Curves.linearToEaseOut,
                            extend: 30,
                            withFade: true,
                            animStatus: (AnimStatus status) {},
                            child: DefaultButtonWidget(
                                onPressed: () {
                                  if (currentIndex == contents.length - 1) {
                                    RouteTransition(
                                        context: context,
                                        child: SignInScreen(),
                                        animation: AnimationType.fadeIn,
                                        duration: const Duration(seconds: 1),
                                        repacement: true);
                                  }
                                  _controller!.nextPage(
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.bounceIn,
                                  );
                                },
                                buttonText: currentIndex == contents.length - 1
                                    ? TextValue.getStarted
                                    : TextValue.continueText),
                          ),
                          Spring.slide(
                            springController: springController,
                            slideType: SlideType.slide_in_right,
                            delay: Duration(milliseconds: 500),
                            animDuration: Duration(milliseconds: 1000),
                            curve: Curves.linearToEaseOut,
                            extend: 30,
                            withFade: true,
                            animStatus: (AnimStatus status) {},
                            child: Container(
                              width: sizes.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  topWatermark[currentIndex],
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 22,
                                    color: Color(0XFFDED6E3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Spring.slide(
                            springController: springController,
                            slideType: SlideType.slide_in_left,
                            delay: Duration(milliseconds: 500),
                            animDuration: Duration(milliseconds: 1000),
                            curve: Curves.linearToEaseOut,
                            extend: 30,
                            withFade: true,
                            animStatus: (AnimStatus status) {},
                            child: Container(
                              width: sizes.width,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 20),
                                child: Text(
                                  bottomWatermark[currentIndex],
                                  textAlign: TextAlign.right,
                                  style: GoogleFonts.poppins(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 30,
                                    color: Color(0XFFDED6E3),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      currentIndex == 1
                          ? Container()
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Spring.slide(
                                  springController: springController,
                                  slideType: SlideType.slide_in_bottom,
                                  delay: Duration(milliseconds: 500),
                                  animDuration: Duration(milliseconds: 1000),
                                  curve: Curves.linearToEaseOut,
                                  extend: 30,
                                  withFade: true,
                                  animStatus: (AnimStatus status) {},
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 30, vertical: 20),
                                    height: sizes.height - 700,
                                    width: sizes.width - 210,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/Layer_1.png'),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 10,
      width: 10,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: currentIndex == index ? Color(0XFF7E0EBD) : Color(0XFFDED6E3),
      ),
    );
  }
}
