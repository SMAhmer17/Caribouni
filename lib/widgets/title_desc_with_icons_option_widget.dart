import '../utils/app_export.dart';

class TitleDescWithIconsOptionWidget extends StatelessWidget {
  const TitleDescWithIconsOptionWidget({
    this.titleIcon,
    required this.title,
    required this.desc,
    this.descIcon,
    this.descTextColor,
    this.isMedium = false,
    this.titleFlex = 1,
    super.key,
  });

  final String title;
  final String desc;
  final Widget? titleIcon;
  final Widget? descIcon;
  final Color? descTextColor;
  final bool isMedium;
  final int titleFlex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        titleIcon ?? Container(),
        Expanded(
          flex: titleFlex,
          child: Text(
            title,
            style: isMedium
                ? AppStyle.txtRobotoMedium16DarkJungleGreen(context)
                : AppStyle.txtRobotoBold16DarkJungleGreen(context),
          ),
        ),
        Expanded(
          flex: 1,
          child: Text(
            desc,
            textAlign: TextAlign.end,
            style: AppStyle.txtRobotoRegular16SantaGrey(context)
                .copyWith(color: descTextColor ?? ColorConstant.santaGrey),
          ),
        ),
        descIcon ?? Container(),
      ],
    );
  }
}
