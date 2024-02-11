import '../utils/app_export.dart';

class LocationWithIconWidget extends StatelessWidget {
  final String location;
  final Color? color;
  const LocationWithIconWidget({
    super.key,
    required this.location,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          Icons.location_on_outlined,
          color: color ?? ColorConstant.gainsboro,
          size: 15,
        ),
        Text(
          location,
          style: AppStyle.txtRobotoRegular16SantaGrey(context).copyWith(
              fontSize: 14.sp, color: color ?? ColorConstant.gainsboro),
        ),
      ],
    );
  }
}
