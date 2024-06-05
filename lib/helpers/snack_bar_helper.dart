// snack_bar_helper.dart

import 'package:flutter/material.dart';

class SnackBarHelper {
  // SnackBarHelper.show()
  static void show(
    BuildContext context, {
    required Widget content,
    Color? backgroundColor,
    Color? closeIconColor,
  }) {
    final snackbar = SnackBar(
      content: content,
      backgroundColor: backgroundColor ?? Colors.black,
      showCloseIcon: true,
      closeIconColor: closeIconColor ?? Colors.white,
      behavior: SnackBarBehavior.floating,
      dismissDirection: DismissDirection.startToEnd,
    );

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static void showError(BuildContext context, {required Widget content}) {
    show(
      context,
      content: content,
      backgroundColor: Colors.red[300],
      closeIconColor: Colors.red,
    );
  }

  static void showWarn(BuildContext context, {required Widget content}) {
    show(
      context,
      content: content,
      backgroundColor: Colors.orange[300],
      closeIconColor: Colors.orange,
    );
  }

  static void showInfo(BuildContext context, {required Widget content}) {
    show(
      context,
      content: content,
      backgroundColor: Colors.blue[300],
      closeIconColor: Colors.blue,
    );
  }
}
