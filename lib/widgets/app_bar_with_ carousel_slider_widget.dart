import '../utils/app_export.dart';

class AppBarCarouselSliderWidget extends StatelessWidget
    implements PreferredSizeWidget {
  const AppBarCarouselSliderWidget({
    required this.title,
    this.isBackShow = false,
    super.key,
  });

  final String title;
  final bool isBackShow;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      systemOverlayStyle: SystemUiOverlayStyle(
        // Status bar color
        statusBarColor: ColorConstant.darkGold,
      ),
      elevation: 0,
      centerTitle: true,
      title: Text(title),
      titleTextStyle: AppStyle.txtRobotoBold20PurpleJam(context),
      backgroundColor: Colors.white,
      leading: isBackShow
          ? IconButton(
              icon: CircleAvatar(
                  backgroundColor: ColorConstant.gainsboro,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: ColorConstant.purpleJam,
                      size: 20,
                    ),
                  )),
              onPressed: () {
                UIhelper.unFocus();
                Navigator.of(context).pop();
              },
            )
          : Container(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
