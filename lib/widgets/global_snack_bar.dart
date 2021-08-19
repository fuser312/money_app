import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GlobalSnackBar{
  final String title;
  final String message;

  const GlobalSnackBar({
    required this.title, required this.message,
  });
  static show(
      BuildContext context,
      String message,
      String title,
      ) {
     Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.green,
      borderRadius: 20,
      margin: EdgeInsets.all(15),
      colorText: Colors.white,
      duration: Duration(seconds: 4),
      isDismissible: true,
      dismissDirection: SnackDismissDirection.HORIZONTAL,
      forwardAnimationCurve: Curves.easeOutBack,
    );
  }
}