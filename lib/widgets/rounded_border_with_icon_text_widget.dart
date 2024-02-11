import '../utils/app_export.dart';

class RoundedBorderWithIconTextWidget extends StatelessWidget {
  final Color? color;
  final IconData icon;
  final String title;
  const RoundedBorderWithIconTextWidget({
    super.key,
    this.color,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: color ?? ColorConstant.red,
        ),
        borderRadius: const BorderRadius.all(Radius.circular(13)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: color ?? ColorConstant.red,
            size: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(
            title,
            style: AppStyle.txtRobotoMedium16DarkJungleGreen(context)
                .copyWith(color: color ?? ColorConstant.red),
          ),
        ],
      ),
    );
  }
}
