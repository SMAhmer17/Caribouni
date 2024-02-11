import '../../../utils/app_export.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    final sizes = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBarCustomWidget(
        title: TextValue.notifications,
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
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 70,
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
                  TextValue.noNotification,
                  style: AppStyle.txtRobotoBold16DarkJungleGreen(context)
                      .copyWith(fontSize: 17.sp),
                ),
                SizedBox(
                  height: 4.h,
                ),
                DefaultButtonWidget(
                  width: 30.w,
                  buttonText: TextValue.goBack,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  textSize: 16,
                  singleColor: ColorConstant.purpleJam,
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'assets/images/Icone_Caribouni-01.png',
                ),
                SizedBox(
                  height: 6.h,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
