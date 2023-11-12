import 'package:atoz/app/modules/splash_screen/views/splash_screen_view.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';



import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      getPages: AppPages.routes,
      home: const SplashScreen(),
      theme: ThemeData(
        fontFamily: 'Comfortaa',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme(
          color: Colors.white,
          elevation: 0,
        ),
      ),
    ),
  );
}
