import 'package:caribouni/screens/tabs/more/ClamDialog.dart';
import 'package:caribouni/utils/app_export.dart';
import 'package:flutter/material.dart';

class RedeemHistory extends StatelessWidget {
  const RedeemHistory({super.key});

  @override
  Widget build(BuildContext context) {
    List firstone = [
      {
        "title": 'Refer First Friend!',
        "subtitle": 'New Account Register',
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
      appBar: AppBarCustomWidget(title: 'Redeem History'),
      body: Column(
        children: [
          ElevatedButton(
              style: ButtonStyle(
                  overlayColor:
                      MaterialStateProperty.all<Color>(Colors.white10),
                  elevation: MaterialStateProperty.all<double>(5),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.white54),
                  fixedSize:
                      MaterialStateProperty.all<Size>(const Size(200, 30)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)))),
              onPressed: () {},
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    'assets/images/gift.png',
                    scale: 2.8,
                    color: Colors.purple,
                  ),
                  Text(
                    ' Earn Reward',
                    style: GoogleFonts.roboto(
                      fontSize: 20,
                      fontWeight: FontWeight.normal,
                      color: Colors.purple,
                    ),
                  ),
                ],
              )),
          const SizedBox(
            height: 20,
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
                            builder: (context) => ClaimDialog());
                        // PersistentNavBarNavigator.pushNewScreen(context,
                        //     screen: firstone[index]["navigator"],
                        //     withNavBar: false);
                      },
                      child: ListTile(
                        enabled: false,
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
    );
  }
}
