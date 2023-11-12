import 'package:atoz/app/modules/flight/views/flight_view.dart';
import 'package:atoz/app/modules/place_list/views/place_list_view.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/constants.dart';


import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {


   HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,


          leading: Builder(
            builder: (context) =>
                IconButton(
                  icon: const Icon(
                    Icons.menu,
                    color: Colors.black,
                  ),
                  color: Colors.white,
                  onPressed: () {
                    Scaffold.of(context).openDrawer();
                  },
                ),
          ),
          title: const Text(
            'A To Z Travel',
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15.0, top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Lets start planning!',
                      style: TextStyle(
                        fontFamily: 'Comfortaa',
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, top: 80),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: double.infinity,
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () {
                              Get.toNamed(Routes.FLIGHT_LIST);
                            },
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    blurRadius: 7.0,
                                    // spreadRadius: 0.1,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              margin: const EdgeInsets.all(10.0),
                              padding: const EdgeInsets.all(13),
                              child: Image.asset(
                                  'assets/images/airplane_icon.png',
                                  width: 50,
                                  height: 50,
                                  fit: BoxFit.fill),
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                          ),
                          InkWell(
                            onTap: () => Get.toNamed(Routes.HOTELS_LIST),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                  20,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.7),
                                    blurRadius: 7.0,
                                    // spreadRadius: 0.1,
                                  ),
                                ],
                                color: Colors.white,
                              ),
                              margin: const EdgeInsets.all(8.0),
                              padding: const EdgeInsets.all(18),
                              child: Image.asset(
                                'assets/images/hotel_icon.png',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),

                    Center(
                      child: InkWell(
                        onTap: () => Get.toNamed(Routes.RESTAURANTS_LIST),
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              20,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                blurRadius: 7.0,
                                // spreadRadius: 0.1,
                              ),
                            ],
                            color: Colors.white,
                          ),
                          margin: const EdgeInsets.all(8.0),
                          padding: const EdgeInsets.all(15),
                          child: Image.asset(
                              'assets/images/restaurant_icon.png',
                              width: 50,
                              height: 50,
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        InkWell(
                          onTap: () => Get.toNamed(Routes.TAXI),
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 7.0,
                                  // spreadRadius: 0.1,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(15),
                            child: Image.asset('assets/images/car_icon.png',
                                width: 50, height: 50, fit: BoxFit.fill),
                          ),
                        ),
                        const SizedBox(
                          width: 40,
                        ),
                        InkWell(
                          onTap: () {
                           Get.toNamed(Routes.PLACE_LIST);
                          },
                          child: Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(
                                20,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.7),
                                  blurRadius: 7.0,
                                  // spreadRadius: 0.1,
                                ),
                              ],
                              color: Colors.white,
                            ),
                            margin: const EdgeInsets.all(8.0),
                            padding: const EdgeInsets.all(10),
                            child: Image.asset(
                                'assets/images/places.png',
                                width: 50,
                                height: 50,
                                fit: BoxFit.fill),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
               UserAccountsDrawerHeader(
                decoration: const BoxDecoration(color: orange),
                accountName: const Text(
                  'User Email',
                  style: TextStyle(
                      fontFamily: 'Comfortaa',
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                ),
                accountEmail: Text(
                 controller.getEmail(),
                  style: const TextStyle(
                    fontFamily: 'Comfortaa',
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ),
              ),

              ListTile(
                leading: const Icon(
                  Icons.account_circle,
                  color: Color(0xffff9114),
                ),
                title: const Text(
                  'My Profile',
                  style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.PROFILE);
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
              ListTile(
                leading: const Icon(
                  Icons.favorite,
                  color: Color(0xffff9114),
                ),
                title: const Text(
                  'Wishlist',
                  style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
                ),
                onTap: () {
                  Get.toNamed(Routes.SAVED);
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
              ),


              // SizedBox(height: 200,),
              ListTile(
                leading: const Icon(
                  Icons.logout,
                  color: Color(0xffff9114),
                ),
                title: const Text(
                  'Log Out',
                  style: TextStyle(fontFamily: 'Comfortaa', fontSize: 15),
                ),
                onTap: () {
                  Navigator.pop(context);
                  controller.performLogOut();
                },
              ),
              Container(
                height: 1,
                color: Colors.grey[300],
              ),
            ],
          ),
        ),
      );
    });
  }
}
