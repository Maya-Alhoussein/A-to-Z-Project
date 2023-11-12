import 'package:atoz/app/data/models/restaurants.dart';
import 'package:atoz/app/routes/app_pages.dart';
import 'package:atoz/constants.dart';
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/restaurant_details_controller.dart';

class RestaurantDetailsView extends GetView<RestaurantDetailsController> {
  const RestaurantDetailsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantDetailsController>(builder: (controller) {
      return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(300),
          child: AppBar(
            centerTitle: true,
            title: Text(
              controller.restaurantModel.name??"",
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            flexibleSpace: ClipRRect(
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40)),
              child: Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/diverxo.png'),
                        fit: BoxFit.fill)),
              ),
            ),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(40),
                    bottomRight: Radius.circular(40))),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Column(
              children: [
                const SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.all(7.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${controller.restaurantModel.name}',
                              style: const TextStyle(fontSize: 20.0)),
                          const SizedBox(width: 60.0),
                          RatingBar.builder(
                              ignoreGestures: true,
                              unratedColor: Colors.grey[300],
                              itemSize: 20,
                              initialRating: (controller.restaurantModel.stars??0).toDouble(),
                              itemBuilder: (context, _) =>
                              const Icon(
                                Icons.star,
                                color: orange,
                              ),
                              onRatingUpdate: (rating) {})
                        ],
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          Expanded(
                            child: Text('${controller.restaurantModel.location} , ${controller.restaurantModel
                                .city!.name}',
                                style:
                                const TextStyle(
                                    fontSize: 15.0, color: Colors.black)),
                          ),
                          const SizedBox(width: 170.0),
                          Icon(Icons.visibility, color: Colors.grey[400],),
                          const SizedBox(width: 5,),
                          Text('${controller.restaurantModel.views}', style:
                          const TextStyle(fontSize: 15.0, color: Colors.black))
                        ],
                      ),

                      //type of tables
                      const Padding(
                        padding: EdgeInsets.only(top: 30.0, bottom: 8.0),
                        child: Text(
                          'type of tables',
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        width: 160,
                        height: 55,
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: const BorderSide(color: Colors.grey),
                            ),
                          ),
                          value: controller.selectedItem.value,
                          items: controller.items
                              .map((item) =>
                              DropdownMenuItem(
                                  value: item,
                                  child: Text(item,
                                      style: const TextStyle(fontSize: 15))))
                              .toList(),
                          onChanged: (item) {
                            controller.selectedItem.value = item as String;
                          },
                        ),
                      ),


                      const SizedBox(height: 50),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Text(
                            'open from ${controller.restaurantModel
                                .createdAt} to ${controller.restaurantModel.updatedAt}',
                            style: const TextStyle(fontSize: 18)),
                      ),
                      const SizedBox(height: 20),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 4.0),
                            child: Text(
                                'contact us : ${controller.restaurantModel.phoneNumber}',
                                style: const TextStyle(fontSize: 18)),
                          ),
                        ],
                      ),
                      const SizedBox(height: 100),
                      Row(
                        children: [
                          FavoriteButton(
                              isFavorite: false,
                              iconSize: 40,
                              valueChanged: () {
                                controller.savefave(true);
                              }
                          ),
                          SizedBox(width: 80),
                          Center(
                              child: FloatingActionButton.extended(
                                  onPressed: () {
                                    Get.toNamed(Routes.BOOK_RESTAURANT);
                                  },
                                  backgroundColor: orange,
                                  foregroundColor: Colors.black,
                                  label: const Text(
                                    'BOOK NOW',
                                  ))),


                        ],
                      ),


                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
