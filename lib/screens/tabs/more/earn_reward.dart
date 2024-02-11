import 'package:caribouni/screens/tabs/more/RedeemHistory.dart';
import 'package:caribouni/screens/tabs/more/ReferFriendDialog.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:flutter/material.dart';

class EarnReward extends StatelessWidget {
  const EarnReward({super.key});

  @override
  Widget build(BuildContext context) {
    List firstone = [
      {
        "title": 'Refer First Friend!',
        "subtitle":
            'You’ll earn 5 Point when they download Caribouni App and register.',
        "navigator": NotificationScreen(),
      },
      {
        "title": 'First Spend for Ticket',
        "subtitle": 'Make the first order',
        "navigator": MyAdsScreen(),
      },
      {
        "title": 'Rating & Reviews activities',
        "subtitle": 'Make review on our attractions or events',
        "navigator": MyTicketsScreen(),
      },
      {
        "title": 'Rating Our App',
        "subtitle": 'Make review on our app in playstore',
        "navigator": MyTicketsScreen(),
      },
      {
        "title": 'Join our App Feedback Team',
        "subtitle": 'Help make our app better',
        "navigator": Container(),
      },
    ];
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 300,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Container(
                      height: 250,
                      alignment: Alignment.topLeft,
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20)),
                        gradient: LinearGradient(
                          colors: [
                            Color(0xFFB37A2B),
                            Color(0xFFF8DA68),
                          ],
                        ),
                      ),
                      child: Container(
                        height: 100,
                        padding:
                            const EdgeInsets.only(top: 40, left: 10, right: 20),
                        alignment: Alignment.topLeft,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const BackButtonWidget(),
                            Row(
                              children: [
                                Image.asset(
                                  'assets/images/gift.png',
                                  scale: 2.3,
                                ),
                                Text(
                                  '  Earn Reward',
                                  style: GoogleFonts.roboto(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                            Container()
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Image.asset(
                        'assets/images/cards.png',
                        scale: 2.3,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(20),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          PersistentNavBarNavigator.pushNewScreen(context,
                              screen: const RedeemHistory(), withNavBar: false);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(4),
                          height: 70,
                          decoration: BoxDecoration(
                              color: Colors.grey.shade200,
                              borderRadius: BorderRadius.circular(25),
                              border: Border.all(color: Colors.purple)),
                          child: Row(
                            children: [
                              Image.asset(
                                'assets/images/cup.png',
                                scale: 2,
                              ),
                              Expanded(
                                child: Text(
                                  'Redeem History',
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                  style: GoogleFonts.roboto(
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: Colors.purple)),
                        child: Row(
                          children: [
                            Image.asset(
                              'assets/images/pho.png',
                              scale: 2,
                            ),
                            Expanded(
                              child: Text(
                                'How to earn point?',
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: GoogleFonts.roboto(
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ListView.separated(
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(0),
                    shrinkWrap: true,
                    itemCount: firstone.length,
                    separatorBuilder: (context, index) => Divider(
                          height: 8,
                          color: ColorConstant.gainsboro,
                          thickness: 2,
                        ),
                    itemBuilder: (BuildContext context, int index) {
                      return InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => ReferFriendDialog());
                            // PersistentNavBarNavigator.pushNewScreen(context,
                            //     screen: firstone[index]["navigator"],
                            //     withNavBar: false);
                          },
                          child: ListTile(
                            minLeadingWidth: 0,
                            leading: CircleAvatar(
                              radius: 25,
                              backgroundColor: Colors.grey.shade100,
                            ),
                            title: Text(
                              firstone[index]["title"],
                              style: GoogleFonts.roboto(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Colors.purple,
                              ),
                            ),
                            subtitle: Text(
                              firstone[index]["subtitle"],
                              style: GoogleFonts.roboto(
                                fontSize: 12,
                              ),
                            ),
                            trailing: CircleAvatar(
                              radius: 15,
                              backgroundColor: Colors.amber,
                              child: Text(
                                '+5',
                                style: GoogleFonts.roboto(
                                  fontSize: 16,
                                  fontWeight: FontWeight.normal,
                                  color: Colors.purple,
                                ),
                              ),
                            ),
                          ));
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
