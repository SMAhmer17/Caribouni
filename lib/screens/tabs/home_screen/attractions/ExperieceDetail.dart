import 'package:caribouni/utils/app_export.dart';

class ExperienceDetail extends StatelessWidget {
  const ExperienceDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: "Experience",
        isMultiText: false,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                'Overview',
                style: AppStyle.txtRobotoBold18White(context)
                    .copyWith(color: ColorConstant.darkViolet),
              ),
            ),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                '\n\u2023 Head to the top of Burj Khalifa with “At The Top” entrance tickets.\n\u2023 Get uninterrupted 360° views of Dubai and its surroundings.\n\u2023 Upload memories of your experience with free Wi-Fi throughout.\n\u2023 Tour the 148th floor with a Guest Ambassador.',
                textAlign: TextAlign.justify,
                style: AppStyle.txtRobotoRegular16SantaGrey(context).copyWith(
                    color: Colors.black54,
                    fontSize: 14,
                    fontWeight: FontWeight.w300),
              ),
            ),
            const SizedBox(
              height: 20,
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
                'Good to Know',
                style: AppStyle.txtRobotoBold18White(context)
                    .copyWith(color: ColorConstant.darkViolet),
              ),
            ),
            const SizedBox(
              height: 10,
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
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    text: TextSpan(
                        text: 'Level 124: ',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.black, fontSize: 16),
                        children: [
                      TextSpan(
                        text:
                            ' Be thrilled by the world’s fastest double-deck elevators, cruising at 10m/s. Take a closer look at the world below through avant-garde, high powered, telescopes. Step out onto the public outdoor observation terrace overlooking the ever-growing skyline.',
                        style: AppStyle.txtRobotoRegular16SantaGrey(context)
                            .copyWith(color: Colors.black, fontSize: 16),
                      )
                    ]))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    text: TextSpan(
                        text: 'Level 125: ',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.black, fontSize: 16),
                        children: [
                      TextSpan(
                        text:
                            'At 456 meters, Level 125 offers a spacious deck tastefully decorated in Arabic mashrabiya for stunning 360-degree views. Capture your Burj Khalifa moments forever and integrate reality and special effects with green screen photography. Set off on a virtual reality experience to the pinnacle of Burj Khalifa. Enjoy a new immersive experience; step on an inspired glass-floor with a twist. Feel the glass crack underneath your feet, as you explore the lofty heights from 456 meters in the air.',
                        style: AppStyle.txtRobotoRegular16SantaGrey(context)
                            .copyWith(color: Colors.black, fontSize: 16),
                      )
                    ]))),
            Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: RichText(
                    text: TextSpan(
                        text: 'Level 148: ',
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: Colors.black, fontSize: 16),
                        children: [
                      TextSpan(
                        text:
                            ' Enjoy a personalized tour, guided by a Guest Ambassador. Step out onto the world’s highest observation deck with an outdoor terrace at 555 meters. Refresh yourself with signature refreshments at SKY lounge.',
                        style: AppStyle.txtRobotoRegular16SantaGrey(context)
                            .copyWith(color: Colors.black, fontSize: 16),
                      )
                    ]))),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
