import 'package:atoz/app/data/models/restaurant_model.dart';
import 'package:atoz/app/modules/restaurant_details/controllers/restaurant_details_controller.dart';
import 'package:atoz/app/modules/restaurant_details/views/restaurant_details_view.dart';
import 'package:atoz/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import 'package:get/get.dart';

import '../controllers/restaurants_list_controller.dart';

class RestaurantsListView extends GetView<RestaurantsListController> {
  const RestaurantsListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RestaurantsListController>(builder: (controller) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: orange,
            title: const Text('Restaurants', ),
          ),
          body:(controller.isLoading)
              ? Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                CupertinoActivityIndicator(),
              ],
            ),
          )
              : (controller.isError)
              ? const Center(
            child: Text(
              "There is an error!!",
              style: TextStyle(fontSize: 22),
            ),
          )
              :  Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 13.0),
              child: GestureDetector(
                onTap: () {},
                child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.listRestaurants!.length,
                    itemBuilder: (context, index) =>
                        InkWell(
                          onTap: () {
                            Get.delete<RestaurantDetailsController>();
                            Get.put(RestaurantDetailsController(controller.listRestaurants![index]));
                            Get.to(()=>const RestaurantDetailsView());
                          },
                          child:   RestaurantCard(restaurantModel: controller.listRestaurants![index],),
                        )),
              )));
    });
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key, required this.restaurantModel})
      : super(key: key);
  final RestaurantModel restaurantModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              height: 100.0,
              width: 90.0,
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(width: 0),
                borderRadius: BorderRadius.circular(90),
              ),
              child:
              Image.network(
                restaurantModel.img??'',
                fit: BoxFit.fill,
                errorBuilder: (context, exception, stackTrace) {
                  return ClipRRect(
                      borderRadius: BorderRadius.circular(90),
                      child: Image.asset('assets/images/diverxo.png',
                          fit: BoxFit.cover));
                },
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 6,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(restaurantModel.name??"",
                style: const TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w900)),
            const SizedBox(height: 5),
            Text(restaurantModel.location!,
                style: TextStyle(fontSize: 15, color: Colors.grey[700])),
            const SizedBox(
              height: 5.0,
            ),
            RatingBar.builder(
              ignoreGestures: true,
                unratedColor: Colors.grey[300],
                itemSize: 20,
                initialRating: restaurantModel.stars?.toDouble()??0,
                itemBuilder: (context, _) =>
                const Icon(
                  Icons.star,
                  color: orange,
                ),
                onRatingUpdate: (rating) {})
          ],
        )
      ],
    );
  }
}
