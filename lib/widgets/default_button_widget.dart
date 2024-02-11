import '../utils/app_export.dart';

class DefaultButtonWidget extends StatelessWidget {
  const DefaultButtonWidget({
    super.key,
    required this.buttonText,
    required this.onPressed,
    this.enable = true,
    this.isLoading = false,
    this.horizontal = 30,
    this.vertical = 20,
    this.singleColor,
    this.textColor,
    this.textSize = 15,
    this.height = 50,
    this.width = double.infinity,
  });

  final String buttonText;
  final Function()? onPressed;
  final bool enable;
  final bool isLoading;
  final double horizontal;
  final double vertical;
  final Color? singleColor;
  final Color? textColor;
  final double textSize;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    var borderRadius = BorderRadius.circular(40);
    return Container(
      width: width,
      height: height,
      margin: EdgeInsets.symmetric(
        horizontal: horizontal,
        vertical: vertical,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            singleColor ?? ColorConstant.copper,
            singleColor ?? ColorConstant.luxorGold,
            singleColor ?? ColorConstant.dullOrange,
            singleColor ?? ColorConstant.turmeric,
            singleColor ?? ColorConstant.naplesYellow,
          ],
        ),
        borderRadius: borderRadius,
      ),
      child: ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.transparent),
            elevation: MaterialStateProperty.all(0),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: borderRadius,
            ))),
        // style: ElevatedButton.styleFrom(
        //     elevation: 0,
        //     backgroundColor: Colors.transparent,
        //     shape: RoundedRectangleBorder(
        //       borderRadius: borderRadius,
        //     )),
        child: Text(
          buttonText,
          style: GoogleFonts.roboto(
              fontSize: textSize.sp,
              fontWeight: FontWeight.w700,
              color: textColor ?? Colors.white),
        ),
        onPressed: enable
            ? isLoading
                ? () {}
                : onPressed
            : null,
      ),
    );
  }
}
