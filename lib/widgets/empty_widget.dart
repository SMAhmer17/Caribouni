import '../utils/app_export.dart';

class EmptyWidget extends StatelessWidget {
  const EmptyWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleContainerWithIconWidget(
              child: Image.asset(
                'assets/images/Icon open-list-rich.png',
                color: Colors.white,
                fit: BoxFit.cover,
                height: 40,
              ),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              TextValue.noAds,
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
    );
  }
}
