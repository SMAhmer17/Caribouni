// ignore_for_file: use_build_context_synchronously

import 'package:intl/intl.dart';

import 'app_export.dart';

class UIhelper {
  static snackBar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      // backgroundColor: ColorConstant.red700,
      duration: const Duration(milliseconds: 500),
      content: Text(
        message,
      ),
    ));
  }

  static unFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static final currencyFormatter = NumberFormat("#,##0.00", "en_US");

  static String capitalize(String s) => s[0].toUpperCase() + s.substring(1);

  static formatedTime({required int time}) {
    int sec = time % 60;
    int min = (time / 60).floor();
    String minute = min.toString().length <= 1 ? "0$min" : "$min";
    String second = sec.toString().length <= 1 ? "0$sec" : "$sec";
    return "$minute : $second";
  }

  // static String currentDateWIthFormat({String format = TextValue.dateFormat}) {
  //   return DateFormat(format).format(DateTime.now());
  // }

  static BoxDecoration gradientBoxdecoration() {
    return BoxDecoration(
      shape: BoxShape.circle,
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          ColorConstant.darkViolet,
          ColorConstant.cadmiumOrange,
        ],
      ),
    );
  }
}
