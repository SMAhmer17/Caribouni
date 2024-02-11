// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class MySnackBar {
  static void successSnackbar(String message, BuildContext context) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(message: message.toString()),
    );
  }

  static void errorSnackbar(String message, BuildContext context) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(message: message.toString()),
    );
  }

  static void infoSnackbar(String message, BuildContext context) {
    return showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.info(message: message.toString()),
    );
  }
}
