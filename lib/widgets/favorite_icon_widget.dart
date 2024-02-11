import '../utils/app_export.dart';

class FavoriteIconWidget extends StatelessWidget {
  final Function() onPressed;
  const FavoriteIconWidget({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
          backgroundColor: ColorConstant.gainsboro,
          child: Icon(
            Icons.favorite_border,
            color: ColorConstant.purpleJam,
            size: 20,
          )),
      onPressed: onPressed,
    );
  }
}
