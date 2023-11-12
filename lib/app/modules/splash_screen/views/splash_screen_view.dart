import 'dart:async';

import 'package:atoz/app/modules/splash_screen/controllers/splash_screen_controller.dart';
import 'package:atoz/app/modules/welcome2/views/welcome2_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends GetView<SplashScreenController> {
  const SplashScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    Get.put(SplashScreenController());
    return const Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: AssetImage('assets/images/logo.png'),
        ),
      ),
    );
  }
}







