import 'package:caribouni/screens/tabs/home_screen/ClubEvents/PremiumMusicEvent.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:flutter/material.dart';

class SpotliteDetail extends StatelessWidget {
  const SpotliteDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 00,
        automaticallyImplyLeading: false,
        backgroundColor: Colors.transparent,
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
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fill, image: AssetImage('assets/images/spot.png'))),
        child: Container(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/Group 16470.png',
                scale: 2,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  const Icon(
                    Icons.location_on_outlined,
                    color: Colors.white,
                  ),
                  Text(
                    'Barasti Opera House',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.roboto(
                      fontSize: 16,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Premium Staycation Package at Pan Pacific',
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Today at 8:30 PM',
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                'Here’s your reason for a staycation in Hanoi as soon as possible! Offering an intimate retreat, Pan Pacific Hanoi welcomes all…',
                textAlign: TextAlign.start,
                style: GoogleFonts.roboto(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Container(
                width: 500,
                height: 50,
                margin: const EdgeInsets.symmetric(
                  horizontal: 30,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
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
                      'Buy ticket - from 250 AED',
                      style: GoogleFonts.poppins(
                        color: Colors.orange.shade300,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      // PersistentNavBarNavigator.pushNewScreen(
                      //   context,
                      //   screen: const PremiumMusicEvent(),
                      //   withNavBar: false,
                      // );
                    }),
              ),
              const SizedBox(
                height: 15,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    SlideTransitionScreen(
                      enterPage: PremiumMusicEvent(),
                      exitPage: SpotliteDetail(),
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
                        'Discover more',
                        style: GoogleFonts.poppins(
                            color: Colors.orange.shade300,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SlideTransitionScreen extends PageRouteBuilder {
  final Widget enterPage;
  final Widget exitPage;

  SlideTransitionScreen({required this.enterPage, required this.exitPage})
      : super(
          transitionDuration: const Duration(milliseconds: 1500),
          pageBuilder: (context, animation, secondaryAnimation) => enterPage,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = const Offset(0.0, 1.0);
            var end = Offset.zero;
            var tween = Tween(begin: begin, end: end);
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        );
}
