import 'package:flutter/material.dart';
import 'package:get/get.dart';


void showCustomSnackBar(String message, {bool isError = true, bool isPosition= false} ) {
  Get.showSnackbar(GetBar(
    backgroundColor: isError ? Colors.red : Colors.green,
    message: message,
    maxWidth: double.infinity,
    duration: Duration(seconds: 3),
    snackStyle: SnackStyle.FLOATING,
    margin: EdgeInsets.all(10),
    borderRadius: 10,
    isDismissible: true,

    snackPosition: isPosition?SnackPosition.BOTTOM:SnackPosition.TOP,


   // dismissDirection: SnackBar.HORIZONTAL,
  ));
}
