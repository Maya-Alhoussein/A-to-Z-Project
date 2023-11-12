import 'dart:async';

import 'package:atoz/app/modules/welcome1/views/welcome1_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SplashScreenController extends GetxController {
  State<StatefulWidget> createState() {
    return startTimer();
  }

  startTimer() async {
    var duration = const Duration(seconds: 3);
    return Timer(duration, authCheck);
  }

  final box = GetStorage();

  void authCheck() {
    if (box.read("userToken") != null) {
      Get.offNamed(Routes.HOME);
    } else {
      Get.offNamed(Routes.WELCOME2);
    }
  }

  @override
  void onInit() {
    super.onInit();
    startTimer();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
