import 'package:atoz/app/modules/home/views/home_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProfileController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xFFFF9114),
          titleSpacing: 85,
          title: const Text(
            'Your Profile',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Comfortaa',
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Container(
          height: double.infinity,
          color: const Color(0xFFFF9114),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // CircleAvatar(
                  //   backgroundImage: Image.asset(name),
                  // )

                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                        color: const Color(0xFFFF9114),
                        image: DecorationImage(
                          image: AssetImage('assets/images/profile.png'),
                        )),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                   Text(controller.getEmail(),
                      style: const TextStyle(
                        color: Colors.white,
                        fontFamily: 'Comfortaa',
                        fontWeight: FontWeight.bold,
                        fontSize: 23,
                      )),
                  const SizedBox(height: 130),

                  InkWell(
                    onTap: () => Get.toNamed(Routes.USER_HOTELS),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: const [
                          Text(
                            'Hotels you stayed at',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 110,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 1.0,
                    width: 311.0,
                    color: Colors.black,
                  ),

                  //SizedBox(height: 30,),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.USER_RESTAURANTS),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: const [
                          Text(
                            'Restaurants you went to',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 83,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),

                  Container(
                    height: 1.0,
                    width: 311.0,
                    color: Colors.black,
                  ),

                  //SizedBox(height: 30,),
                  InkWell(
                    onTap: () => Get.toNamed(Routes.USER_FLIGHTS),
                    child: SizedBox(
                      height: 50,
                      child: Row(
                        children: const [
                          Text(
                            'Flights you went on',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontFamily: 'Comfortaa',
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            width: 120,
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                  //SizedBox(height: 15,),
                  Container(
                    height: 1.0,
                    width: 311.0,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
