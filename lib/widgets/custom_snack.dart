import 'package:flutter/material.dart';

SnackBar customSnack({required String text, required BuildContext ctx, Duration duration = const Duration(seconds: 2), SnackBarAction? action}) {
  return SnackBar(
      content: Text(text),
      duration: duration,
      backgroundColor: Colors.greenAccent,
      behavior: SnackBarBehavior.floating,
      elevation: 0,
      action: action,
    );
}
