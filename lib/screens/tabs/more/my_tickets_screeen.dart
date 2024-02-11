import '../../../utils/app_export.dart';

class MyTicketsScreen extends StatefulWidget {
  const MyTicketsScreen({super.key});

  @override
  State<MyTicketsScreen> createState() => _MyTicketsScreenState();
}

class _MyTicketsScreenState extends State<MyTicketsScreen> {
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: TextValue.myTickets,
      ),
      body: MainBackgroundWidget(
        sizes: sizes,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const CircleContainerWithIconWidget(
                    child: Icon(
                  Icons.airplane_ticket,
                  color: Colors.white,
                  size: 70,
                )),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  TextValue.ticketsSavedHere,
                  style: AppStyle.txtRobotoBold16DarkJungleGreen(context)
                      .copyWith(fontSize: 17.sp),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  TextValue.ticketsDesc,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: ColorConstant.santaGrey,
                    fontWeight: FontWeight.normal,
                    fontSize: 16.sp,
                  ),
                ),
                // SizedBox(
                //   height: 4.h,
                // ),
                // DefaultButtonWidget(
                //   width: 30.w,
                //   buttonText: TextValue.goBack,
                //   onPressed: () {
                //     Navigator.of(context).pop();
                //   },
                //   textSize: 16,
                //   singleColor: ColorConstant.purpleJam,
                // ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 1.h,
                ),
                Image.asset(
                  'assets/images/Icone_Caribouni-01.png',
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
