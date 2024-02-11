// ignore_for_file: prefer_const_constructors

import '../utils/app_export.dart';

class AppBarCustomWidget extends StatelessWidget
    implements PreferredSizeWidget {
  AppBarCustomWidget(
      {required this.title,
      super.key,
      this.title2 = "",
      this.isMultiText = false,
      this.isColorChange = false,
      this.elevation = true});
  final String title;
  final String title2;
  final bool isMultiText;
  final bool isColorChange;
  final bool elevation;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
      decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: isColorChange ? Alignment.topCenter : Alignment.centerLeft,
            end: isColorChange ? Alignment.bottomCenter : Alignment.centerRight,
            colors: isColorChange
                ? [
                    ColorConstant.darkViolet,
                    ColorConstant.cadmiumOrange,
                  ]
                : [
                    ColorConstant.copper,
                    ColorConstant.luxorGold,
                    ColorConstant.dullOrange,
                    ColorConstant.turmeric,
                    ColorConstant.naplesYellow,
                  ],
          ),
          boxShadow: elevation
              ? [
                  BoxShadow(
                    color: ColorConstant.santaGrey,
                    blurRadius: 10.0,
                  )
                ]
              : null,
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: isMultiText
            ? Row(
                children: [
                  const BackButtonWidget(),
                  SizedBox(width: 5),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: AppStyle.txtRobotoBold18White(context)
                            .copyWith(color: ColorConstant.darkViolet),
                      ),
                      Text(
                        title2,
                        style: AppStyle.txtRobotoBold18White(context).copyWith(
                            color: ColorConstant.gainsboro, fontSize: 20.sp),
                      )
                    ],
                  ),
                  Spacer(),
                  Image.asset('assets/images/Group 16072.png'),
                  SizedBox(width: 15),
                ],
              )
            : Stack(children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: const BackButtonWidget()),
                Center(
                  child: Text(
                    title,
                    style: AppStyle.txtRobotoBold18White(context)
                        .copyWith(color: Colors.white),
                  ),
                ),
                isColorChange
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Image.asset('assets/images/Group 16072.png'),
                          SizedBox(width: 15),
                        ],
                      )
                    : Container(),
              ]),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(
      kToolbarHeight + (isMultiText || isColorChange ? 20 : 10));
}

class BackButtonWidget extends StatelessWidget {
  const BackButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: CircleAvatar(
          backgroundColor: ColorConstant.gainsboro,
          child: Padding(
            padding: const EdgeInsets.only(left: 5),
            child: Icon(
              Icons.arrow_back_ios,
              color: ColorConstant.purpleJam,
              size: 18,
            ),
          )),
      onPressed: () {
        UIhelper.unFocus();
        Navigator.of(context).pop();
      },
    );
  }
}
