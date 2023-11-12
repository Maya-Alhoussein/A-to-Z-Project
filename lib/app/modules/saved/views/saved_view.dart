import 'package:atoz/app/modules/saved_hotels/views/saved_hotels_view.dart';
import 'package:atoz/app/modules/saved_places/views/saved_places_view.dart';
import 'package:atoz/app/modules/saved_restaurants/views/saved_restaurants_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/saved_controller.dart';

class SavedView extends GetView<SavedController> {
  const SavedView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('your wishlist',
              style: TextStyle(color: Colors.white)),
          backgroundColor: const Color(0xffFF9114),
          leading: Builder(
            builder: (context) => IconButton(
              icon: const Icon(Icons.arrow_back),
              color: Colors.white,
              onPressed: () => Get.back(),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.hotel),
              ),
              Tab(
                icon: Icon(Icons.restaurant),
              ),
              Tab(
                icon: Icon(Icons.place_outlined),
              ),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            SavedHotelsView(),
            SavedRestaurantsView(),
            SavedPlacesView()
          ],
        ),
      ),
    );
  }
}
